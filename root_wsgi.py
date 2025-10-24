import sys
import os

# Tambahkan direktori utama ke path python
sys.path.insert(0, '/home/aliuts/htdocs/aliuts.bungker.co.id')

# Set environment untuk Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'sip_kuliah.settings')

# Import dan setup Django
import django
django.setup()

# Import WSGI application
from sip_kuliah.wsgi import application