# Panduan Setup SIAKAD di CloudPanel

## Status Saat Ini
✅ Django SIAKAD sudah berjalan
✅ Gunicorn running di port 8092
✅ Nginx reverse proxy sudah dikonfigurasi
⚠️ SSL Certificate masih self-signed (perlu diganti dengan Let's Encrypt)

## Langkah-langkah Setup

### 1. Fix SSL Certificate (PENTING!)

**Via CloudPanel Web Interface (RECOMMENDED):**
1. Login ke CloudPanel: https://123.108.97.200:8443
2. Pergi ke **Sites** → **aliuts.bungker.co.id**
3. Klik tab **SSL/TLS**
4. Klik **Actions** → **New Let's Encrypt Certificate**
5. Isi email Anda
6. Klik **Create and Install**
7. Tunggu beberapa detik, certificate akan otomatis ter-install

**Via Command Line (Alternative):**
```bash
sudo su -
clpctl lets-encrypt:install:certificate \
  --domainName=aliuts.bungker.co.id \
  --emailAddress=admin@aliuts.bungker.co.id
```

### 2. Setup Gunicorn sebagai Systemd Service

Agar Gunicorn otomatis start saat server reboot:

```bash
# Copy service file ke systemd
sudo cp /home/aliuts/htdocs/aliuts.bungker.co.id/gunicorn.service /etc/systemd/system/siakad.service

# Reload systemd
sudo systemctl daemon-reload

# Enable service agar auto-start
sudo systemctl enable siakad.service

# Start service
sudo systemctl start siakad.service

# Check status
sudo systemctl status siakad.service
```

**Perintah Useful:**
```bash
# Restart aplikasi setelah update code
sudo systemctl restart siakad.service

# Stop aplikasi
sudo systemctl stop siakad.service

# View logs
sudo journalctl -u siakad.service -f
```

### 3. Update Nginx Vhost (Optional)

Jika perlu custom vhost configuration:

1. Login ke CloudPanel: https://123.108.97.200:8443
2. Pergi ke **Sites** → **aliuts.bungker.co.id** → **Vhost**
3. Klik **Edit**
4. Paste konfigurasi dari file `nginx_vhost_recommended.conf`
5. Save

Atau edit langsung:
```bash
sudo nano /etc/nginx/sites-enabled/aliuts.bungker.co.id.conf
sudo nginx -t  # Test konfigurasi
sudo systemctl reload nginx  # Reload nginx
```

### 4. Set Django Production Settings

Update settings untuk production:

```bash
# Edit .env file
nano /home/aliuts/htdocs/aliuts.bungker.co.id/.env
```

Tambahkan/update:
```
DEBUG=False
SECRET_KEY=your-very-secret-key-here-change-this
ALLOWED_HOSTS=aliuts.bungker.co.id,www.aliuts.bungker.co.id
```

### 5. Collect Static Files (Sudah dilakukan)

```bash
cd /home/aliuts/htdocs/aliuts.bungker.co.id
./venv/bin/python manage.py collectstatic --noinput
```

### 6. Verifikasi Setup

1. **Test SSL:** https://www.ssllabs.com/ssltest/analyze.html?d=aliuts.bungker.co.id
2. **Check Website:** https://aliuts.bungker.co.id
3. **Check Admin:** https://aliuts.bungker.co.id/admin/

## Informasi Akses

### Admin Panel
- URL: https://aliuts.bungker.co.id/admin/
- Username: `admin`
- Password: `admin123`

### CloudPanel
- URL: https://123.108.97.200:8443
- Manage SSL, Vhost, Database, dll

### File Locations
- **Application:** `/home/aliuts/htdocs/aliuts.bungker.co.id/`
- **Virtual Environment:** `/home/aliuts/htdocs/aliuts.bungker.co.id/venv/`
- **Static Files:** `/home/aliuts/htdocs/aliuts.bungker.co.id/staticfiles/`
- **Nginx Config:** `/etc/nginx/sites-enabled/aliuts.bungker.co.id.conf`
- **Nginx Logs:** `/home/aliuts/logs/nginx/`
- **Gunicorn Logs:** `/home/aliuts/logs/gunicorn-*.log`

### Gunicorn Service
- **Service Name:** `siakad.service`
- **Port:** 8092
- **Workers:** 3

## Troubleshooting

### SSL Error
Jika masih error SSL, pastikan:
- Domain sudah pointing ke IP server
- Firewall allow port 80 & 443
- Run Let's Encrypt setup dari CloudPanel

### 502 Bad Gateway
```bash
# Check Gunicorn status
sudo systemctl status siakad.service

# Restart Gunicorn
sudo systemctl restart siakad.service

# Check logs
tail -f /home/aliuts/logs/gunicorn-error.log
```

### Static Files Not Loading
```bash
# Collect static files again
cd /home/aliuts/htdocs/aliuts.bungker.co.id
./venv/bin/python manage.py collectstatic --noinput

# Check permissions
sudo chown -R aliuts:aliuts /home/aliuts/htdocs/aliuts.bungker.co.id/
```

### Database Error
```bash
# Check MySQL
sudo systemctl status mysql

# Test connection
./venv/bin/python manage.py dbshell
```

## Update Aplikasi

Setelah update code:
```bash
cd /home/aliuts/htdocs/aliuts.bungker.co.id

# Pull latest code (jika pakai git)
git pull

# Install dependencies (jika ada)
./venv/bin/pip install -r requirements.txt

# Run migrations
./venv/bin/python manage.py migrate

# Collect static files
./venv/bin/python manage.py collectstatic --noinput

# Restart Gunicorn
sudo systemctl restart siakad.service
```

## Backup

### Backup Database
```bash
mysqldump -u aliuts -p aliuts > backup_$(date +%Y%m%d).sql
```

### Backup Files
```bash
tar -czf siakad_backup_$(date +%Y%m%d).tar.gz /home/aliuts/htdocs/aliuts.bungker.co.id/
```

## Support

Jika ada masalah, cek:
1. Gunicorn logs: `/home/aliuts/logs/gunicorn-error.log`
2. Nginx logs: `/home/aliuts/logs/nginx/error.log`
3. Django logs: Check `DEBUG=True` temporarily untuk detail error
