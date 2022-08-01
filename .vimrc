" Encoding {{{1
set encoding=utf-8
set fileencodings=utf-8,sjis,cp932,euc-jp
set fileformats=unix,mac,dos
scriptencoding utf-8
" Encoding }}}1

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
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'liuchengxu/vista.vim'
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
Plug 'slim-template/vim-slim'
" }}}3

" Filer {{{3
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'yuki-yano/fern-preview.vim'
" }}}3

" Textobj & Operator {{{3
Plug 'mopp/vim-operator-convert-case'
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-swap'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire' " ie ae
Plug 'kana/vim-textobj-line' " il al
Plug 'kana/vim-textobj-indent' " ii ai iI aI
Plug 'thinca/vim-textobj-between'
Plug 'rhysd/vim-textobj-ruby' " ir ar
Plug 'mattn/vim-textobj-url' " iu au
Plug 'kana/vim-textobj-datetime'
" }}}3

" Move {{{3
Plug 'andymass/vim-matchup'
" }}}3

" Appearance {{{3
Plug 'mhinz/vim-startify'
Plug 'kwkarlwang/bufresize.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kevinhwang91/nvim-bqf'
Plug 'Yggdroot/indentLine'
Plug 'mopp/smartnumber.vim'
" StatusLine {{{4
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}4
" ColorTheme {{{4
Plug 'sainnhe/gruvbox-material'
" }}}4
" }}}3


" Git {{{3
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
" }}}3

" Utils {{{3
Plug 'thinca/vim-qfreplace'
Plug 'cohama/lexima.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'AndrewRadev/linediff.vim'
Plug 'gelguy/wilder.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
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

" AutoCmd {{{ 1
augroup vimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd vimrc <args>
"}}} 1

" Set Options {{{1

" Appearance {{{ 2
set cursorline
set display=lastline
set helplang=ja
set list
set listchars=tab:^\ ,trail:_,extends:>,precedes:<
set number
"set showtabline=2
set synmaxcol=500
set termguicolors
"}}} Appearance

" Indent {{{ 2
set autoindent
set breakindent
set expandtab
set smartindent
set shiftwidth=2
set tabstop=2
"}}} Indent

" Search {{{ 2
set ignorecase
set incsearch
set hlsearch
set smartcase
"}}} Search

" Move {{{ 2
set scrolloff=5
set showmatch
set matchpairs+=<:>
set matchtime=1
set virtualedit+=block
set whichwrap=h,l
" }}} 2

" Folding {{{ 2
set foldcolumn=1
set foldmethod=marker
set nofoldenable
"}}} Folding

" Misc {{{ 2
set autoread
set belloff=all
"}}} Misc

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
xnoremap ; :
xnoremap : ;

nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>/ *
nnoremap <Leader>m %

nnoremap k gk
nnoremap j gj
xnoremap k gk
xnoremap j gj
nnoremap gk k
nnoremap gj j
xnoremap gk k
xnoremap gj j
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
nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader>W <Cmd>update!<CR>
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
nnoremap <silent> <Esc><Esc> <Cmd>nohlsearch<CR>
nnoremap <Leader>gs :<C-u>%s///g<Left><Left><Left>
nnoremap <Leader>gS :<C-u>%s///gc<Left><Left><Left><Left>
xnoremap <Leader>gs :s///g<Left><Left><Left>
xnoremap <Leader>gS :s///gc<Left><Left><Left><Left>
" }}}2 

" Yank {{{2 
nnoremap Y y$ 
nnoremap <silent> <Leader>y <Esc><Cmd>call YanktmpYank()<CR>
nnoremap <silent> <Leader>p <Esc><Cmd>call YanktmpPaste_p()<CR>
nnoremap <silent> <Leader>P <Esc><Cmd>call YanktmpPaste_P()<CR>
xnoremap <silent> <Leader>y <Esc><Cmd>call YanktmpYank()<CR>
xnoremap <silent> <Leader>p <Esc><Cmd>call YanktmpPaste_p()<CR>
xnoremap <silent> <Leader>P <Esc><Cmd>call YanktmpPaste_P()<CR>
" }}}2 

" Increment/Decrement {{{ 2
nnoremap + <C-a>
nnoremap - <C-x>
"}}} Increment/Decrement

