#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export $(dbus-launch)

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
function git_commit() {
	git add . && git commit -m "$1"
}
alias c="clear"
alias b="cd .."
alias gh="cd /home/github/"
alias commit=git_commit
alias l="ls -lah"
alias ll="ls -lh"
alias low="for i in {1..3}; do ec-probe write 0x58 0x2D;done"
alias tone='echo "g(i,x,t,o){return((3&x&(i*((3&i>>16?\"BY}6YB6%\":\"Qj}6jQ6%\")[t%8]+51)>>o))<<4);};main(i,n,s){for(i=0;;i++)putchar(g(i,1,n=i>>14,12)+g(i,s=i>>17,n^i>>13,10)+g(i,s/3,n+((i>>11)%3),10)+g(i,s/5,8+n-((i>>10)%3),9));}"|gcc -xc -&&./a.out|aplay'
alias update=y"aourt -Syyu --aur"
alias serv="python2.7 -m SimpleHTTPServer"
alias nymble="cd /home/github/nymble/"
alias findall="nmap -sP '192.168.1.*'"
alias search="grep -rnw . -e $1"
alias serial="socat -d -d pty,raw,echo=0 pty,raw,echo=0"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH="$PATH:$HOME/.cargo/"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:/usr/bin/ping"
export PATH="$PATH:/home/amar/.gem/ruby/2.4.0/bin"
export PATH="$PATH:/home/github/nymble/software/ros2_ws/src/ament/ament_tools/scripts/"
export EDITOR="vim"

complete -W "$(teamocil --list)" teamocil
