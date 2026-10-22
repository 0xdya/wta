#!/usr/bin/env bash

# مكان المشروع
dir=$(cd "$(dirname "$0")" && pwd)

browser="${WTA_BROWSER:-chromium}"

# فحص المتطلبات
missing=""
command -v curl >/dev/null || missing="$missing curl"
command -v magick >/dev/null || missing="$missing imagemagick"
command -v "$browser" >/dev/null || missing="$missing $browser"

if [ -n "$missing" ]; then
    echo "Missing:$missing"
    echo "To install on Arch: sudo pacman -S$missing"
fi

# نسخ السكربت
mkdir -p "$HOME/.local/bin"
cp "$dir/src/wta" "$HOME/.local/bin/wta"
chmod +x "$HOME/.local/bin/wta"

# إضافة المجلد إلى PATH إن لم يكن فيه
reload=0
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *)
        line='export PATH="$HOME/.local/bin:$PATH"'
        rc=""
        case "$SHELL" in
            */fish) fish -c 'fish_add_path ~/.local/bin' ;;
            */zsh) rc="$HOME/.zshrc" ;;
            *) rc="$HOME/.bashrc" ;;
        esac
        # لا نكرر السطر إن كان موجودًا
        if [ -n "$rc" ]; then
            grep -qxF "$line" "$rc" 2>/dev/null || echo "$line" >> "$rc"
        fi
        export PATH="$HOME/.local/bin:$PATH"
        reload=1
        ;;
esac

echo "Installed successfully"
echo "Usage: wta name url [icon]"

# فتح صدفة جديدة ليعمل الأمر في نفس النافذة
if [ "$reload" -eq 1 ] && [ -t 0 ]; then
    echo "Added ~/.local/bin to PATH, opening a new shell here"
    exec "$SHELL"
fi