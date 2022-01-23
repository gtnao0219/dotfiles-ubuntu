let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'neoclide/coc.nvim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

set autoread
set encoding=utf-8
set number
set cursorline
set smartindent
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2

nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden=1
let g:fern#renderer = 'nerdfont'

let g:coc_global_extensions = [
\  'coc-json'
\, 'coc-html'
\, 'coc-css'
\, 'coc-tsserver'
\, 'coc-solargraph'
\, 'coc-python'
\, 'coc-rls'
\ ]

let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier'],
\ 'javascript': ['prettier'],
\ 'javascriptreact': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:rustfmt_autosave = 1

let g:fzf_preview_command = 'bat --color=always --style=plain'
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>

