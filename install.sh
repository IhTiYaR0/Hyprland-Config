#!/usr/bin/env bash
set -euo pipefail
trap 'echo -e "\n${RED}❌ Ошибка на строке $LINENO. Установка остановлена.${NC}" >&2; exit 1' ERR

# Цвета и символы
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[1;31m'
BOLD='\033[1m'
NC='\033[0m'

CHECK="${GREEN}✔${NC}"
CROSS="${RED}✘${NC}"
ARROW="${BLUE}➤${NC}"

# Стильный заголовок
clear
echo -e "${BOLD}${BLUE}"
echo "╔════════════════════════════════════════════════╗"
echo "║              💎️ Hyprland-Config 💎️             ║"
echo "╚════════════════════════════════════════════════╝"
echo -e "${NC}"

# Подтверждение
read -rp "$(echo -e "${YELLOW}⚠️  Все ваши конфиги в ~/.config и ~/.Wallpapers будут ПОЛНОСТЬЮ заменены.
Также shell будет изменён на fish, и произойдёт перезагрузка.
Продолжить установку? [y/N]:${NC} ")" CONFIRM
CONFIRM=${CONFIRM,,}
if [[ "$CONFIRM" != "y" ]]; then
  echo -e "${CROSS} Установка отменена пользователем."; exit 1
fi

# 1️⃣ Установка пакетов
echo -e "\n${ARROW} ${BOLD}Установка пакетов через installpkg.sh...${NC}"
if [[ -x "./installpkg.sh" ]]; then
  ./installpkg.sh && echo -e "${CHECK} Пакеты установлены."
else
  echo -e "${CROSS} installpkg.sh не найден или не исполняемый."; exit 1
fi

# 2️⃣ Смена оболочки на fish
echo -e "\n${ARROW} ${BOLD}Установка Fish как shell по умолчанию...${NC}"
if command -v fish >/dev/null && grep -q "/usr/bin/fish" /etc/shells; then
  chsh -s /usr/bin/fish
  echo -e "${CHECK} Fish установлен как оболочка по умолчанию."
else
  echo -e "${CROSS} Не удалось установить fish. Убедитесь, что он установлен и прописан в /etc/shells."; exit 1
fi

# Функция копирования с заменой
copy_replace() {
  local src="$1" dst="$2"
  if [[ -d "$dst" ]]; then
    echo -e "${YELLOW}  - Удаление старой папки: $dst${NC}"
    rm -rf "$dst"
  fi
  echo -e "${GREEN}  + Копирование: $src → $dst${NC}"
  cp -a "$src" "$dst"
}

# 3️⃣ Копирование конфигов
echo -e "\n${ARROW} ${BOLD}Установка конфигов (.config)...${NC}"
for dir in .config/*; do
  copy_replace "$dir" "$HOME/.config/$(basename "$dir")"
done
echo -e "${CHECK} Конфиги установлены."

# 4️⃣ Копирование обоев
echo -e "\n${ARROW} ${BOLD}Установка обоев (.Wallpapers)...${NC}"
copy_replace ".Wallpapers" "$HOME/.Wallpapers"
echo -e "${CHECK} Обои скопированы."

# ✅ Завершение
echo -e "\n${GREEN}🎉 Установка завершена успешно!${NC}"
echo -e "${YELLOW}🔁 Перезагрузка через 5 секунд...${NC}"
sleep 5
exec sudo reboot

