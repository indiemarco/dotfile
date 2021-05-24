set fish_greeting

set -gx EDITOR nvim
set -gx NNN_TRASH 1
set -gx MOZ_ENABLE_WAYLAND 1
#set -gx GTK_IM_MODULE fcitx
#set -gx QT_IM_MODULE fcitx
#set -gx XMODIFIERS \@im=fcitx
#set -gx XDG_CURRENT_DESKTOP sway
set -gx npm_config_prefix ~/.node_modules

set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx REACT_TERMINAL alacritty

set -gx FZF_DEFAULT_OPTS '
--layout=reverse
--color=bg+:0,pointer:2,fg+:2,hl:5,hl+:5,info:3
'
alias S "sudo pacman -Syu"
alias Rs "sudo pacman -Rs"
alias Ss "pacman -Ss"
alias n "nnn -H -o"
alias rm "echo Use 'trash', or the full path i.e. '/bin/rm'"
alias ls lsd

set -gx PATH $PATH $HOME/.local/bin 
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.yarn/bin 
set -gx PATH $PATH $HOME/.deno/bin 
set -gx PATH $PATH $HOME/.node_modules/bin 
set -gx PATH $PATH $HOME/go/bin 
set -gx PATH $PATH $HOME/.fly/bin

set -gx PATH $PATH $ANDROID_HOME/emulator
set -gx PATH $PATH $ANDROID_HOME/tools
set -gx PATH $PATH $ANDROID_HOME/tools/bin
set -gx PATH $PATH $ANDROID_HOME/platform-tools



starship init fish | source
if status is-login
    if test -z "$DISPLAY" -a "$XDG_SESSION_TYPE" != "wayland" -a "$XDG_VTNR" = 1
        #exec sway
    end
end
