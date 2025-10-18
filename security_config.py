"""
Konfigurasi keamanan untuk Gemini CLI
"""

# Direktori yang diizinkan
ALLOWED_DIRECTORIES = [
    '/home/aliuts/htdocs/aliuts.bungker.co.id',
    '/home/aliuts/htdocs/aliuts.bungker.co.id/academic',
    '/home/aliuts/htdocs/aliuts.bungker.co.id/sip_kuliah',
    '/home/aliuts/htdocs/aliuts.bungker.co.id/static',
    '/home/aliuts/htdocs/aliuts.bungker.co.id/media'
]

# Perintah yang diizinkan
ALLOWED_COMMANDS = [
    'ls', 'pwd', 'cat', 'head', 'tail', 'grep', 'find',
    'python', 'python3', 'pip', 'django-admin', 'manage.py'
]

# Ekstensi file yang diizinkan untuk dibaca
ALLOWED_FILE_EXTENSIONS = [
    '.py', '.html', '.css', '.js', '.json', '.txt', 
    '.md', '.yml', '.yaml', '.xml', '.csv'
]

# File yang dilarang
FORBIDDEN_FILES = [
    '.env', '.htpasswd', '*.key', '*.pem', '*.crt',
    '*.sqlite3', '*.db', 'passwd', 'shadow'
]

# Direktori sistem yang dilarang
FORBIDDEN_DIRECTORIES = [
    '/etc/', '/root/', '/var/log/', '/sys/', '/proc/',
    '/boot/', '/dev/', '/usr/bin/', '/bin/', '/sbin/'
]

def validate_file_access(file_path):
    """Validasi akses file"""
    import os
    abs_path = os.path.abspath(file_path)
    
    # Cek direktori terlarang
    for forbidden_dir in FORBIDDEN_DIRECTORIES:
        if abs_path.startswith(forbidden_dir):
            return False
    
    # Cek ekstensi file
    _, ext = os.path.splitext(abs_path)
    if ext.lower() not in ALLOWED_FILE_EXTENSIONS:
        return False
    
    # Cek nama file terlarang
    filename = os.path.basename(abs_path)
    for pattern in FORBIDDEN_FILES:
        if pattern.startswith('*'):
            if filename.endswith(pattern[1:]):
                return False
        elif filename == pattern:
            return False
    
    return True
