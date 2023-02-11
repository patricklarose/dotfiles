# Path
export PATH="/usr/local/sbin:$PATH"

# Colors
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[cyan]%}%n%{$fg[green]%}%{$fg[blue]%} %{$fg[cyan]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

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
