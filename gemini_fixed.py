import os
import google.generativeai as genai
from dotenv import load_dotenv

load_dotenv()

class FixedGeminiCLI:
    def __init__(self):
        self.api_key = os.getenv('GEMINI_API_KEY')
        if not self.api_key:
            print("❌ ERROR: GEMINI_API_KEY tidak ditemukan di file .env")
            print("💡 Pastikan Anda sudah:")
            print("   1. Mendapatkan API key dari https://makersuite.google.com/app/apikey")
            print("   2. Menambahkannya ke file .env: GEMINI_API_KEY=your_actual_key_here")
            return
        
        try:
            # Configure dengan options yang lebih spesifik
            genai.configure(
                api_key=self.api_key,
                transport='rest',  # Gunakan REST transport
            )
            
            # List available models untuk debugging
            print("🔍 Mencari model yang tersedia...")
            available_models = genai.list_models()
            
            # Cari model Gemini yang tersedia
            gemini_models = []
            for model in available_models:
                if 'gemini' in model.name.lower():
                    gemini_models.append(model.name)
                    print(f"   ✅ Model ditemukan: {model.name}")
            
            if not gemini_models:
                print("❌ Tidak ada model Gemini yang ditemukan")
                return
            
            # Pilih model yang tersedia
            # Prioritaskan model terbaru
            model_name = None
            for preferred in ['gemini-1.5-flash', 'gemini-1.5-pro', 'gemini-pro', 'models/gemini-pro']:
                if any(preferred in model for model in gemini_models):
                    model_name = preferred
                    break
            
            if not model_name:
                model_name = gemini_models[0]  # Gunakan model pertama yang tersedia
            
            print(f"🤖 Menggunakan model: {model_name}")
            self.model = genai.GenerativeModel(model_name)
            print("✅ Gemini CLI berhasil diinisialisasi!")
            
        except Exception as e:
            print(f"❌ Error inisialisasi Gemini: {e}")
            print("💡 Cek:")
            print("   - API key valid")
            print("   - Koneksi internet")
            print("   - Akses ke Google Generative AI API")
            return
        
    def chat(self, prompt):
        if not hasattr(self, 'model'):
            return "Gemini tidak terinisialisasi. Cek konfigurasi."
        
        try:
            # Generate content dengan safety settings
            response = self.model.generate_content(
                prompt,
                safety_settings=[
                    {
                        "category": "HARM_CATEGORY_HARASSMENT",
                        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
                    },
                    {
                        "category": "HARM_CATEGORY_HATE_SPEECH", 
                        "threshold": "BLOCK_MEDIUM_AND_ABOVE"
                    }
                ]
            )
            return response.text
        except Exception as e:
            return f"❌ Error: {str(e)}"

def test_gemini():
    """Test koneksi Gemini"""
    print("🧪 Testing Gemini Connection...")
    cli = FixedGeminiCLI()
    
    if not hasattr(cli, 'model'):
        print("❌ Test gagal: Gemini tidak terinisialisasi")
        return False
    
    # Test dengan prompt sederhana
    test_prompt = "Halo! Tolong jawab dengan singkat: Apa warna langit?"
    print(f"📤 Mengirim test prompt: {test_prompt}")
    
    try:
        response = cli.chat(test_prompt)
        print(f"📥 Response: {response}")
        print("✅ Test berhasil! Gemini terhubung dengan baik.")
        return True
    except Exception as e:
        print(f"❌ Test gagal: {e}")
        return False

def main():
    if not test_gemini():
        return
    
    cli = FixedGeminiCLI()
    
    if not hasattr(cli, 'model'):
        return
    
    print("\n" + "="*50)
    print("🚀 Gemini CLI untuk SIMKuliah - FIXED VERSION")
    print("="*50)
    print("Commands: chat, code, db, debug, exit")
    
    while True:
        try:
            command = input("\n🤖 Command >>> ").strip().lower()
            
            if command == 'exit':
                print("👋 Sampai jumpa!")
                break
            elif command == 'chat':
                prompt = input("💬 Pertanyaan: ")
                print(f"\n💡 Response:\n{cli.chat(prompt)}")
            elif command == 'code':
                desc = input("💻 Deskripsi code: ")
                prompt = f"Sebagai assistant developer Django, generate code Python/Django untuk: {desc}. Berikan hanya code tanpa penjelasan tambahan."
                print(f"\n💡 Generated Code:\n{cli.chat(prompt)}")
            elif command == 'db':
                question = input("🗃️ Pertanyaan database: ")
                prompt = f"Sebagai expert MySQL dan Django ORM, jawab pertanyaan: {question}. Berikan contoh implementasi Django ORM jika relevan."
                print(f"\n💡 Database Help:\n{cli.chat(prompt)}")
            elif command == 'debug':
                code = input("🐛 Masukkan code: ")
                error = input("❌ Error message: ")
                prompt = f"Debug kode Django berikut:\n\nCode: {code}\n\nError: {error}\n\nBerikan solusi perbaikan."
                print(f"\n💡 Debug Solution:\n{cli.chat(prompt)}")
            else:
                print("❌ Command tidak dikenali. Gunakan: chat, code, db, debug, exit")
                
        except KeyboardInterrupt:
            print("\n👋 Goodbye!")
            break
        except Exception as e:
            print(f"❌ Error: {e}")

if __name__ == "__main__":
    main()
