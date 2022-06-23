" PluginManager {{{1 

" Init PluginManager {{{2

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ${MYVIMRC}
endif

" }}}2

" Install plugins {{{2

call plug#begin()

" Filer IDE {{{3
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter'
" }}}3

" Filer Languages {{{3
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
" Plug 'rhysd/vim-fixjson'
Plug 'mechatroner/rainbow_csv'
" }}}3

" Filer {{{3
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
" }}}3

" Textobj & Operator {{{3
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-swap'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire' " ie ae
Plug 'kana/vim-textobj-line' " il al
Plug 'kana/vim-textobj-indent' " ii ai iI aI
Plug 'rhysd/vim-textobj-ruby' " ir ar
Plug 'mattn/vim-textobj-url' " iu au
" }}}3

" Appearance {{{3
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
" }}}3

" Git {{{3
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
" }}}3

" Utils {{{3
Plug 'cohama/lexima.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'AndrewRadev/linediff.vim'
Plug 'gelguy/wilder.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tyru/vim-altercmd'
Plug 'tpope/vim-commentary'
Plug 'thinca/vim-quickrun'
Plug 'mbbill/undotree'
Plug 'LeafCage/yankround.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'sirver/ultisnips'
Plug 'liuchengxu/vim-which-key'
Plug 'aiya000/aho-bakaup.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'rcarriga/nvim-notify'
Plug 'vim-scripts/yanktmp.vim'
" }}}3


call plug#end()

" }}}2

" }}}1


" Set Options {{{1

set helplang=ja
set encoding=utf-8

set autoread
set autoindent

set number
set cursorline
set showmatch

set expandtab
set tabstop=2
set shiftwidth=2

set foldcolumn=1
set nofoldenable
set foldmethod=marker

set incsearch
set hlsearch
set ignorecase
set smartindent

set whichwrap=h,l

set termguicolors

filetype plugin indent on

let g:python3_host_prog = system('echo -n $(which python3)')

" }}}1


" Keymaps {{{1

" Prefix {{{2 
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
" }}}2 

" Replace {{{2 
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>/ *
nnoremap <Leader>m %

nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap gk k
nnoremap gj j
vnoremap gk k
vnoremap gj j
" }}}2 

" Disable {{{2 
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" }}}2 

" Reload {{{2 
nnoremap <Leader>r <Cmd>source ${MYVIMRC}<CR>
" }}}2 

" Save {{{2 
nnoremap <silent> <Leader>w <Cmd>update<CR>
nnoremap <silent> <Leader>W <Cmd>update!<CR>
" }}}2 

" Quit {{{2 
nnoremap <Leader>q <Cmd>quit<CR>
nnoremap <Leader>Q <Cmd>quit!<CR>
" }}}2 

" Back {{{2 
inoremap <C-h> <BS>
cnoremap <C-h> <BS>
" }}}2 

" Resize window {{{2 
nnoremap <silent> <Left> <Cmd>vertical resize -5<Cr>
nnoremap <silent> <Right> <Cmd>vertical resize +5<Cr>
nnoremap <silent> <Up> <Cmd>resize -5<Cr>
nnoremap <silent> <Down> <Cmd>resize +5<Cr>
" }}}2 

" Insert empty lines {{{2 
nnoremap <Leader>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
" }}}2 

" Search & Replace {{{2 
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <Leader>gs :<C-u>%s///g<Left><Left><Left>
nnoremap <Leader>gS :<C-u>%s///gc<Left><Left><Left><Left>
vnoremap <Leader>gs :s///g<Left><Left><Left>
vnoremap <Leader>gS :s///gc<Left><Left><Left><Left>
" }}}2 

" Yank {{{2 
nnoremap <silent> sy :call YanktmpYank()<CR>
nnoremap <silent> sp :call YanktmpPaste_p()<CR>
nnoremap <silent> sP :call YanktmpPaste_P()<CR>
vnoremap <silent> sy :call YanktmpYank()<CR>
vnoremap <silent> sp :call YanktmpPaste_p()<CR>
vnoremap <silent> sP :call YanktmpPaste_P()<CR>
" }}}2 