" QuickFix {{{ 2
nnoremap [q <Cmd>cprevious<CR>
nnoremap ]q <Cmd>cnext<CR>
function! s:quickfix_toggle() abort
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    botright copen
  endif
endfunction
command! QuickfixToggle call <SID>quickfix_toggle()
nnoremap <silent> <Leader>tq <Cmd>QuickfixToggle<CR>
" }}} 2

" LocationList {{{ 2
nnoremap [l <Cmd>lprevious<CR>
nnoremap ]l <Cmd>lnext<CR>
function! s:location_list_toggle() abort
  let _ = winnr('$')
  lclose
  if _ == winnr('$')
    botright lopen
  endif
endfunction
command! LocationListToggle call <SID>location_list_toggle()
nnoremap <silent> <Leader>tl <Cmd>LocationListToggle<CR>
" }}} 2

" }}}1

" Colorscheme {{{1
colorscheme gruvbox-material
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_transparent_background = 1
" }}} 1

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
  \, 'coc-ultisnips-select'
  \, 'coc-vimlsp'
  \, 'coc-word'
  \, 'coc-yaml'
  \, 'coc-fzf-preview'
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
  nmap <silent> <Leader>gs <Plug>(coc-git-chunkinfo)
  nmap <silent> <Leader>gp <Plug>(coc-git-prevchunk)
  nmap <silent> <Leader>gn <Plug>(coc-git-nextchunk)

  nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  
  function s:show_documentation() abort
    if index(['vim', 'help'], &filetype) >= 0
      execute 'h '.expand('<cword>')
    elseif coc#rpc#ready()
      call CocActionAsync('doHover')
    endif
  endfunction

  function! s:coc_typescript_settings() abort
    nnoremap <silent> <buffer> <Leader>fm <Cmd>CocCommand eslint.executeAutofix<CR><Cmd>CocCommand prettier.formatFile<CR>
  endfunction
  AutoCmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
  
  AutoCmd CursorHold * silent call CocActionAsync('highlight')
endif
" }}}2 

" treesitter {{{2
if s:plug.is_installed("nvim-treesitter")
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  ensure_installed = 'all'
}
EOF
endif

" }}}2

" which-key {{{2
if s:plug.is_installed("vim-which-key")
  nnoremap <silent> <Leader><CR> <Cmd>WhichKey '<Leader>'<CR>
endif
" }}}2 

" fern {{{2
if s:plug.is_installed("fern.vim")
  nnoremap <silent> <C-n> :Fern . -reveal=% -drawer -toggle<CR>
  let g:fern#default_hidden=1
  let g:fern#drawer_width = 40
  let g:fern#renderer = 'nerdfont'
  function! s:fern_settings() abort
    nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
    nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  endfunction
  
  AutoCmd FileType fern call s:fern_settings()

  if s:plug.is_installed("glyph-palette.vim")
    AutoCmd FileType fern call glyph_palette#apply()
  endif
endif

" }}}2 

" ale {{{2
" TODO: move to coc
if s:plug.is_installed("ale")
  let g:ale_linters = {
  \ 'python': ['flake8'],
  \}
  let g:ale_fixers = {
  \ 'python': ['autopep8', 'black', 'isort'],
  \}
  let g:ale_fix_on_save = 1
  " let g:ale_javascript_prettier_use_local_config = 1
  let g:rustfmt_autosave = 1
endif
" }}}2

" fzf {{{2
" if s:plug.is_installed("fzf.vim")
"   nnoremap <silent> <Leader>P :Files<CR>
"   nnoremap <silent> <Leader>G :GFiles?<CR>
"   nnoremap <silent> <Leader>F :Rg<CR>
" endif

