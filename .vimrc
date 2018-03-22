call plug#begin('~/.vim/plugged')
"UI Plugins
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

"Experience Plugins
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'machakann/vim-sandwich'


" Plug 'w0rp/ale'
" Plug 'racer-rust/vim-racer'
" Plug 'vivien/vim-linux-coding-style'

"Eye candy
Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax on
set hidden
set exrc
set secure
filetype plugin indent on
set encoding=UTF-8
set list listchars=tab:→\ ,nbsp:‡,trail:•,extends:>,precedes:<
set showbreak=\\ " [bonus]
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set background=dark
set hlsearch

"####################Config for Nerdtree
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror

"CTRL-t to toggle tree view with CTRL-t
map <C-n> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>


"####################Config for Nerdcommentar
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

vmap <leader>cc :NERDCommToggleComment<CR>


"####################Config for Airline

let g:airline#extensions#tabline#enabled = 1


"####################Config for Auto-format
autocmd FileType vim,tex,yml let b:autoformat_autoindent=0
au BufWrite * :Autoformat


"####################Config for ALE"

let g:ale_completion_enabled = 1
let g:ale_linters = {
			\   'cpp': ['clang'],
			\}
let g:ale_cpp_clang_executable= 'clang++'
let g:ale_cpp_clang_options = '-std=c++14 -Wall -Wextra -I/home/amar/github/julia_ros_ws/install/include -I/home/amar/github/julia_code/install/include -I/home/amar/github/julia_code/src/julia_embedded/include/'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1

"####################Config for Ycm
let g:ycm_global_ycm_extra_conf = '/home/amar/Dotfiles/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
nmap <leader><space>d :YcmCompleter GoTo<CR>

"####################Config for Rust
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
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1

let g:racer_cmd = "/home/amar/.cargo/bin"
let g:racer_experimental_completer = 1

"####################Config for numbertoggle
set number relativenumber


"####################Config for Unite
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>

"####################Config for snippets
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif


"###################Config for C++




"###################Config for ROS2
nmap  <F2> :w<bar>!rm -fR build/ install/ && ament build --force-cmake-configure <CR>
nmap  <F3> :w<bar>!ament build --force-cmake-configure --only-package=julia_embedded <CR>
nmap  <F5> :w<bar>!teamocil code<CR>
nmap  <F6> :w<bar>!teamocil logger<CR>



"##################Config for Buffers
map <C-l> :ls<CR>
map <C-b> :bp<CR>
map <C-f> :bn<CR>
map <C-g> :e#<CR>


"##################Config for Powerline
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let g:powerline_pycmd="py3"
