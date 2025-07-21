#!/bin/bash

killall mako dunst swaync

CONFIG="$HOME/.config/swaync/config.json"
STYLE="$HOME/.config/swaync/style.css"

export XDG_CONFIG_HOME="$HOME/.dummy"

while true; do
    swaync -c "$CONFIG" -s "$STYLE"
    STATUS=$?

    if [ $STATUS -ne 0 ]; then
        echo "swaync упал с ошибкой (код $STATUS). Перезапуск через 2 сек..."
        sleep 2
    else
        echo "swaync завершился нормально. Выход."
        break
    fi
done