if s:plug.is_installed("fzf-preview.vim")
  nmap <Leader>f [fzf-p]
  xmap <Leader>f [fzf-p]
  nnoremap <silent> [fzf-p]a  :<C-u>FzfPreviewFromResourcesRpc project_mru git --experimental-fast<CR>
  nnoremap <silent> [fzf-p]r  :<C-u>FzfPreviewProjectMruFilesRpc --experimental-fast --add-fzf-arg=--no-sort<CR>
  nnoremap <silent> [fzf-p]w  :<C-u>FzfPreviewProjectMrwFilesRpc --experimental-fast --add-fzf-arg=--no-sort<CR>
  nnoremap <silent> [fzf-p]gs :<C-u>FzfPreviewGitStatusRpc --experimental-fast<CR>
  nnoremap <silent> [fzf-p]ga :<C-u>FzfPreviewGitActionsRpc<CR>
  nnoremap <silent> [fzf-p]gb :<C-u>FzfPreviewBlamePRRpc<CR>
  nnoremap <silent> [fzf-p]c  :<C-u>FzfPreviewChangesRpc<CR>
  nnoremap <silent> [fzf-p]/  <Cmd>FzfPreviewLinesRpc --resume --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>
  nnoremap          [fzf-p]gr :<C-u>FzfPreviewProjectGrepRpc --experimental-fast<Space>
  nnoremap <silent> [fzf-p]cm :<C-u>FzfPreviewCommandPaletteRpc --experimental-fast<CR>
  nnoremap <silent> [fzf-p]q  :<C-u>FzfPreviewQuickFixRpc --experimental-fast<CR>
  nnoremap <silent> [fzf-p]l  :<C-u>FzfPreviewLocationListRpc --experimental-fast<CR>
  nnoremap <silent> [fzf-p]todo :<C-u>FzfPreviewTodoCommentsRpc --experimental-fast<CR>
  nnoremap <silent> [fzf-p]d  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
  nnoremap <silent> [fzf-p]D  :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
  nnoremap <silent> [fzf-p]df :<C-u>CocCommand fzf-preview.CocDefinition<CR>
  nnoremap <silent> [fzf-p]rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
  nnoremap <silent> [fzf-p]p  <Cmd>CocCommand fzf-preview.Yankround --add-fzf-arg=--no-sort<CR>

  let g:fzf_preview_command='batcat --color=always --plain --theme=Gruvbox-N {-1}'
endif
" }}}2

" aho-backup {{{2
if s:plug.is_installed("aho-bakaup.vim")
  let g:bakaup_auto_backup = 1
  let g:bakaup_backup_dir  = expand('~/.cache/vim/backup')
endif
" }}}2

" undotree {{{2
" if s:plug.is_installed("undotree")
"   nnoremap <silent> <Leader>u <Cmd>UndotreeToggle<CR>
" endif
" }}}2

" ultisnips {{{2
if s:plug.is_installed("ultisnips")
  let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
endif
" }}}2

" airline {{{2
if s:plug.is_installed("vim-airline-themes")
  let g:airline_theme = "base16_gruvbox_dark_hard"
endif
" }}}2

" wilder {{{2
if s:plug.is_installed("wilder.nvim")
  call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<c-j>',
      \ 'previous_key': '<c-k>',
      \ })
  call wilder#set_option('renderer', wilder#popupmenu_renderer({
        \ 'highlighter': wilder#basic_highlighter(),
        \ }))
endif
" }}}2

" todo-comments {{{2
if s:plug.is_installed("todo-comments.nvim")
lua << EOF
  require("todo-comments").setup {
  }
EOF
endif
" }}}2

" nvim-colorizer {{{2
if s:plug.is_installed("nvim-colorizer.lua")
  lua require('colorizer').setup()
endif
" }}}2

" vista.vim {{{2
if s:plug.is_installed("vista.vim")
  let g:vista_default_executive = 'coc'
  nnoremap <silent> <Leader>v <Cmd>Vista<CR>
  AutoCmd VimEnter * call vista#RunForNearestMethodOrFunction()
endif
" }}}2

" lexima {{{ 2
if s:plug.is_installed("cohama/lexima.vim")
endif
call lexima#add_rule({'char': '>', 'at': '(>\%#)', 'input': '<BS>() => {', 'input_after': '}', 'filetype': ['typescript', 'typescriptreact', 'javascript']})
call lexima#add_rule({'char': '>', 'at': '([a-zA-Z]+>\%#)', 'input': '<BS> => {', 'input_after': '}', 'filetype': ['typescript', 'typescriptreact', 'javascript']})
"}}} 2

" operator/textobj {{{ 2

