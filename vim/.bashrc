#

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"


function git_commit(){
	git add . && git commit -m "$1" && git push
}
[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
alias c="clear"
alias l="ls -lh"
alias b="cd .."
alias gh="cd /home/github/"
alias serv="python2.7 -m SimpleHTTPServer"
alias commit=git_commit
alias cspeed="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

PATH="/home/github/rust-wasm-webpack-tutorial/emsdk-portable:$PATH"
PATH="/home/github/rust-wasm-webpack-tutorial/emsdk-portable/clang/fastcomp/build_incoming_64/bin:$PATH"
PATH="/home/github/rust-wasm-webpack-tutorial/emsdk-portable/emscripten/incoming:$PATH"
PATH="~/.cargo/bin/:$PATH"
RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH=$HOME/bin:$PATH
