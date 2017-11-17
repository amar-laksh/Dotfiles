execute pathogen#infect()
syntax on
set hidden
filetype plugin indent on
set encoding=utf-8
set list listchars=tab:→\ ,trail:ↆ⵿

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
set number relativenumber


if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


Plug 'w0rp/ale'

let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1

Plug 'racer-rust/vim-racer'
set hidden
let g:racer_cmd = "/home/amar/.cargo/bin"
let g:racer_experimental_completer = 1