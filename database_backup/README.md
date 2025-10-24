# Database Backup SIAKAD

## Backup Information
- **Database Name**: aliuts
- **Backup Date**: 2025-10-25 03:09:07 UTC
- **MySQL/MariaDB Version**: 11.4.8-MariaDB
- **Backup Method**: mariadb-dump with single-transaction
- **Compression**: gzip

## Files
- `aliuts_backup_20251025_030907.sql.gz` - Compressed backup file (65KB)
- `aliuts_backup_20251025_030902.sql` - Uncompressed backup file (230KB)

## Backup Details
- Complete database structure and data
- Includes routines and triggers
- Transactionally consistent backup
- Character set: utf8mb4

## Restore Instructions
```bash
# Extract if needed
gunzip aliuts_backup_20251025_030907.sql.gz

# Restore database
mariadb -u aliuts -p'aliuts123' < aliuts_backup_20251025_030907.sql
```

## Database Configuration
- Host: localhost
- Port: 3306
- User: aliuts
- Database: aliuts

---
*Backup created on 2025-10-25 by SIAKAD system*