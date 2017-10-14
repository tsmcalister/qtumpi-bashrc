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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
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
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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
QCLI="/home/pi/qtum-0.14.3/bin/qtum-cli"
QVERSION="$(${QCLI} getinfo | jq -r '.version')"
STAKINGSTATUS="$(${QCLI} getstakinginfo | jq -r '.staking')"
NETWORKWEIGHT="$(${QCLI} getstakinginfo | jq -r '.netstakeweight')"
STAKINGWEIGHT="$(${QCLI} getstakinginfo | jq -r '.weight')"
WALLETBALANCE="$(${QCLI} getwalletinfo | jq -r '.balance')"
QTUMDL="$(ps -ef | grep ./qtumd | wc -l)"
if [ QTUMD > 1 ]; then
    QTUMDS="running"
else
    QTUMDS="stopped"
fi

tput setaf 4
echo ""                                          
echo "                        .:,               .:,                              "
echo "                       it11t;;;;;;;;;;;;;1t11t.                            "
echo "                      :t1tti             ,tttti.                           "
echo "                   .t1.;1  ;t           ;t. ,t ;f;                         "
echo "                .1t,  :t    .t:       .t;    :t   it,                      "
echo "              ;f:    ,t       i1     :t.      ;1    .1t.                   "
echo "        .t1tti      ,t.        .f: .ti         ii      ,tt1ti              "
echo "        :t11t1,    .f.          ;t111           1;    .;t1t1t              "
echo "         ;t;   :tt11t;;1ttftt1;:;tt11:;1ttfft1i:t11tti.  .tt.              "
echo "        ,t:1     t1tt:          1i ,f.          t1tt:    ,1:1              "
echo "        t,,t    .t, t,         t;   .f,         t: 1;    :1 t:             "
echo "       ;i .t.  .f,  .t,      .t:      t:       1;   1;   ;i .f.            "
echo "      ,t   t. .f,    .f.    .f,        1;     1;     1i  i:  ;i            "
echo "      t,   t,.f.      .f.  ,f.          i1   ii       ii 1,   t,           "
echo "     ;i    i;f.        ,f.:t             :t i1         ii1.   ,t           "
echo "  .t11ti,:t11t;,,,,,,,,1t11t,,,,,,,,,,,,,it11t:,,,,,,,,t1111,:t11t;        "
echo "   1t1t,  tt1t.        ,t1ti             ,t1t1         :t1t:  1t1f,        "
echo "     ,t    1:t:        ;1 .t,            t; ,t         t:t,   :1           "
echo "      i;   t, t:      :1    t:          t:   :t       t, 1:  .t.           "
echo "      .f. .t.  1;    :t      1;       .f,     :1    .t,  i;  1:            "
echo "       :1 .t    1;  ,t        i1     ,t.       ;1  .f,   ;i :1             "
echo "        1;,1     ii;t          :t   :t          ;1:t.    :1.t.             "
echo "        .t:1    .t11ti.         ,t;i1         .,t11ti    ,1i;              "
echo "         ;t1..if1ittt. ..,:;ittft111tttt1i;,... ;ttt;f1: .t1               "
echo "        ;t11t,      1:          ,ttti          .t,      ,1t:               "
echo "         ;tt;f:      t,        i1   :t.        t:     .t1. .ti             "
echo "              .1t,   .t,     .t:     .t;      1;    it,      .1t.          "
echo "                 .t1. .t.   ;t.        ;t.   1;  ;f:            ;tt11ti    "
echo "                    :ti,t..t;           .t: ii,ti               111111t,   "
echo "                       it111.............;t11t.                 .t111ti    "
echo "                       :t1t1             :t1t1                     .       "
echo""
tput setaf 7
echo "                    _____ _____ _____ _____     _ "
echo "                   |     |_   _|  |  |     |___|_|"
echo "                   |  |  | | | |  |  | | | | . | |"
echo "                   |__  _| |_| |_____|_|_|_|  _|_|"
echo "                      |__|                 |_|    "

echo ""
tput setaf 1
echo -e "                 Qtum deamon:\t\t${QTUMDS}"
echo -e "                 Version:\t\t${QVERSION}"
echo -e "                 Staking:\t\t${STAKINGSTATUS}"
if [ "${STAKINGSTATUS}" = "true" ]; then
    echo -e "                 Staking weight:\t${STAKINGWEIGHT}"
    echo -e "                 Network weight:\t${NETWORKWEIGHT}"
fi
echo -e "                 QTUM balance:\t\t${WALLETBALANCE}"