#!/bin/bash

# Colores
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

echo -e "${CYAN}${BOLD}[*] Iniciando la instalación de JakiTTL...${NC}"

# 1. Dar permisos de ejecución al script de Python
if [ -f "jakittl.py" ]; then
    chmod +x jakittl.py
    echo -e "${CYAN}[+] Configurando permisos de ejecución...${NC}"
else
    echo -e "${RED}[!] Error: No se encuentra jakittl.py en este directorio.${NC}"
    exit 1
fi

# 2. Mover al directorio binario del sistema
echo -e "${CYAN}[+] Moviendo a /usr/local/bin/jakittl (requiere sudo)...${NC}"
sudo cp jakittl.py /usr/local/bin/jakittl

# 3. Verificar instalación
if [ -f "/usr/local/bin/jakittl" ]; then
    echo -e "\n${GREEN}${BOLD}[✔] JakiTTL se ha instalado correctamente.${NC}"
    echo -e "${GREEN}[+] Ahora puedes usar el comando ${BOLD}'jakittl'${NC}${GREEN} desde cualquier parte.${NC}"
    echo -e "${CYAN}${BOLD}Ejemplo: jakittl 8.8.8.8${NC}\n"
else
    echo -e "${RED}[!] Error crítico durante la instalación.${NC}"
    exit 1
fi
