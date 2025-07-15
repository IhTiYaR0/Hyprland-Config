#!/bin/bash

CONFIG="$HOME/.config/kitty/kitty.conf"
CURRENT=$(grep -Po '^\s*window_padding_width\s+\K\d+(\s+\d+)?' "$CONFIG")

if [[ "$CURRENT" == "0" ]]; then
    # Включить два параметра "8 10"
    sed -i 's/^\s*window_padding_width\s\+.*/window_padding_width 11 12/' "$CONFIG"

elif [[ "$CURRENT" == "11 12" ]]; then

    sed -i 's/^\s*window_padding_width\s\+.*/window_padding_width 20 120 /' "$CONFIG"
else
    # Все прочие случаи приравниваются к "0"
    sed -i 's/^\s*window_padding_width\s\+.*/window_padding_width 0/' "$CONFIG"
fi

kill -SIGUSR1 $(pgrep -x kitty)
