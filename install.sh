#!/bin/bash

# Colores
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}[*] Instalando JakiTTL...${NC}"

# 1. Crear carpeta local de binarios
mkdir -p "$HOME/.local/bin"

# 2. Copiar y dar permisos
cp jakittl.py "$HOME/.local/bin/jakittl"
chmod +x "$HOME/.local/bin/jakittl"

# 3. Configurar el PATH automáticamente según la terminal
SHELL_RC=""
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ] || [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    if ! grep -q ".local/bin" "$SHELL_RC"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
        echo -e "${GREEN}[+] Se ha añadido JakiTTL a tu $SHELL_RC${NC}"
    fi
fi

echo -e "${GREEN}[+] Instalación terminada. REINICIA TU TERMINAL y escribe: jakittl${NC}"