" }}}1


" Colorscheme {{{1

colorscheme gruvbox-material

" }}} 1


" Functions {{{1
" let g:rpbcopy_on = 0
" function! s:toggle_rpbcopy() abort
"   if g:rpbcopy_on != 1
"     g:rpbcopy_on = 1
"   else
"     g:rpbcopy_on = 0
"   endif
" endfunction
" command! ToggleRpbcopy call <SID>toggle_rpbcopy()
" nnoremap <Leader>c <Cmd>ToggleRpbcopy<CR>

" function! s:rpbcopy_yanked(rows) abort
"   " if g:rpbcopy_on != 1
"   "   return
"   " endif
"   let str = shellescape(join(map(a:rows, "escape(v:val, '\')"), "\n"))
"   call system("echo ".str." | rpbcopy")
" endfunction
" autocmd TextYankPost * call s:rpbcopy_yanked(v:event.regcontents)

" }}}1


" Plugin settings {{{1

" ref: https://qiita.com/b4b4r07/items/fa9c8cceb321edea5da0
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }
function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" altercmd {{{2
if s:plug.is_installed("vim-altercmd")
  call altercmd#load()
  AlterCommand pi PlugInstall
endif
" }}}2 

" coc {{{2
if s:plug.is_installed("coc.nvim")
  let g:coc_global_extensions = [
  \  'coc-calc'
  \, 'coc-clangd'
  \, 'coc-css'
  \, 'coc-docker'
  \, 'coc-eslint'
  \, 'coc-git'
  \, 'coc-go'
  \, 'coc-highlight'
  \, 'coc-html'
  \, 'coc-java'
  \, 'coc-jedi'
  \, 'coc-json'
  \, 'coc-lists'
  \, 'coc-markdownlint'
  \, 'coc-prettier'
  \, 'coc-rust-analyzer'
  \, 'coc-sh'
  \, 'coc-solargraph'
  \, 'coc-spell-checker'
  \, 'coc-sql'
  \, 'coc-svg'
  \, 'coc-tsserver'
  \, 'coc-vimlsp'
  \, 'coc-word'
  \, 'coc-yaml'
  \ ]

  inoremap <silent><expr> <C-c> coc#refresh()
  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  nnoremap <silent> <Leader>K <Cmd>call <SID>show_documentation()<CR>
  nmap <silent> <Leader>dp <Plug>(coc-diagnostic-prev)
  nmap <silent> <Leader>dn <Plug>(coc-diagnostic-next)
  nmap <silent> <Leader>df <Plug>(coc-definition)
  nmap <silent> <Leader>im <Plug>(coc-implementation)
  nmap <silent> <Leader>rf <Plug>(coc-references)
  nmap <silent> <Leader>ty <Plug>(coc-type-definition)
  nmap <silent> <Leader>rn <Plug>(coc-rename)
  nmap <silent> <Leader>fm <Plug>(coc-format)
  nmap <silent> <Leader>gp <Plug>(coc-git-prevchunk)
  nmap <silent> <Leader>gn <Plug>(coc-git-nextchunk)

  nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

  nmap <Leader>ca <Plug>(coc-calc-result-append)
  nmap <Leader>cr <Plug>(coc-calc-result-replace)
  
  function s:show_documentation() abort
    if index(['vim', 'help'], &filetype) >= 0
      execute 'h '.expand('<cword>')
    elseif coc#rpc#ready()
      call CocActionAsync('doHover')
    endif
  endfunction
  
  autocmd CursorHold * silent call CocActionAsync('highlight')
endif
" }}}2 

" treesitter {{{2

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  ensure_installed = 'all'
}
EOF

" }}}2

" which-key {{{2
if s:plug.is_installed("vim-which-key")
  nnoremap <silent> <Leader><CR> <Cmd>WhichKey '<Leader>'<CR>
endif
" }}}2 

