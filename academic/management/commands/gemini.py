from django.core.management.base import BaseCommand
from django.conf import settings
import google.generativeai as genai
import os

class Command(BaseCommand):
    help = 'CLI untuk berinteraksi dengan Gemini AI'
    
    def add_arguments(self, parser):
        parser.add_argument('prompt', type=str, help='Prompt untuk Gemini')
        parser.add_argument(
            '--type',
            type=str,
            choices=['chat', 'code', 'db', 'debug'],
            default='chat',
            help='Tipe interaksi'
        )
    
    def handle(self, *args, **options):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        model = genai.GenerativeModel('gemini-pro')
        
        prompt = options['prompt']
        interaction_type = options['type']
        
        # Custom prompts berdasarkan type
        if interaction_type == 'code':
            prompt = f"Generate Django code untuk: {prompt}. Berikan hanya code."
        elif interaction_type == 'db':
            prompt = f"Bantuan database MySQL/Django ORM: {prompt}. Berikan contoh implementasi."
        elif interaction_type == 'debug':
            prompt = f"Debug kode Django: {prompt}. Berikan solusi."
        
        try:
            response = model.generate_content(prompt)
            self.stdout.write(
                self.style.SUCCESS('Response Gemini:')
            )
            self.stdout.write(response.text)
        except Exception as e:
            self.stderr.write(
                self.style.ERROR(f'Error: {str(e)}')
            )
