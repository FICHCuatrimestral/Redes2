# Reorganizar Redes2 - correr desde DENTRO de la carpeta Redes2
# (PowerShell, requiere que redes2-update.zip este en esta misma carpeta)

$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path "Teoria" | Out-Null
New-Item -ItemType Directory -Force -Path "Practicas" | Out-Null

# Sacar las 2 practicas y el archivo de Packet Tracer de Unidad1 antes de moverla
git mv "Unidad1\práctica_número_1_redes_2_2026.doc" "Practicas\práctica_número_1_redes_2_2026.doc"
git mv "Unidad1\ejer10AyB.pkt" "Practicas\ejer10AyB.pkt"

# Lo que queda en Unidad1 (los .pptx y el .pdf de teoria) se va a Teoria/
git mv "Unidad1" "Teoria\Unidad1"

# El compose.yaml del lab de enrutamiento va con las practicas de enrutamiento
git mv "compose.yaml" "Practicas\compose.yaml"

# Traer el contenido nuevo (README actualizado + Proyectos/SSH)
Expand-Archive -Path "redes2-update.zip" -DestinationPath "." -Force
git add README.md Proyectos

Remove-Item "redes2-update.zip"

Write-Host "Listo. Revisa 'git status' y despues: git add -A; git commit -m 'Reorganizar estructura y agregar Proyectos/SSH'; git push"
