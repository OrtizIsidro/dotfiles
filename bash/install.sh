#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# install.sh
#
# Bootstrap de un Arch Linux recién instalado, a partir de
# este repo de dotfiles.
#
# Uso (en el Arch nuevo, con red y un usuario normal creado):
#   sudo pacman -S --needed git
#   git clone https://github.com/TU_USUARIO/dotfiles.git ~/dotfiles
#   cd ~/dotfiles
#   ./install.sh
# ============================================================

DOTFILES_REPO="https://github.com/TU_USUARIO/dotfiles.git"   # <-- cambiá esto
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

# Archivos/carpetas del repo que NO se deben symlinkear a $HOME
EXCLUDE=(".git" ".github" "README.md" "LICENSE" "install.sh" "backup.sh" "pkglist.txt" "aur-pkglist.txt")

if [[ $EUID -eq 0 ]]; then
    echo "No corras este script como root. Usá tu usuario normal (necesita sudo)."
    exit 1
fi

# ---------- 1. Clonar dotfiles si no existen ----------
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "==> Clonando dotfiles..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
cd "$DOTFILES_DIR"

# ---------- 2. Actualizar el sistema ----------
echo "==> Actualizando sistema..."
sudo pacman -Syu --noconfirm

# ---------- 3. Dependencias base ----------
echo "==> Instalando dependencias base (git, base-devel)..."
sudo pacman -S --needed --noconfirm git base-devel

# ---------- 4. Instalar yay si no está ----------
if ! command -v yay &>/dev/null; then
    echo "==> Instalando yay..."
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    (cd "$tmpdir/yay" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
fi

# ---------- 5. Instalar paquetes oficiales ----------
if [ -s "$DOTFILES_DIR/pkglist.txt" ]; then
    echo "==> Instalando paquetes oficiales..."
    mapfile -t pkgs < "$DOTFILES_DIR/pkglist.txt"
    sudo pacman -S --needed --noconfirm "${pkgs[@]}"
else
    echo "==> pkglist.txt no encontrado o vacío, se salta este paso."
fi

# ---------- 6. Instalar paquetes AUR ----------
if [ -s "$DOTFILES_DIR/aur-pkglist.txt" ]; then
    echo "==> Instalando paquetes AUR..."
    mapfile -t aurpkgs < "$DOTFILES_DIR/aur-pkglist.txt"
    yay -S --needed --noconfirm "${aurpkgs[@]}"
else
    echo "==> aur-pkglist.txt no encontrado o vacío, se salta este paso."
fi

# ---------- 7. Symlinkear dotfiles ----------
echo "==> Aplicando symlinks de configuración..."
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

is_excluded() {
    local item="$1"
    for ex in "${EXCLUDE[@]}"; do
        [[ "$item" == "$ex" ]] && return 0
    done
    return 1
}

shopt -s dotglob
for path in "$DOTFILES_DIR"/*; do
    name="$(basename "$path")"
    is_excluded "$name" && continue

    target="$HOME/$name"

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        echo "    - Backup de $target -> $BACKUP_DIR/"
        mv "$target" "$BACKUP_DIR/"
    fi

    ln -s "$path" "$target"
    echo "    - Symlink: $target -> $path"
done
shopt -u dotglob

echo "==> Instalación completa."
echo "    Backups de archivos previos (si hubo) quedaron en: $BACKUP_DIR"
echo "    Cerrá sesión / reiniciá para que todo tome efecto."
