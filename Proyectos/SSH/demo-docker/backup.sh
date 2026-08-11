#!/bin/bash
# Script de backup automatico
# ADVERTENCIA: esto es un ejemplo de LO QUE NO SE DEBE HACER
sshdemo-postgres-1
DB_HOST="103.199.187.160"
DB_USER="admin"
DB_NAME="empresa"
SSH_KEY="/root/.ssh/id_ed25519"   # <-- llave privada hardcodeada

echo "[*] Conectando al servidor de base de datos..."
ssh -i $SSH_KEY -o StrictHostKeyChecking=no umbral@$DB_HOST \
  "docker exec demo-postgres pg_dump -U admin empresa" > backup.sql

echo "[+] Backup guardado en backup.sql"