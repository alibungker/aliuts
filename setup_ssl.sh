#!/bin/bash
# Script untuk install Let's Encrypt SSL via CloudPanel

echo "=== Setup Let's Encrypt SSL untuk aliuts.bungker.co.id ==="
echo ""
echo "Jalankan command ini sebagai root:"
echo ""
echo "clpctl lets-encrypt:install:certificate --domainName=aliuts.bungker.co.id --emailAddress=admin@aliuts.bungker.co.id"
echo ""
echo "Atau melalui CloudPanel Web Interface:"
echo "1. Login ke https://123.108.97.200:8443"
echo "2. Site → aliuts.bungker.co.id → SSL/TLS"
echo "3. Klik 'New Certificate'"
echo "4. Pilih Let's Encrypt"
echo "5. Issue certificate"