" fern {{{2
if s:plug.is_installed("fern.vim")
  nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
  let g:fern#default_hidden=1
  let g:fern#renderer = 'nerdfont'
  function! s:fern_settings() abort
    nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
    nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  endfunction
  
  augroup fern-settings
    autocmd!
    autocmd FileType fern call s:fern_settings()
  augroup END
endif
" }}}2 

" ale {{{2
if s:plug.is_installed("ale")
  let g:ale_linters = {
  \ 'python': ['flake8'],
  \}
  let g:ale_fixers = {
  \ 'ruby': ['rubocop'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'typescriptreact': ['prettier', 'eslint'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'javascriptreact': ['prettier', 'eslint'],
  \ 'python': ['autopep8', 'black', 'isort'],
  \}
  let g:ale_fix_on_save = 1
  let g:ale_javascript_prettier_use_local_config = 1
  let g:rustfmt_autosave = 1
endif
" }}}2

" fzf {{{2
if s:plug.is_installed("fzf.vim")
  nnoremap <silent> <Leader>P :Files<CR>
  nnoremap <silent> <Leader>G :GFiles?<CR>
  nnoremap <silent> <Leader>F :Rg<CR>
endif
" }}}2

" sandwich {{{2
if s:plug.is_installed("vim-sandwich")
  let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
  let g:sandwich#recipes += [
    \ {
    \   'buns':     ['${', '}'],
    \   'input':    ['$'],
    \   'filetype': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
    \ },
    \ {
    \   'buns':     ['#{', '}'],
    \   'input':    ['#'],
    \   'filetype': ['ruby'],
    \ }
  \]
endif
" }}}2

" aho-backup {{{2
if s:plug.is_installed("aho-bakaup.vim")
  let g:bakaup_auto_backup = 1
  let g:bakaup_backup_dir  = expand('~/.cache/vim/backup')
endif
" }}}2

" undotree {{{2
if s:plug.is_installed("undotree")
  nnoremap <silent> <Leader>u <Cmd>UndotreeToggle<CR>
endif
" }}}2

" ultisnips {{{2
if s:plug.is_installed("ultisnips")
  let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
  let g:UltiSnipsExpandTrigger='<c-j>'
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endif
" }}}2

" airline {{{2
if s:plug.is_installed("vim-airline-themes")
  let g:airline_theme = "base16_gruvbox_dark_hard"
endif
" }}}2

" wilder {{{2
if s:plug.is_installed("wilder.nvim")
  call wilder#setup({'modes': [':', '/', '?']})
  call wilder#set_option('renderer', wilder#popupmenu_renderer({
        \ 'highlighter': wilder#basic_highlighter(),
        \ }))
endif
" }}}2

" todo-comments {{{2
if s:plug.is_installed("todo-comments.nvim")
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
endif
" }}}2

" nvim-colorizer {{{2
if s:plug.is_installed("nvim-colorizer.lua")
  lua require('colorizer').setup()
endif
" }}}2

" nvim-notify {{{2
if s:plug.is_installed("nvim-notify")
  " debug
  lua require("notify")("My super important message")
endif
" }}}2

" }}}1


" FileType settings {{{1

" indent {{{2
autocmd FileType java               setlocal expandtab    shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType javascript         setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascriptreact    setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript         setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescriptreact    setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType ruby               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python             setlocal expandtab    shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType rust               setlocal expandtab    shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go                 setlocal noexpandtab  shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType json               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown           setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType scss               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vim                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sh                 setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType zsh                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
" }}}2

" iskeyword {{{2
autocmd FileType html               setlocal iskeyword+=-
autocmd FileType css                setlocal iskeyword+=- iskeyword+=#
autocmd FileType scss               setlocal iskeyword+=- iskeyword+=# iskeyword+=@-@
autocmd FileType ruby               setlocal iskeyword+=@-@ iskeyword+=! iskeyword+=? iskeyword+=&
autocmd FileType vim                setlocal iskeyword+=-
autocmd FileType sh                 setlocal iskeyword+=-
autocmd FileType zsh                setlocal iskeyword+=-
" }}}2

" }}}1

