from django import forms
from .models import KRS, Nilai, Mahasiswa, Kelas
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField()
    
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

class MahasiswaRegistrationForm(forms.ModelForm):
    class Meta:
        model = Mahasiswa
        fields = ['nim', 'nama', 'program_studi', 'angkatan', 'no_telp']

class KRSForm(forms.ModelForm):
    class Meta:
        model = KRS
        fields = ['kelas']
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['kelas'].queryset = Kelas.objects.all()

class NilaiForm(forms.ModelForm):
    class Meta:
        model = Nilai
        fields = ['nilai_huruf', 'nilai_angka']
