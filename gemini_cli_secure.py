import os
import sys
import subprocess
import google.generativeai as genai
from dotenv import load_dotenv
from pathlib import Path

load_dotenv()

class SecureGeminiCLI:
    def __init__(self):
        self.api_key = os.getenv('GEMINI_API_KEY')
        if not self.api_key:
            raise ValueError("GEMINI_API_KEY tidak ditemukan")
        
        genai.configure(api_key=self.api_key)
        self.model = genai.GenerativeModel('gemini-2.5-flash')
        
        # DEFINI AREA KERJA AMAN
        self.allowed_directories = [
            '/home/aliuts/htdocs/aliuts.bungker.co.id',
            '/home/aliuts/htdocs/aliuts.bungker.co.id/academic',
            '/home/aliuts/htdocs/aliuts.bungker.co.id/sip_kuliah'
        ]
        
        # PERINTAH YANG DIIZINKAN
        self.allowed_commands = [
            'ls', 'pwd', 'cat', 'head', 'tail', 'grep', 'find',
            'python', 'python3', 'pip', 'django-admin', 'manage.py'
        ]
        
        # FILE YANG DILARANG
        self.forbidden_files = [
            '.env', '.htpasswd', '*.key', '*.pem', '*.crt',
            '/etc/', '/root/', '/var/log/', '/sys/', '/proc/'
        ]
    
    def is_path_allowed(self, path):
        """Validasi apakah path diizinkan"""
        try:
            abs_path = os.path.abspath(path)
            for allowed_dir in self.allowed_directories:
                if abs_path.startswith(allowed_dir):
                    return True
            return False
        except:
            return False
    
    def is_command_allowed(self, command):
        """Validasi apakah command diizinkan"""
        cmd_base = command.split()[0] if command.split() else command
        return cmd_base in self.allowed_commands
    
    def read_file_safe(self, file_path):
        """Membaca file dengan validasi keamanan"""
        if not self.is_path_allowed(file_path):
            return f"❌ ERROR: Akses ditolak untuk file: {file_path}"
        
        if not os.path.exists(file_path):
            return f"❌ ERROR: File tidak ditemukan: {file_path}"
        
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except Exception as e:
            return f"❌ ERROR: Gagal membaca file: {e}"
    
    def list_directory_safe(self, dir_path="."):
        """List directory dengan validasi keamanan"""
        if not self.is_path_allowed(dir_path):
            return f"❌ ERROR: Akses ditolak untuk directory: {dir_path}"
        
        try:
            items = os.listdir(dir_path)
            result = []
            for item in items:
                full_path = os.path.join(dir_path, item)
                if os.path.isdir(full_path):
                    result.append(f"📁 {item}/")
                else:
                    result.append(f"📄 {item}")
            return "\n".join(result)
        except Exception as e:
            return f"❌ ERROR: Gagal list directory: {e}"
    
    def execute_command_safe(self, command):
        """Eksekusi command dengan validasi keamanan"""
        if not self.is_command_allowed(command):
            return f"❌ ERROR: Command tidak diizinkan: {command}"
        
        try:
            # Batasi waktu eksekusi
            result = subprocess.run(
                command, 
                shell=True, 
                capture_output=True, 
                text=True,
                timeout=30,  # Timeout 30 detik
                cwd='/home/aliuts/htdocs/aliuts.bungker.co.id'  # Working directory tetap
            )
            
            output = ""
            if result.stdout:
                output += f"STDOUT:\n{result.stdout}\n"
            if result.stderr:
                output += f"STDERR:\n{result.stderr}\n"
            if result.returncode != 0:
                output += f"EXIT CODE: {result.returncode}"
            
            return output if output else "Command executed (no output)"
            
        except subprocess.TimeoutExpired:
            return "❌ ERROR: Command timeout (lebih dari 30 detik)"
        except Exception as e:
            return f"❌ ERROR: Gagal eksekusi command: {e}"
    
    def get_project_info(self):
        """Mendapatkan informasi project"""
        info = []
        info.append("📊 PROJECT INFORMATION:")
        info.append(f"Working Directory: {os.getcwd()}")
        info.append(f"Python: {sys.version}")
        info.append("\n📁 ALLOWED DIRECTORIES:")
        for dir in self.allowed_directories:
            info.append(f"  - {dir}")
        info.append("\n⚡ ALLOWED COMMANDS:")
        for cmd in self.allowed_commands:
            info.append(f"  - {cmd}")
        return "\n".join(info)
    
    def analyze_code(self, file_path):
        """Analisis kode dengan Gemini"""
        if not self.is_path_allowed(file_path):
            return "❌ ERROR: Akses file ditolak"
        
        try:
            content = self.read_file_safe(file_path)
            if content.startswith("❌ ERROR"):
                return content
            
            prompt = f"""
            Analisis kode Django berikut dan berikan saran perbaikan:
            
            File: {file_path}
            
            Kode:
            ```python
            {content}
            ```
            
            Berikan analisis:
            1. Potensi bug
            2. Best practices yang dilanggar  
            3. Saran optimasi
            4. Security issues
            """
            
            return self.chat(prompt)
        except Exception as e:
            return f"❌ ERROR: Gagal menganalisis kode: {e}"
    
    def chat(self, prompt):
        """Interaksi dengan Gemini"""
        try:
            response = self.model.generate_content(prompt)
            return response.text
        except Exception as e:
            return f"❌ ERROR: {str(e)}"

def main():
    try:
        cli = SecureGeminiCLI()
        print("🔐 SECURE GEMINI CLI - SIMKULIAH")
        print("=" * 50)
        print(cli.get_project_info())
        print("=" * 50)
        
        while True:
            try:
                print("\n🛠️  COMMANDS: info, ls [dir], read <file>, run <command>, analyze <file>, chat, exit")
                user_input = input("\n>>> ").strip()
                
                if not user_input:
                    continue
                    
                parts = user_input.split()
                command = parts[0].lower()
                
                if command == 'exit':
                    print("👋 Goodbye!")
                    break
                    
                elif command == 'info':
                    print(cli.get_project_info())
                    
                elif command == 'ls':
                    dir_path = parts[1] if len(parts) > 1 else "."
                    print(cli.list_directory_safe(dir_path))
                    
                elif command == 'read':
                    if len(parts) < 2:
                        print("❌ Usage: read <file_path>")
                    else:
                        file_path = parts[1]
                        print(cli.read_file_safe(file_path))
                        
                elif command == 'run':
                    if len(parts) < 2:
                        print("❌ Usage: run <command>")
                    else:
                        cmd = " ".join(parts[1:])
                        print(cli.execute_command_safe(cmd))
                        
                elif command == 'analyze':
                    if len(parts) < 2:
                        print("❌ Usage: analyze <file_path>")
                    else:
                        file_path = parts[1]
                        print("🤔 Menganalisis kode...")
                        print(cli.analyze_code(file_path))
                        
                elif command == 'chat':
                    prompt = input("💭 Pertanyaan: ")
                    print(f"\n💡 Response:\n{cli.chat(prompt)}")
                    
                else:
                    print("❌ Command tidak dikenali")
                    
            except KeyboardInterrupt:
                print("\n👋 Goodbye!")
                break
            except Exception as e:
                print(f"❌ Error: {e}")
                
    except Exception as e:
        print(f"❌ Gagal inisialisasi: {e}")

if __name__ == "__main__":
    main()
