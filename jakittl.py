import subprocess
import re
import sys

# Colores ANSI para la terminal
class Colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    CYAN = '\033[96m'
    MAGENTA = '\033[95m'
    BOLD = '\033[1m'
    RESET = '\033[0m'

def banner():
    print(f"{Colors.CYAN}{Colors.BOLD}")
    print(r"""
       _       _    _ _______ _______ _      
      | |     | |  | |__   __|__   __| |     
      | | __ _| | _| |  | |     | |  | |     
  _   | |/ _` | |/ / |  | |     | |  | |     
 | |__| | (_| |   <| |  | |     | |  | |____ 
  \____/ \__,_|_|\_\_|  |_|     |_|  |______| v1.0
    """)
    print(f"{Colors.MAGENTA}   [+] Identificador de TTL para JakiKali")
    print(f"   [+] Creado por: Jaki | Especial 100 Subs 🚀{Colors.RESET}\n")

def get_ttl(ip):
    try:
        # Ejecutamos un solo ping para obtener el TTL
        output = subprocess.check_output(["ping", "-c", "1", ip], stderr=subprocess.STDOUT, universal_newlines=True)
        # Buscamos el valor de ttl=XX
        ttl_value = re.search(r"ttl=(\d+)", output)
        if ttl_value:
            return int(ttl_value.group(1))
    except subprocess.CalledProcessError:
        return None
    except Exception as e:
        print(f"{Colors.RED}[!] Error: {e}{Colors.RESET}")
        return None

def identify_os(ttl):
    if ttl <= 64:
        return f"{Colors.GREEN}Linux / Unix / macOS / Android{Colors.RESET}"
    elif ttl <= 128:
        return f"{Colors.YELLOW}Windows (NT/2000/XP/7/10/11){Colors.RESET}"
    elif ttl <= 255:
        return f"{Colors.RED}Cisco Router / Solaris / HP-UX{Colors.RESET}"
    else:
        return f"{Colors.MAGENTA}Desconocido (Valor TTL inusual){Colors.RESET}"

def main():
    banner()
    if len(sys.argv) != 2:
        print(f"{Colors.YELLOW}Uso: python3 jakittl.py <dirección_ip>{Colors.RESET}")
        sys.exit(1)

    target = sys.argv[1]
    print(f"{Colors.BOLD}[*] Escaneando objetivo: {Colors.CYAN}{target}{Colors.RESET}")
    
    ttl = get_ttl(target)
    
    if ttl:
        os_name = identify_os(ttl)
        print(f"\n{Colors.BOLD}-----------------------------------------")
        print(f"{Colors.GREEN}[+] TTL Detectado: {Colors.BOLD}{ttl}{Colors.RESET}")
        print(f"{Colors.GREEN}[+] OS Probable:  {os_name}")
        print(f"{Colors.BOLD}-----------------------------------------{Colors.RESET}")
        print(f"\n{Colors.CYAN}Hola, amigo. El sistema ha sido identificado.{Colors.RESET}")
    else:
        print(f"\n{Colors.RED}[!] No se pudo obtener respuesta de {target}.{Colors.RESET}")
        print(f"{Colors.RED}[!] El host podría estar caído o bloqueando ICMP.{Colors.RESET}")

if __name__ == "__main__":
    main()
