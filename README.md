![decorative image](https://camo.githubusercontent.com/91cd2f143058a9c8d21ac3d58a70b77e133d24a774fe055ce72a4a366a0f7a1f/68747470733a2f2f692e696d6775722e636f6d2f565a4f796d49662e706e67)

<h1 align="center" style="font-size: 70px; font-weight: bold;">
  💎️ IHTI - Hyprland-Config 1.5 💎️
</h1>
<p align="center">
  <img src="https://img.shields.io/badge/LAST%20COMMIT-July%202025-purple?style=for-the-badge&color=green" alt="Last Commit" />
  <img src="https://img.shields.io/badge/REPO%20SIZE-55%20MiB-gradient?style=for-the-badge&color=ff5733" alt="Repo Size" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Linux-black?style=for-the-badge&logo=Linux&logoColor=white" alt="Linux" />
  <img src="https://img.shields.io/badge/Arch-1793D1?style=for-the-badge&logo=ArchLinux&logoColor=white" alt="Arch Linux" />
  <img src="https://img.shields.io/badge/Hyprland-7E42F4?style=for-the-badge&logo=hyprland" alt="Hyprland" />
</p>



## 📦 Tools

#### List of tools I use.


| Component         | Program    |
|-------------------|------------|
| Windows Manager 🪟| [hyprland](https://github.com/hyprwm/Hyprland)  |
| Browser 🌐        | [firefox](https://github.com/topics/firefox-browser) |
| Bar 📊            | [waybar](https://github.com/Alexays/Waybar)      |
| Terminal 🖥️       | [kitty](https://github.com/kovidgoyal/kitty)        |
| Shell 🐚          | [fish](httphttps://github.com/fish-shell/fish-shell) |
| Editor 📝         | [neovim](https://github.com/neovim/neovim)      |
| Launcher 🚀       | [wofi](https://github.com/SimplyCEO/wofi)          |
| Wallpaper         | [swww](https://github.com/SimplyCEO/wofi)          |
| Lockscreen 🔒     | [hyprlock](https://github.com/hyprwm/hyprlock)  |
| Fetch 🖼️          | [catnap](https://github.com/iinsertNameHere/catnip)  |
| Login Menu 🚪     | [sddm](https://github.com/sddm/sddm)          |
| Visualiser 📊     | [cava](https://github.com/karlstav/cava)          |

# 📸️ Preview
![Фото 1](https://files.catbox.moe/dpfzmp.png)
![Фото 2](https://files.catbox.moe/u9q3kh.png)
![Фото 3](https://files.catbox.moe/fz4qm3.png)
![Фото 4](https://files.catbox.moe/ca8q88.png)






## ⚠️ **Important Information**

> After installation your computer will reboot and all files in `~/.config` will be deleted and replaced with my configs!


> After the entire installation you will have all the necessary utilities for use and also all the tools like - `hypr`, `waybar`, `kitty`, `fish` 

# 📥 Installing 

```bash
git clone https://github.com/IhTiYaR0/Hyprland-Config
cd Hyprland-Config
bash install.sh
```




## 📝 Setting up NeoVim

#### If NeoVim doesn't work for you
1. Installing Plugins. Go to `~/`
    ```bash
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
2. Open the terminal with the key `Win + Q`
    ```bash
    nvim
    ```
3. From the bottom of NeoVim write
    ```nvim
    :PlugInstall
    ```
---
<h3 style="font-size: 24px; font-weight: bold;">
Instructions Binds ⌨️
</h3>

| Command | Function |
| ------- | -------- |
| `Win` + `Q` | `Kitty` |
| `Win` + `A` | `Killactive` |
| `Win` + `S` | `Thunar` |
| `Win` + `B` | `Firefox` |
| `Win` + `D` | `Wofi` |
| `Win` + `L` | `Hyprlock` |
| `Win` + `Shift` + `S` | `Hyprshot` |
| `Win` + `F` | `Fullscreen` |
| `Win` + `Z` | `Togglefloating` |
| `Win` + `right` | `workspace, +1` |
| `Win` + `left` | `workspace, -1` |
| `Win` + `F12` | `hyprctl exit` |
| `Win` + `Ctrl` + `P` | `kitty padding` |

---

### ⚙️ Additional window binds in  -> `~/.config/hypr/hyrland.conf`
```bash
# Move focus with 
bind = $mainMod SHIFT, left, movefocus, l
bind = $mainMod SHIFT, right, movefocus, r
bind = $mainMod SHIFT, up, movefocus, u
bind = $mainMod SHIFT, down, movefocus, d

# Move active window with 
bind = $mainMod ctrl, left, movewindow, l
bind = $mainMod ctrl, right, movewindow, r
bind = $mainMod ctrl, up, movewindow, u
bind = $mainMod ctrl, down, movewindow, d

# Resize active window with 
bind = $mainMod ALT, left, resizeactive, -200 0
bind = $mainMod ALT, right, resizeactive, 200 0
bind = $mainMod ALT, up, resizeactive, 0 -200
bind = $mainMod ALT, down, resizeactive, 0 200
```

### My `alias` `~/.config/hypr/hyrland.conf`
```bash
#My Alias
alias n='nvim'
alias v='nvim'
alias ls='lsd --group-dirs=first --icon=always --color=always --size=short'
alias la='lsd -a --group-dirs=first --icon=always --color=always --size=short'
alias lst='lsd -a --tree --depth 2 --icon=always --color=always'
alias cl='clear'
alias ff='catnap'
```
---


<h3 align="center" style="font-size: 50px; font-weight: bold;">
 😎️ Thank you all very much 😎️
</h3>