# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
alias g++="g++ --std=c++0x"
alias bd="g++ --std=c++0x *.cpp -lSDL -O3"
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias gpac='chmod u+x . && git add . && git commit -m'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/alx-low_level_programming/0x18-dynamic_libraries:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=~/alx-low_level_programming/0x18-dynamic_libraries:$LD_LIBRARY_PATH
alias h="cd alx-h*"
alias l="cd alx-low*"
alias gs="git status"
alias gp="git push"
alias chmod="chmod u+x *"
alias doctest="python3 -m doctest -v"
alias gs="git status"
alias ga="git add ."
alias gm="git commit -m"
alias test="python3 -m unittest discover tests"
alias cl="clear"
alias install="sudo apt install"
alias gr="git restore --staged"
alias login="mysql -u root"
alias cm="google-chrome"
alias w3c="./w3c_validator.py"
alias dev="mysql -uhbnb_dev -p hbnb_dev_db"
alias plfix="puppet-lint --fix"
alias lb="ssh ubuntu@100.25.37.157"
alias v2="cd AirBnB_clone_v2"
alias v3="cd AirBnB_clone_v3"
alias v4="cd AirBnB_clone_v4"
alias json="jq . "
alias flask="flask --app web_flask run --debug"
alias vf='vi "$(fzf)"'
alias cf='cat "$(fzf)"'
alias pb='cd alx-backend-python'
alias jb='cd alx-backend-javascript'
alias rn="npm run dev"
pf(){
	yapf -i "$1"; pycodestyle "$1"
}
chjs() {
  sed -i 's/\t/    /g' "$1";semistandard --fix "$1"; semistandard --global \$ "$1"; npx eslint --fix  "$1" && npx eslint "$1"
}
# env variables for spendsmart project
export SPENDSMART_MYSQL_USER=spendsmart_user
export SPENDSMART_MYSQL_PWD=spendsmart_pwd
export SPENDSMART_MYSQL_DB=spendsmart_db
export SPENDSMART_TYPE_STORAGE=db
export SPENDSMART_MYSQL_HOST=localhost
export SPENDSMART_SECRET_KEY=my_secret_key
export SPENDSMART_API_HOST=127.0.0.1
export SPENDSMART_API_PORT=5011

# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --bash)"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  # CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
  # Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
