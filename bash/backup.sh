#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# backup.sh
#
# Corré este script en tu sistema Arch actual. Genera:
#   - pkglist.txt      -> paquetes oficiales instalados a mano
#   - aur-pkglist.txt  -> paquetes de AUR instalados a mano
# y los guarda en tu repo de dotfiles, listos para commitear.
#
# Uso:
#   DOTFILES_DIR=~/dotfiles ./backup.sh
#   (si no seteás DOTFILES_DIR, usa ~/dotfiles por default)
# ============================================================

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: no se encontró el repo de dotfiles en $DOTFILES_DIR"
    echo "Definí DOTFILES_DIR=/ruta/a/tu/repo o cloná tu repo ahí primero."
    exit 1
fi

echo "==> Generando lista de paquetes oficiales (pacman)..."
pacman -Qqen > "$DOTFILES_DIR/pkglist.txt"

echo "==> Generando lista de paquetes AUR (yay)..."
pacman -Qqem > "$DOTFILES_DIR/aur-pkglist.txt"

echo "==> Listas generadas:"
echo "    - pkglist.txt:     $(wc -l < "$DOTFILES_DIR/pkglist.txt") paquetes"
echo "    - aur-pkglist.txt: $(wc -l < "$DOTFILES_DIR/aur-pkglist.txt") paquetes"

read -rp "¿Commitear y pushear los cambios al repo ahora? [y/N] " resp
if [[ "$resp" =~ ^[Yy]$ ]]; then
    cd "$DOTFILES_DIR"
    git add pkglist.txt aur-pkglist.txt
    git commit -m "Actualiza listas de paquetes ($(date +%Y-%m-%d))" || echo "    (nada nuevo para commitear)"
    git push
    echo "==> Push realizado."
else
    echo "==> Listo, revisá los cambios y hacé el commit vos mismo cuando quieras."
fi
