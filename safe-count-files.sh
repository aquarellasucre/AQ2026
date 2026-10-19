bash
#!/bin/bash

file_count()
{
    if [ ! -e "$1" ]
    then
        echo "❌ ERROR: La carpeta '$1' no existe en este repositorio."
        echo "Carpetas disponibles en la raíz de tu proyecto:"
        ls -d */ 2>/dev/null || echo "(No hay más carpetas en la raíz)"
        exit 1
    fi

    local -i files=$(find "$(readlink -f -- "$1")" -type f -print0 | grep -cz -- -)
    echo "✅ ¡Éxito! Total de archivos: $files"
}

# ⚠️ PON AQUÍ TU CARPETA. Si está dentro de otra, usa barras: "carpeta1/carpeta2"
CARPETA_A_CONTAR="JPG"

echo "Buscando en: $CARPETA_A_CONTAR"
file_count "$CARPETA_A_CONTAR"
