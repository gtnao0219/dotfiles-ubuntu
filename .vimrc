" PluginManager {{{1 

" Init PluginManager {{{2

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ${MYVIMRC}
endif

""" }}}2

"" Install plugins {{{2

call plug#begin()
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-denops/denops.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

Plug 'tyru/vim-altercmd'
Plug 'rhysd/vim-fixjson'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'mechatroner/rainbow_csv'
Plug 'thinca/vim-quickrun'
Plug 'lambdalisue/gina.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mbbill/undotree'
Plug 'sirver/ultisnips'
" Plug 'tpope/vim-endwise'
call plug#end()

"" }}}2

"" }}}1


"" Set Options {{{1

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

filetype plugin indent on
let g:python3_host_prog = system('echo -n $(which python3)')

"" }}}1


"" Keymaps {{{1

"" leader
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>

" replace
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

" disable
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>


"" reload
nnoremap <Leader>r <Cmd>source ${MYVIMRC}<CR>

"" save
nnoremap <silent> <Leader>w <Cmd>update<CR>

"" quit
nnoremap <Leader>q <Cmd>quit<CR>
nnoremap <Leader>Q <Cmd>quit!<CR>


"" backspace
inoremap <C-h> <BS>
cnoremap <C-h> <BS>

"" resize
nnoremap <silent> <Left> <Cmd>vertical resize -5<Cr>
nnoremap <silent> <Right> <Cmd>vertical resize +5<Cr>
nnoremap <silent> <Up> <Cmd>resize -5<Cr>
nnoremap <silent> <Down> <Cmd>resize +5<Cr>

" insert
nnoremap <Space>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"" search & replace
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap gs :<C-u>%s///g<Left><Left><Left>
nnoremap gS :<C-u>%s///gc<Left><Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>
vnoremap gS :s///gc<Left><Left><Left><Left>

"" }}}1


"" Colorscheme {{{1

colorscheme gruvbox-material

"" }}} 1


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

function! s:rpbcopy_yanked(rows) abort
  " if g:rpbcopy_on != 1
  "   return
  " endif
  let str = shellescape(join(map(a:rows, "escape(v:val, '\')"), "\n"))
  call system("echo ".str." | rpbcopy")
endfunction
" autocmd TextYankPost * call s:rpbcopy_yanked(v:event.regcontents)

" }}}1


"" Plugin settings {{{1

"" ref: https://qiita.com/b4b4r07/items/fa9c8cceb321edea5da0
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }
function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

"" altercmd
if s:plug.is_installed("vim-altercmd")
  call altercmd#load()
  AlterCommand pi PlugInstall
endif

"" coc
if s:plug.is_installed("coc.nvim")
  let g:coc_global_extensions = [
  \  'coc-docker'
  \, 'coc-git'
  \, 'coc-json'
  \, 'coc-html'
  \, 'coc-css'
  \, 'coc-tsserver'
  \, 'coc-solargraph'
  \, 'coc-jedi'
  \, 'coc-rls'
  \, 'coc-sql'
  \, 'coc-word'
  \, 'coc-yaml'
  \ ]
endif

if s:plug.is_installed("vim-which-key")
  nnoremap <silent> <Leader><CR> <Cmd>WhichKey '<Leader>'<CR>
endif

"" Fern
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

"" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

"" ale
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

"" fzf
let g:fzf_preview_command = 'bat --color=always --style=plain'
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles?<CR>
nnoremap <silent> <C-f> :Rg<CR>

"" gina
if s:plug.is_installed("gina.nvim")
  nnoremap <Leader>gs :!git status<CR>
endif

"" undotree {{{2
if s:plug.is_installed("undotree")
  nnoremap <silent> <Leader>u <Cmd>UndotreeToggle<CR>
endif

"" undotree {{{2
if s:plug.is_installed("ultisnips")
  let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
  let g:UltiSnipsExpandTrigger='<c-j>'
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endif

"" }}}2

"" }}}1

"" FileType settings {{{1

"" indent {{{2
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
autocmd FileType vim                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sh                 setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType zsh                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
""" }}}2

"" iskeyword {{{2
autocmd FileType html               setlocal iskeyword+=-
autocmd FileType css                setlocal iskeyword+=- iskeyword+=#
autocmd FileType ruby               setlocal iskeyword+=@-@ iskeyword+=! iskeyword+=? iskeyword+=&
autocmd FileType vim                setlocal iskeyword+=-
autocmd FileType sh                 setlocal iskeyword+=-
autocmd FileType zsh                setlocal iskeyword+=-
""" }}}2

"" }}}1

