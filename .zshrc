# Path
export PATH="/usr/local/sbin:$PATH"

# Environment Variables
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LANG=en_US.UTF-8

# Colors
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[cyan]%}%n%{$fg[green]%}%{$fg[blue]%} %{$fg[cyan]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

# Options
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD
setopt NO_BEEP
setopt HIST_IGNORE_SPACE

# Basic auto/tab complete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Remove paste highlighting
zle_highlight=('paste:none')

# Plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
#PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'

# Shell Functions
extract () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2|*.tbz2)  tar xvjf "$1"    ;;
            *.tar.gz|*.tgz)    tar xvzf "$1"    ;;
            *.tar.xz|*.txz)    tar xvJf "$1"    ;;
            *.tar.zma|*.tlz)   tar --lzma -xvf "$1" ;;
            *.tar)             tar xvf "$1"     ;;
            *.bz2)             bunzip2 "$1"     ;;
            *.rar)             unrar x "$1"     ;;
            *.gz)              gunzip "$1"      ;;
            *.zip)             unzip "$1"       ;;
            *.z)               uncompress "$1"  ;;
            *.7z)              7z x "$1"        ;;
            *.xz)              unxz "$1"        ;;
            *.lzma)            unlzma "$1"      ;;
            *.cab)             cabextract "$1"  ;;
            *)                 echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Alias
alias ls="ls -G"
alias ll="ls -Galh"
alias c="clear"
alias ytdmusic="youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0"
alias ytdvideo="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias cputemp="sudo powermetrics --samplers smc |grep -i "CPU die temperature""
alias gputemp="sudo powermetrics --samplers smc |grep -i "GPU die temperature""
alias fanspeed="sudo powermetrics --samplers smc |grep -i "Fan""
alias myip="curl ipinfo.io"
alias p1="ping 1.1.1.1"
alias pg="ping google.com"
alias lnfix="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"
alias fixdisk="sudo diskutil unmountDisk force /dev/disk2 && sudo pkill -f fsck"
alias cp="rsync -ah --progress"
alias mv="rsync -ah --progress --remove-source-files"
alias shredder="shred -n10 -uzfv"
alias h="history"
