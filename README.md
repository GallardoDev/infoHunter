# infoHunter
# Recolección de Información

## Descripción

Este script está diseñado para realizar una recopilación básica de información sobre una dirección IP específica. Utiliza herramientas comunes como 'nslookup', 'nmap', 'nc' y 'whois' para obtener datos relevantes, incluyendo:

- Información DNS
- Identificación del sistema operativo
- Escaneo de puertos abiertos
- Información WHOIS

# Ejemplo de salida
========================================
          RECOLECCIÓN DE INFO          
         ██████╗ ██╗  ██╗██╗██╗       
         ██╔══██╗██║  ██║██║██║       
         ██████╔╝███████║██║██║       
         ██╔═══╝ ██╔══██║██║██║       
         ██║     ██║  ██║██║███████╗  
         ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝  
========================================
   Uso: Recopila información de una IP  
   Introduce la dirección IP a analizar:

   109.218.209.141

  Recopilando información para la dirección IP: 192.168.1.1
--- Información DNS ---
Server: 8.8.8.8
Address: 8.8.8.8#53
Non-authoritative answer:
Name: router.local
Address: 192.168.1.1
--- Identificación del Sistema Operativo ---
Device type: router
OS details: Cisco IOS 15.2
--- Escaneo de Puertos ---
Puertos abiertos:
Puerto 22 está abierto.
Puerto 80 está abierto.
Puerto 443 está abierto.
--- Información WHOIS ---
Domain Name: example.com
Registry Domain ID: 1234567890_DOMAIN_COM-VRSN
Registrar WHOIS Server: whois.example.com
Registrar URL: http://www.example.com
Updated Date: 2024-01-01T00:00:00Z
Creation Date: 2000-01-01T00:00:00Z
Registrar Registration Expiration Date: 2025-01-01T00:00:00Z 
