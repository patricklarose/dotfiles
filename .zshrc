# path
export PATH="/usr/local/sbin:$PATH"

# colors
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[cyan]%}%n%{$fg[green]%}%{$fg[blue]%} %{$fg[cyan]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

# basic auto/tab complete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# remove paste highlighting
zle_highlight=('paste:none')

# plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
#PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'

# alias
alias ls="ls -G"
alias ll="ls -Galh"
alias c="clear"
alias ytdmusic="youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0"
alias ytdvideo="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias cputemp="sudo powermetrics --samplers smc |grep -i "CPU die temperature""
alias gputemp="sudo powermetrics --samplers smc |grep -i "GPU die temperature""
alias fanspeed="sudo powermetrics --samplers smc |grep -i "Fan""
alias myip="curl ipinfo.io"
