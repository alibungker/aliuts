import os
import sys
import subprocess
import django
from dotenv import load_dotenv

# Setup Django
sys.path.append('/home/aliuts/htdocs/aliuts.bungker.co.id')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
django.setup()

from django.core.management import execute_from_command_line
from django.conf import settings

load_dotenv()

class DjangoGeminiManager:
    def __init__(self):
        self.project_root = '/home/aliuts/htdocs/aliuts.bungker.co.id'
        self.allowed_actions = [
            'check', 'makemigrations', 'migrate', 'showmigrations',
            'createsuperuser', 'collectstatic', 'test'
        ]
    
    def run_management_command(self, command, *args):
        """Jalankan Django management command"""
        if command not in self.allowed_actions:
            return f"❌ Management command tidak diizinkan: {command}"
        
        try:
            # Simulate running management command
            cmd_args = ['manage.py', command] + list(args)
            original_argv = sys.argv
            sys.argv = cmd_args
            
            # Capture output
            from io import StringIO
            from django.core.management import call_command
            
            output = StringIO()
            call_command(command, *args, stdout=output)
            result = output.getvalue()
            
            sys.argv = original_argv
            return result if result else f"✅ {command} executed successfully"
            
        except Exception as e:
            return f"❌ Error executing {command}: {str(e)}"
    
    def get_django_info(self):
        """Dapatkan informasi Django project"""
        info = []
        info.append("🎯 DJANGO PROJECT INFO:")
        info.append(f"Django Version: {django.get_version()}")
        info.append(f"Project Root: {self.project_root}")
        info.append(f"Debug Mode: {settings.DEBUG}")
        info.append(f"Installed Apps: {len(settings.INSTALLED_APPS)}")
        info.append(f"Database: {settings.DATABASES['default']['ENGINE']}")
        info.append(f"Allowed Hosts: {settings.ALLOWED_HOSTS}")
        return "\n".join(info)
    
    def check_system_health(self):
        """Cek kesehatan sistem"""
        checks = []
        
        # Check database
        try:
            from django.db import connection
            with connection.cursor() as cursor:
                cursor.execute("SELECT 1")
            checks.append("✅ Database connection: OK")
        except Exception as e:
            checks.append(f"❌ Database connection: {e}")
        
        # Check migrations
        try:
            from django.core.management import call_command
            from io import StringIO
            output = StringIO()
            call_command('showmigrations', '--list', stdout=output)
            migrations = output.getvalue()
            checks.append("✅ Migrations check: OK")
        except Exception as e:
            checks.append(f"❌ Migrations check: {e}")
        
        # Check static files
        checks.append(f"✅ Static URL: {settings.STATIC_URL}")
        checks.append(f"✅ Media URL: {settings.MEDIA_URL}")
        
        return "\n".join(["🔍 SYSTEM HEALTH CHECK:"] + checks)

def main():
    manager = DjangoGeminiManager()
    
    print("🚀 DJANGO GEMINI MANAGER")
    print("=" * 50)
    print(manager.get_django_info())
    print("=" * 50)
    
    while True:
        print("\n🛠️  DJANGO COMMANDS: info, health, run <command>, exit")
        user_input = input("\ndjango>>> ").strip()
        
        if user_input == 'exit':
            break
        elif user_input == 'info':
            print(manager.get_django_info())
        elif user_input == 'health':
            print(manager.check_system_health())
        elif user_input.startswith('run '):
            command = user_input[4:].strip()
            parts = command.split()
            if parts:
                result = manager.run_management_command(parts[0], *parts[1:])
                print(result)
        else:
            print("❌ Command tidak dikenali")

if __name__ == "__main__":
    main()
