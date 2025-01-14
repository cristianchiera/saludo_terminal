#!/bin/bash
#################################################################################################
#Por Catoto es de uso libre.               
#################################################################################################
# Verifica si el directorio de cowsay existe y no está vacío
if [ -d "/usr/share/cows" ] && [ "$(ls -A /usr/share/cows)" ]; then
    # archivos de figuras de cowsay en un arreglo
    vacas=(`ls /usr/share/cows`)
    # total de figuras encontradas (elementos en el arreglo)
    TVACAS=${#vacas[*]}
    # selecciona un numero al azar entre 0 y TVACAS-1
    NVACA=$((RANDOM%TVACAS))
    # nombre del archivo cowsay a utilizar
    vaca=${vacas[$NVACA]}
    vaca_param="-f $vaca"
else
    vaca_param=""
fi

# Opciones de cowsay en un arreglo
opciones=("-b" "-d" "-p" "-s" "-t" "-y")
# Total de opciones
TOPCIONES=${#opciones[*]}
# Selecciona un número al azar entre 0 y TOPCIONES-1
NOPCION=$((RANDOM%TOPCIONES))
# Opción aleatoria a utilizar
opcion=${opciones[$NOPCION]}

# Verifica si fortune, cowsay y lolcat están instalados
if command -v fortune >/dev/null 2>&1 && command -v cowsay >/dev/null 2>&1 && command -v lolcat >/dev/null 2>&1; then
    # forma el saludo con fortune, cowsay y lolcat
    fortune | cowsay  $opcion $vaca_param | lolcat
    figlet -f dos-rebel C4T0T0 | lolcat
else
    echo "Error: Asegúrate de tener fortune, cowsay y lolcat instalados."
fi
