# ~/.bashrc

# SYSTEM & GLOBAL SOURCING
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# ENVIRONMENT & PATH VARIABLES
# Base User Binaries
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Bioinformatics Tools (SRA Toolkit)
export PATH="$HOME/sratoolkit/bin:$PATH"
export PATH="$HOME/sratoolkit.3.2.0-centos_linux64/bin:$PATH"

export PATH

# System Default Programs
export VISUAL='vim'
export EDITOR='vim'
export BROWSER='w3m'

# Terminal History Settings
export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend

# SHELL SETTINGS & PROMPT
set -o vi  # Vim keybindings in terminal
PS1="\[\e[1;38;2;50;130;224m\]❱❱\w\[\e[0m\]$ "
fastfetch

# CONDA INITIALIZATION (!! Contents within this block are managed by 'conda init' !!)
__conda_setup="$("$HOME/anaconda3/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# 4. ALIASES
alias sbshrc='source ~/.bashrc'
alias inbshrc='tee -a ~/.bashrc'
alias vbshrc='vim ~/.bashrc'
alias rfsh="clear && fastfetch"
alias icat='kitty +kitten icat'
alias lsimg='timg --grid=7 --title="%b" *.jpg *.png 2> /dev/null'
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'

# Dotfiles & Config Navigation 
alias dots='cd ~/dotfiles'
alias conf='cd ~/dotfiles/.config/'
alias confd='cd ~/dotfiles/.config/dunst'
alias confe='cd ~/dotfiles/.config/eww'
alias confh='cd ~/dotfiles/.config/hypr'
alias confnd='cd ~/dotfiles/.config/nwg-dock-hyprland'
alias confr='cd ~/dotfiles/.config/rofi'
alias confw='cd ~/dotfiles/.config/waybar'
alias confa='cd ~/dotfiles/.config/alacritty'
alias conff='cd ~/dotfiles/.config/fastfetch'
alias confk='cd ~/dotfiles/.config/kitty'

# Hyprland & Ricing Utilities 
alias rwybr='pkill waybar &> /dev/null; (waybar &> /dev/null &)'
alias rdock='killall nwg-dock-hyprland &> /dev/null; (nwg-dock-hyprland -d -i 30 -hd 0 &> /dev/null &)'
alias rhppr='pkill hyprpaper; hyprpaper &> /dev/null &'
alias theme='~/dotfiles/scripts/theme.sh'

# Git Workflow 
alias ga='git add .'
alias gc='git commit -m'
alias gpsh='git push origin main'

# Applications & Bioinformatics
alias adt="$HOME/Downloads/mgltools_x86_64Linux2_1.5.7/bin/adt"
alias whatsapp="gtk-launch brave-hnpfjngllnobngcgfapefoaidbinmjnm-Profile_1.desktop"
alias gemini="gtk-launch brave-gdfaincndogidkdcdkhapmbffkckdkhn-Profile_1.desktop"
alias claude="gtk-launch brave-fmpnliohjhemenmnlpbfagaolkdacoja-Profile_1.desktop"

