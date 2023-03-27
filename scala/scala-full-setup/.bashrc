## Theme: nord/gruvbox/flatui; Font: Consolas, Bold, 11pt; Transparency: Off; Cursor: Block, blinking

## PROMPT
export PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\[\033[35m\]\[\033[33m\]\w\[\033[36m\] \[\033[0m\]\n$ '
## ENV VARIABLES
export LESS=-RiXsj5Q
export EDITOR=vim

set -o vi
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize

## ALIASES
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
