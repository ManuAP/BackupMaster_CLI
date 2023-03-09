#!/bin/bash

## Variables ##
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +%Y%m%d)
BACKUP_DIR_DATE="$BACKUP_DIR/$DATE"
MYSQL_USER="mysql_user"
MYSQL_PASSWORD="mysql_password"
PGSQL_USER="pgsql_user"
PGSQL_PASSWORD="pgsql_password"
S3_BUCKET="s3://my-bucket/backups/"
S3_REGION="us-west-2"

## Funciones ##
function create_backup_directory {
  if [ ! -d "$BACKUP_DIR_DATE" ]; then
    mkdir "$BACKUP_DIR_DATE"
  fi
}

function backup_files {
  tar -cvzf "$BACKUP_DIR_DATE/files.tar.gz" /path/to/backup/files
}

function backup_mysql {
  mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --all-databases | gzip > "$BACKUP_DIR_DATE/mysql.sql.gz"
}

function backup_postgres {
  sudo -u postgres pg_dumpall | gzip > "$BACKUP_DIR_DATE/postgres.sql.gz"
}

function transfer_to_s3 {
  aws s3 cp "$BACKUP_DIR_DATE" "$S3_BUCKET" --recursive --region "$S3_REGION"
}

## Ejecución del script ##
create_backup_directory
backup_files
backup_mysql
backup_postgres
transfer_to_s3

## Fin del script ##
