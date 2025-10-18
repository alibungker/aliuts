import os
import sys
import django
import google.generativeai as genai
from dotenv import load_dotenv

# Setup Django
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')

try:
    django.setup()
    # Import models setelah setup Django
    from academic.models import *
    from sip_kuliah.models import *
except Exception as e:
    print(f"Warning: Django setup failed: {e}")

# Load environment
load_dotenv()

class GeminiCLI:
    def __init__(self):
        self.api_key = os.getenv('GEMINI_API_KEY')
        if not self.api_key:
            raise ValueError("GEMINI_API_KEY not found in environment variables")
        
        genai.configure(api_key=self.api_key)
        self.model = genai.GenerativeModel('gemini-2.5-flash')
        
    def chat(self, prompt):
        """Interaksi dengan Gemini"""
        try:
            response = self.model.generate_content(prompt)
            return response.text
        except Exception as e:
            return f"Error: {str(e)}"
    
    def generate_code(self, description):
        """Generate code berdasarkan deskripsi"""
        prompt = f"""
        Sebagai assistant developer Django, generate code Python/Django untuk: {description}
        Berikan hanya code tanpa penjelasan tambahan.
        """
        return self.chat(prompt)
    
    def database_help(self, question):
        """Bantuan khusus database MySQL"""
        prompt = f"""
        Sebagai expert MySQL dan Django ORM, jawab pertanyaan: {question}
        Berikan contoh implementasi Django ORM jika relevan.
        """
        return self.chat(prompt)
    
    def debug_code(self, code, error):
        """Debug code Django"""
        prompt = f"""
        Debug kode Django berikut:
        
        Code: {code}
        
        Error: {error}
        
        Berikan solusi perbaikan.
        """
        return self.chat(prompt)

def main():
    try:
        cli = GeminiCLI()
        print("=== Gemini CLI untuk SIMKuliah ===")
        print("Commands: chat, code, db, debug, exit")
        
        while True:
            try:
                command = input("\n>>> ").strip().lower()
                
                if command == 'exit':
                    break
                elif command == 'chat':
                    prompt = input("Pertanyaan: ")
                    print(cli.chat(prompt))
                elif command == 'code':
                    desc = input("Deskripsi code: ")
                    print(cli.generate_code(desc))
                elif command == 'db':
                    question = input("Pertanyaan database: ")
                    print(cli.database_help(question))
                elif command == 'debug':
                    code = input("Masukkan code: ")
                    error = input("Error message: ")
                    print(cli.debug_code(code, error))
                else:
                    print("Command tidak dikenali. Gunakan: chat, code, db, debug, exit")
                    
            except KeyboardInterrupt:
                print("\nGoodbye!")
                break
            except Exception as e:
                print(f"Error: {e}")
                
    except Exception as e:
        print(f"Failed to initialize Gemini CLI: {e}")
        print("Please check your GEMINI_API_KEY in .env file")

if __name__ == "__main__":
    main()
