#!/bin/bash

EXTENSIONS=("jpg" "jpeg" "png" "bmp" "gif" "tiff" "tif" "avif" "heic" "heif")

if ! command -v convert &> /dev/null; then
  echo "❌ ImageMagick n'est pas installé. Installe-le avec : sudo apt install imagemagick"
  exit 1
fi

IFS=$'\n'
echo "🎨 Script de conversion d'images vers WebP"

read -p "📁 Veux-tu enregistrer les WebP dans un dossier séparé ? (o/n) : " SEP_FOLDER
read -p "🗑️ Veux-tu supprimer les fichiers originaux après conversion ? (o/n) : " DELETE_ORIG
read -p "🧪 Mode simulation uniquement (dry run) ? (o/n) : " DRYRUN
read -p "📏 Qualité WebP (0-100, défaut 100) : " QUALITY
QUALITY=${QUALITY:-100}

if [[ "$SEP_FOLDER" == "o" ]]; then
  read -p "🔧 Nom du dossier de destination (ex: webp_output) : " OUTPUT_FOLDER
  mkdir -p "$OUTPUT_FOLDER"
fi

FIND_FILTER=""
for ext in "${EXTENSIONS[@]}"; do
  FIND_FILTER="$FIND_FILTER -iname '*.$ext' -o"
done
FIND_FILTER="${FIND_FILTER::-3}"

FILES=$(eval "find . -type f \( $FIND_FILTER \)")

TOTAL=$(echo "$FILES" | grep -c . || true)
if [[ "$TOTAL" -eq 0 ]]; then
  echo "🔍 Aucun fichier trouvé à convertir."
  exit 0
fi

COUNT=0
CONVERTED=0
SKIPPED=0
FAILED=0

echo "🔍 $TOTAL fichier(s) trouvé(s)"
echo "🚀 Début de la conversion..."

while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  ((COUNT++))
  if [[ "$SEP_FOLDER" == "o" ]]; then
    rel_path=$(dirname "$file" | sed 's|^\./||')
    dest_dir="$OUTPUT_FOLDER/$rel_path"
    mkdir -p "$dest_dir"
    output="$dest_dir/$(basename "${file%.*}").webp"
  else
    output="${file%.*}.webp"
  fi

  if [[ -f "$output" ]]; then
    echo "[$COUNT/$TOTAL] ✅ Déjà converti : $output"
    ((SKIPPED++))
    continue
  fi

  if [[ "$DRYRUN" == "o" ]]; then
    echo "[$COUNT/$TOTAL] 🧪 Simulation : $file -> $output"
    ((SKIPPED++))
    continue
  fi

  echo "[$COUNT/$TOTAL] 🔄 Conversion : $file -> $output"
  if convert "$file" -quality "$QUALITY" "$output"; then
    echo "   ✅ Succès"
    ((CONVERTED++))
    if [[ "$DELETE_ORIG" == "o" ]]; then
      rm "$file"
      echo "   🗑️ Supprimé : $file"
    fi
  else
    echo "   ❌ Échec de la conversion : $file"
    ((FAILED++))
  fi
done <<< "$FILES"

echo ""
echo "📊 Rapport de conversion"
echo "   ➕ Convertis  : $CONVERTED"
echo "   🔁 Ignorés   : $SKIPPED"
echo "   ❌ Échecs    : $FAILED"
echo "   📁 Fichiers totaux traités : $COUNT"
echo "✅ Terminé !"
