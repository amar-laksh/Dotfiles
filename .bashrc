#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# FUNCTIONS ###########################################################################################
# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty() {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function git_commit() {
	git add . && git commit -m "$1"
}

man() {
	env \
		LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
		LESS_TERMCAP_md="$(printf "\e[1;31m")" \
		LESS_TERMCAP_me="$(printf "\e[0m")" \
		LESS_TERMCAP_se="$(printf "\e[0m")" \
		LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
		LESS_TERMCAP_ue="$(printf "\e[0m")" \
		LESS_TERMCAP_us="$(printf "\e[1;32m")" \
		man "${@}"
}

# GENERAL ###########################################################################################
export PS1="\[\e[31m\]\u\[\e[m\]: \[\e[32;40m\]\w\[\e[m\]    \[\e[33;40m\]\`parse_git_branch\`\[\e[m\]\n$ "
export $(dbus-launch)
[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "$(dircolors -b $DIR_COLORS)"

# ALIASES ###########################################################################################
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c="clear"
alias b="cd .."

# Github help
alias gh="cd /home/amar/github/"
alias gc=git_commit
alias gd="git diff --stat"
alias p="git push"

alias l="ls -lah"
alias ll="ls -lh"
alias low="for i in {1..3}; do ec-probe write 0x58 0x2D;done"
alias tone='echo "g(i,x,t,o){return((3&x&(i*((3&i>>16?\"BY}6YB6%\":\"Qj}6jQ6%\")[t%8]+51)>>o))<<4);};main(i,n,s){for(i=0;;i++)putchar(g(i,1,n=i>>14,12)+g(i,s=i>>17,n^i>>13,10)+g(i,s/3,n+((i>>11)%3),10)+g(i,s/5,8+n-((i>>10)%3),9));}"|gcc -xc -&&./a.out|aplay'
alias update="sudo pacman -Syyu"
alias serv="python2.7 -m SimpleHTTPServer"
alias nymble="cd /home/github/nymble/"
alias findall="nmap -sP '192.168.1.*'"
alias search="grep -rnw . -e $1"
alias serial="socat -d -d pty,raw,echo=0 pty,raw,echo=0"
alias reset="sudo ip link set wlo1 down && sudo ip link set wlo1 up"
alias toxic="~/Downloads/toxic/run_toxic.sh"
alias sc="while true; do inotifywait -e CREATE ~/Pictures && rename 's/\ /\./g' ~/Pictures/Screenshot*.png; done;"
alias u="du -h -d 1"
# EXPORTS ###########################################################################################
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH="$PATH:$HOME/.cargo/"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:/usr/bin/ping"
export PATH="$PATH:/home/amar/.gem/ruby/2.4.0/bin"
export PATH="$PATH:/home/github/nymble/software/ros2_ws/src/ament/ament_tools/scripts/"
export EDITOR="vim"
export ANDROID_HOME=/home/amar/Android/Sdk/
#export CROSS_COMPILE=arm-linux-gnueabihf-
export GEM_HOME=$HOME/.gem

export PATH=/home/amar/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/amar/.cargo/:/home/amar/.cargo/bin/:/usr/bin/ping:/$PATH:$(ruby -e 'print Gem.user_dir')/bin/:/home/github/nymble/software/ros2_ws/src/ament/ament_tools/scripts/:/home/amar/.cargo/:/home/amar/.cargo/bin/:/usr/bin/ping:/home/github/nymble/software/ros2_ws/src/ament/ament_tools/scripts/:/home/amar/go/bin/
#. ~/ros2_ws/install/setup.bash
export ROS2_CC=gcc
export ROS2_CXX=g++

# ROS2 related
# export ROS_SECURITY_ROOT_DIRECTORY=~/sros2_demo/demo_keys
# export ROS_SECURITY_ENABLE=true
# export ROS_SECURITY_STRATEGY=Enforce
#export CROSS_COMPILE="/home/amar/github/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-"

# Qtrpi related
export QTRPI_QT_VERSION='5.7.0'
export QTRPI_TARGET_DEVICE='linux-rpi3-g++'
export QTRPI_TARGET_HOST='pi@192.168.1.4'
export PATH=/opt/qtrpi/bin:$PATH

# completes ###########################################################################################
complete -W "$(teamocil --list)" teamocil

PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
