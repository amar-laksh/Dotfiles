execute pathogen#infect()
syntax on
set hidden
set exrc
set secure
filetype plugin indent on
set encoding=utf-8
set list listchars=tab:→\ ,trail:ↆ⵿

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror

"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-t> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

"let g:rustfmt_autosave = 1
let g:ycm_rust_src_path = "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
set mouse=a
set autoread
au CursorHold * checktime

"let g:neomake_echo_current_error=1
"let g:neomake_verbose=0
"autocmd! BufWritePost *.rs NeomakeProject cargo


if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

call plug#begin('~/.vim/plugged')

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'drewtempelmeyer/palenight.vim'
set number relativenumber


if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


Plug 'w0rp/ale'

let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1

Plug 'racer-rust/vim-racer'
Plug 'vivien/vim-linux-coding-style'
set hidden
let g:racer_cmd = "/home/amar/.cargo/bin"
let g:racer_experimental_completer = 1
 let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-4.0.so.1'

"Commands for ROS2
nmap  <F2> :w<bar>!rm -fR build/ install/ && ament build --force-cmake-configure <CR>
nmap  <F3> :w<bar>!ament build --force-cmake-configure --only-package=julia_embedded <CR>
nmap  <F5> :w<bar>!teamocil code<CR>
nmap  <F6> :w<bar>!teamocil logger<CR>

map <C-n> :NERDTreeToggle<CR>

map <C-l> :ls<CR>
map <C-b> :bp<CR>
map <C-f> :bn<CR>
map <C-g> :e#<CR>
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set background=dark
