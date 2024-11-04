#!/bin/bash

echo "========================================"
echo "          RECOLECCIÓN DE INFO          "
echo "         ██████╗ ██╗  ██╗██╗██╗       "
echo "         ██╔══██╗██║  ██║██║██║       "
echo "         ██████╔╝███████║██║██║       "
echo "         ██╔═══╝ ██╔══██║██║██║       "
echo "         ██║     ██║  ██║██║███████╗  "
echo "         ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝  "
echo "========================================"
echo "   Uso: Recopila información de una IP  "
echo "   Introduce la dirección IP a analizar:"
echo ""

# Función para recopilar información
recopilar_info() {
    ip=$1
    
    echo "Recopilando información para la dirección IP: $ip"
    
    # Obtener información DNS
    echo -e "\n--- Información DNS ---"
    nslookup $ip
    
    # Obtener información del sistema operativo
    echo -e "\n--- Identificación del Sistema Operativo ---"
    nmap -O $ip | grep "OS details"
    
    # Escaneo de puertos
    echo -e "\n--- Escaneo de Puertos ---"
    puertos_abiertos=()
    
    for puerto in $(seq 1 1024); do
        nc -z -v -w 1 $ip $puerto 2>&1 | grep succeeded > /dev/null
        if [ $? -eq 0 ]; then
            puertos_abiertos+=($puerto)
        fi
    done

    # Mostrar resultados de puertos
    if [ ${#puertos_abiertos[@]} -eq 0 ]; then
        echo "No existen puertos abiertos."
    else
        echo "Puertos abiertos:"
        for p in "${puertos_abiertos[@]}"; do
            echo "Puerto $p está abierto."
        done
    fi

    # Información adicional con whois
    echo -e "\n--- Información WHOIS ---"
    whois $ip | head -n 20  # Muestra solo las primeras 20 líneas para no saturar la salida
}

# Leer la dirección IP del usuario
read ip_objetivo

# Validar que se ha introducido una dirección IP
if [[ -z "$ip_objetivo" ]]; then
    echo "Error: No se ha introducido ninguna dirección IP."
    exit 1
fi

# Validar el formato de la dirección IP
if ! [[ "$ip_objetivo" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: La dirección IP introducida no es válida."
    exit 1
fi

# Llamar a la función 
recopilar_info $ip_objetivo
