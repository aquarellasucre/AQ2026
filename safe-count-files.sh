bash
#!/bin/bash

# 1. Esta es la función que cuenta los archivos de forma segura
file_count()
{
    if [ ! -e "$1" ]
    then
        echo "Error: La carpeta '$1' no existe."
        exit 1
    fi

    local -i files=$(find "$(readlink -f -- "$1")" -type f -print0 | grep -cz -- -)
    echo $files
}

# 2. Aquí defines qué carpeta quieres contar (CAMBIA ESTO)
CARPETA_A_CONTAR="TU_CARPETA"

# 3. Aquí se ejecuta el conteo y muestra el resultado
echo "Contando archivos dentro de la carpeta: $CARPETA_A_CONTAR"
echo "Total de archivos:"
file_count "$CARPETA_A_CONTAR"
