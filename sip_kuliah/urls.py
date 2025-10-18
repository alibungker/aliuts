from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from academic import views as academic_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('academic.urls')),
    path('login/', academic_views.custom_login, name='login'),
    path('logout/', academic_views.custom_logout, name='logout'),
]
