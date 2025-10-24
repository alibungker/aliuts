#!/bin/bash
cd /home/aliuts/htdocs/aliuts.bungker.co.id
export PYTHONPATH="/home/aliuts/htdocs/aliuts.bungker.co.id:$PYTHONPATH"
exec /home/aliuts/htdocs/aliuts.bungker.co.id/venv/bin/gunicorn \
          --workers 3 \
          --bind 127.0.0.1:8092 \
          --timeout 60 \
          --access-logfile /home/aliuts/logs/gunicorn-access.log \
          --error-logfile /home/aliuts/logs/gunicorn-error.log \
          --log-level info \
          sip_kuliah.wsgi:application