# muesli.zsh-theme
# Use with a dark background and 256-color terminal!

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   fino

if [[ $UID -eq 0 ]]; then
    local user_symbol='◈'
else
    local user_symbol='◉'
fi

function prompt_char {
  echo "%B${user_symbol}%b"
}

function box_name {
    echo ${SHORT_HOST:-$HOST}
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

PROMPT="%{$FG[231]%}╭─ %{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[239]%}
%{$FG[231]%}╰─${prompt_char}%{$reset_color%} "
RPROMPT="%{$FG[239]%}(%*)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
