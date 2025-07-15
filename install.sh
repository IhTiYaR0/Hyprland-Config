#!/bin/bash

set -e

CONFIG_DIRS=("fish" "hypr" "kitty" "nvim" "waybar" "wlogout" "wofi")

echo "=============================="
echo "⚙️  Установка Hyprland-Race окружения"
echo "=============================="

# 1. Установка пакетов
echo -e "\n📦 Установка пакетов из pkglist.txt..."

if [[ -f pkglist.txt ]]; then
    while IFS= read -r pkg; do
        if pacman -Qi "$pkg" &>/dev/null; then
            echo "✅ $pkg уже установлен"
        else
            echo "⬇️ Устанавливаю $pkg..."
            sudo pacman -S --noconfirm "$pkg"
        fi
    done < pkglist.txt
else
    echo "⚠️ Файл pkglist.txt не найден!"
fi

# 2. Копирование конфигов
echo -e "\n📁 Копирование конфигов в ~/.config/"

for dir in "${CONFIG_DIRS[@]}"; do
    src="./config/$dir"
    dest="$HOME/.config/$dir"

    if [[ -d "$dest" ]]; then
        read -p "❗ Папка $dest уже существует. Заменить? (y/N): " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            rm -rf "$dest"
            cp -r "$src" "$dest"
            echo "✅ $dir установлен"
        else
            echo "⏭️ Пропущено: $dir"
        fi
    else
        cp -r "$src" "$dest"
        echo "✅ $dir установлен"
    fi
done

# 3. Обои
echo -e "\n🖼️ Копирование обоев в ~/Pictures/Wallpapers..."

mkdir -p ~/Pictures/Wallpapers
cp -ru .Wallpaper/* ~/Pictures/Wallpapers/
echo "✅ Обои установлены"

# 4. Завершено
echo -e "\n🎉 Установка завершена!"
echo "Вы можете перезапустить Hyprland или перезагрузиться."

