# 🖼️ convert_to_webp.sh

![Bash](https://img.shields.io/badge/bash-v5+-blue?logo=gnu-bash)
![License: MIT](https://img.shields.io/badge/license-MIT-green)
![Platform: Linux](https://img.shields.io/badge/platform-Linux-lightgrey)

Un script Bash interactif puissant pour convertir automatiquement toutes les images (.JPG, .PNG, .GIF, etc.) d’un dossier (et ses sous-dossiers) vers le format WebP – léger, rapide et optimisé pour le web.

---

## 📦 Objectif

Ce script permet de :

- ✅ Convertir en masse tous les formats d’image vers `.webp`.
- 🗂️ Choisir un dossier de sortie tout en gardant la structure initiale.
- 🧪 Simuler la conversion (mode dry-run).
- ⚙️ Ajuster la qualité du rendu WebP.
- 🗑️ Supprimer les fichiers originaux après conversion (optionnel).
- 📊 Obtenir un rapport clair à la fin.

---

## 🔧 Prérequis

- Linux
- ImageMagick installé :

```bash
sudo apt update
sudo apt install imagemagick
```

## 📝 Extensions supportées

- .jpg, .jpeg

- .png

- .gif

- .bmp

- .tiff, .tif

- .avif

- .heic, .heif

## 🚀 Installation & Utilisation

1. Clone le dépôt :

```bash
git clone https://github.com/votre-utilisateur/convert_to_webp.sh.git
cd convert_to_webp.sh
```

2. Rends le script exécutable :

```bash
chmod +x convert_to_webp.sh
```

3. Lance le script depuis le dossier contenant les images :
```bash
./convert_to_webp.sh
```

4. Suis les instructions interactives :

- 📁 Enregistrer les .webp dans un dossier séparé ?

- 🗑️ Supprimer les fichiers originaux ?

- 🧪 Mode simulation uniquement ?

- 📏 Définir la qualité du rendu WebP (ex : 80, 100…)

## 💡 Pourquoi WebP ?

- ⚡ Jusqu’à 30% plus léger que JPEG ou PNG

- 🌐 Chargement plus rapide sur le web

- 🧠 Meilleure compression avec qualité conservée

- 📱 Compatible avec tous les navigateurs modernes

## 🛡️ Licence
Ce projet est open-source, sous licence MIT.