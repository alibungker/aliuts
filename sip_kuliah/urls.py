from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from academic import views as academic_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('admin/logout/', academic_views.custom_logout, name='admin_logout'),
    path('', include('academic.urls')),
    path('login/', academic_views.custom_login, name='login'),
    path('logout/', academic_views.custom_logout, name='logout'),
]

# Serve media files in development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
else:
    # In production, serve media files
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