" operator-convert-case {{{ 3
if s:plug.is_installed("vim-operator-convert-case")
nmap <Leader>cl <Plug>(operator-convert-case-lower-camel)
nmap <Leader>cu <Plug>(operator-convert-case-upper-camel)
nmap <Leader>sl <Plug>(operator-convert-case-lower-snake)
nmap <Leader>su <Plug>(operator-convert-case-upper-snake)
nmap <Leader>tc <Plug>(operator-convert-case-toggle-upper-lower)
xmap <Leader>cl <Plug>(operator-convert-case-lower-camel)
xmap <Leader>cu <Plug>(operator-convert-case-upper-camel)
xmap <Leader>sl <Plug>(operator-convert-case-lower-snake)
xmap <Leader>su <Plug>(operator-convert-case-upper-snake)
xmap <Leader>tc <Plug>(operator-convert-case-toggle-upper-lower)
endif
"}}} 3

" vim-operator-replace {{{ 3
if s:plug.is_installed("vim-operator-replace")
nmap _ <Plug>(operator-replace)
xmap _ <Plug>(operator-replace)
endif
"}}} 3

" swap {{{ 3
if s:plug.is_installed("vim-swap")
nmap g< <Plug>(swap-prev)
nmap g> <Plug>(swap-next)
nmap gs <Plug>(swap-interactive)
xmap g< <Plug>(swap-prev)
xmap g> <Plug>(swap-next)
xmap gs <Plug>(swap-interactive)

nmap <Leader>i, <Plug>(swap-textobject-i)
nmap <Leader>a, <Plug>(swap-textobject-a)
xmap <Leader>i, <Plug>(swap-textobject-i)
xmap <Leader>a, <Plug>(swap-textobject-a)
endif
"}}} 3

" sandwich {{{3
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
" }}}3

" startify {{{3
if s:plug.is_installed("vim-startify")
let g:startify_change_to_dir = 0
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ ]
endif
let g:startify_custom_header = [
      \' ██████╗████████╗███╗   ██╗ █████╗  ██████╗     ██╗   ██╗██╗███╗   ███╗',
      \'██╔════╝╚══██╔══╝████╗  ██║██╔══██╗██╔═══██╗    ██║   ██║██║████╗ ████║',
      \'██║  ███╗  ██║   ██╔██╗ ██║███████║██║   ██║    ██║   ██║██║██╔████╔██║',
      \'██║   ██║  ██║   ██║╚██╗██║██╔══██║██║   ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║',
      \'╚██████╔╝  ██║   ██║ ╚████║██║  ██║╚██████╔╝     ╚████╔╝ ██║██║ ╚═╝ ██║',
      \' ╚═════╝   ╚═╝   ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝       ╚═══╝  ╚═╝╚═╝     ╚═╝',
      \]
" }}}3

"}}} 2

" }}}1

" FileType settings {{{1

" indent {{{2
AutoCmd FileType java               setlocal expandtab    shiftwidth=4 softtabstop=4 tabstop=4
AutoCmd FileType javascript         setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType javascriptreact    setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType typescript         setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType typescriptreact    setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType ruby               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType python             setlocal expandtab    shiftwidth=4 softtabstop=4 tabstop=4
AutoCmd FileType rust               setlocal expandtab    shiftwidth=4 softtabstop=4 tabstop=4
AutoCmd FileType go                 setlocal noexpandtab  shiftwidth=4 softtabstop=4 tabstop=4
AutoCmd FileType json               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType markdown           setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType html               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType css                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType scss               setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType vim                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType sh                 setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
AutoCmd FileType zsh                setlocal expandtab    shiftwidth=2 softtabstop=2 tabstop=2
" }}}2

" iskeyword {{{2
AutoCmd FileType html               setlocal iskeyword+=-
AutoCmd FileType css                setlocal iskeyword+=- iskeyword+=#
AutoCmd FileType scss               setlocal iskeyword+=- iskeyword+=# iskeyword+=@-@
AutoCmd FileType ruby               setlocal iskeyword+=@-@ iskeyword+=! iskeyword+=? iskeyword+=&
AutoCmd FileType vim                setlocal iskeyword+=-
AutoCmd FileType sh                 setlocal iskeyword+=-
AutoCmd FileType zsh                setlocal iskeyword+=-
" }}}2

" }}}1

