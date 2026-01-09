#!/bin/bash

# Colores
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

echo -e "${CYAN}${BOLD}[*] Instalando JakiTTL (Local Mode)...${NC}"

# 1. Crear el directorio bin local si no existe
BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"

# 2. Verificar que el archivo existe
if [ ! -f "jakittl.py" ]; then
    echo -e "${RED}[!] Error: No se encuentra jakittl.py${NC}"
    exit 1
fi

# 3. Copiar y dar permisos
cp jakittl.py "$BIN_DIR/jakittl"
chmod +x "$BIN_DIR/jakittl"

echo -e "${GREEN}[+] Archivo copiado a $BIN_DIR/jakittl${NC}"

# 4. Verificar si la ruta está en el PATH
if [[ ":$PATH:" == *":$BIN_DIR:"* ]]; then
    echo -e "\n${GREEN}${BOLD}[✔] JakiTTL instalado correctamente.${NC}"
    echo -e "${GREEN}[+] Ya puedes usar el comando ${BOLD}'jakittl'${NC}${GREEN} desde cualquier terminal.${NC}"
else
    echo -e "\n${YELLOW}${BOLD}[!] Aviso: Instalación completada, pero falta un paso.${NC}"
    echo -e "${YELLOW}Para usarlo desde cualquier parte, ejecuta este comando una vez:${NC}"
    echo -e "${BOLD}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
    echo -e "${YELLOW}(O añádelo a tu .bashrc para que sea permanente)${NC}"
fi

echo -e "\n${CYAN}Ejemplo de uso: jakittl 8.8.8.8${NC}"
