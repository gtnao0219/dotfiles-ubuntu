let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'neoclide/coc.nvim'
call plug#end()

set number
set cursorline
set smartindent
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2

let NERDTreeShowHidden=1
map <C-n> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

