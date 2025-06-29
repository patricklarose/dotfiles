# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path
export PATH="/usr/local/sbin:$PATH"

# Prompt & Colors
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[cyan]%}%n%{$fg[green]%}%{$fg[blue]%} %{$fg[cyan]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

# Tab completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Remove paste highlighting
zle_highlight=('paste:none')

# Plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# Options
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD
setopt NO_BEEP
setopt HIST_IGNORE_SPACE

# Git info in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%b'

# Aliases
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
alias shredder="shred -n10 -uzfv"
alias h="history"
alias v="vim"
alias vi="vim"
alias weather="curl 'wttr.in/?1qFn'"
alias moon="curl 'wttr.in/moon?F'"
cheat() { curl "https://cheat.sh/${1}"; }

# Show top 10 most used commands
topcmds() {
  history \
  | awk '{ CMD[$2]++; total++ } 
        END { 
          for (cmd in CMD) 
            printf "%d %.2f%% %s\n", CMD[cmd], CMD[cmd]/total*100, cmd 
        }' \
  | grep -v './' \
  | column -t -s ' ' \
  | sort -nr \
  | nl \
  | head -n10
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
