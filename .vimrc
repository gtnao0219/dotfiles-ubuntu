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

" IDE {{{3
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'liuchengxu/vista.vim'
Plug 'gelguy/wilder.nvim'
Plug 'sirver/ultisnips'
Plug 'github/copilot.vim'
" }}}3

" Denops {{{3
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'vim-skk/skkeleton'

" }}}3

" FuzzyFinder {{{ 3
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
"}}} 3

" Languages {{{3
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'windwp/nvim-ts-autotag'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
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
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-textobj-entire' " ie ae
Plug 'kana/vim-textobj-line' " il al
Plug 'kana/vim-textobj-indent' " ii ai iI aI
Plug 'kana/vim-textobj-datetime'
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-swap'
Plug 'mopp/vim-operator-convert-case'
Plug 'thinca/vim-textobj-between'
Plug 'mattn/vim-textobj-url' " iu au
Plug 'rhysd/vim-textobj-ruby' " ir ar
" }}}3

" Move {{{3
Plug 'andymass/vim-matchup'
Plug 'phaazon/hop.nvim'
" }}}3

" Edit {{{3
Plug 'jsborjesson/vim-uppercase-sql'
Plug 'osyo-manga/vim-jplus'
Plug 't9md/vim-textmanip'
Plug 'osyo-manga/vim-trip'
Plug 'thinca/vim-qfreplace'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
" }}}3

" Appearance {{{3
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Yggdroot/indentLine'
Plug 'mopp/smartnumber.vim'
Plug 'folke/todo-comments.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'mtdl9/vim-log-highlighting'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" StatusLine {{{4
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
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
Plug 'tyru/vim-altercmd'
Plug 'mtth/scratch.vim'
Plug 'thinca/vim-quickrun'
Plug 'lambdalisue/vim-quickrun-neovim-job'
Plug 'rcarriga/nvim-notify'
Plug 'farmergreg/vim-lastplace'
Plug 'AndrewRadev/linediff.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
Plug 'vim-scripts/yanktmp.vim'
Plug 'LeafCage/yankround.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'aiya000/aho-bakaup.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-jp/vimdoc-ja'
" }}}3

call plug#end()
" }}}2
" }}}1

" Helper {{{ 1
" AutoCmd {{{ 2
augroup vimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd vimrc <args>
"}}} 2
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

" Indent {{{2
nnoremap < <<
nnoremap > >>
xnoremap < <gv
xnoremap > >gv
" }}}2

" Paste command mode {{{2
vnoremap <C-p> y:<C-r>"
cnoremap <C-p> <C-r>"
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
" nnoremap + <C-a>
" nnoremap - <C-x>
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

" IDE {{{2

" coc {{{3
if s:plug.is_installed("coc.nvim")
  let g:coc_global_extensions = [
  \  'coc-calc'
  \, 'coc-clangd'
  \, 'coc-css'
  \, 'coc-diagnostic'
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
  \, 'coc-sqlfluff'
  \, 'coc-svg'
  \, 'coc-tsserver'
  \, 'coc-ultisnips-select'
  \, 'coc-vimlsp'
  \, 'coc-word'
  \, 'coc-yaml'
  \, 'coc-fzf-preview'
  \ ]
  call coc#config('suggest.completionItemKindLabels.class', "\Uff9a9")
  call coc#config('suggest.completionItemKindLabels.constant', "\Uff8ff")
  call coc#config('suggest.completionItemKindLabels.default', "\Uff29c")
  call coc#config('suggest.completionItemKindLabels.enum', "\Uff435")
  call coc#config('suggest.completionItemKindLabels.field', "\Uff93d")
  call coc#config('suggest.completionItemKindLabels.function', "\Uff794")
  call coc#config('suggest.completionItemKindLabels.interface', "\Uffa52")
  call coc#config('suggest.completionItemKindLabels.method', "\Uff6a6")
  call coc#config('suggest.completionItemKindLabels.module', "\Uff668")
  call coc#config('suggest.completionItemKindLabels.property', "\Uffab6")
  call coc#config('suggest.completionItemKindLabels.struct', "\Uffb44")
  call coc#config('suggest.completionItemKindLabels.typeParameter', "\Uff278")
  call coc#config('suggest.completionItemKindLabels.variable', "\Uff71b")
  
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
" }}}3

" treesitter {{{3
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

if s:plug.is_installed("nvim-ts-autotag")
  lua require('nvim-ts-autotag').setup()
endif

endif
" }}}3

" vista.vim {{{3
if s:plug.is_installed("vista.vim")
  let g:vista_icon_indent = ["󳄀󳄂 ", "󳄁󳄂 "]
  let g:vista_default_executive = 'coc'
  " ref: https://github.com/miiton/Cica/issues/45
  let g:vista#renderer#icons = {
            \ 'func':           "\Uff794",
            \ 'function':       "\Uff794",
            \ 'functions':      "\Uff794",
            \ 'var':            "\Uff71b",
            \ 'variable':       "\Uff71b",
            \ 'variables':      "\Uff71b",
            \ 'const':          "\Uff8ff",
            \ 'constant':       "\Uff8ff",
            \ 'method':         "\Uff6a6",
            \ 'package':        "\Ufe612",
            \ 'packages':       "\Ufe612",
            \ 'enum':           "\Uff435",
            \ 'enumerator':     "\Uff435",
            \ 'module':         "\Uff668",
            \ 'modules':        "\Uff668",
            \ 'type':           "\Ufe22b",
            \ 'typedef':        "\Ufe22b",
            \ 'types':          "\Ufe22b",
            \ 'field':          "\Uff93d",
            \ 'fields':         "\Uff93d",
            \ 'macro':          "\Uff8a3",
            \ 'macros':         "\Uff8a3",
            \ 'map':            "\Uffb44",
            \ 'class':          "\Uff9a9",
            \ 'augroup':        "\Uffb44",
            \ 'struct':         "\Uffb44",
            \ 'union':          "\Uffacd",
            \ 'member':         "\Uff02b",
            \ 'target':         "\Uff893",
            \ 'property':       "\Uffab6",
            \ 'interface':      "\Uffa52",
            \ 'namespace':      "\Uff475",
            \ 'subroutine':     "\Uff915",
            \ 'implementation': "\Uff87a",
            \ 'typeParameter':  "\Uff278",
            \ 'default':        "\Uff29c"
            \ }
  nnoremap <silent> <Leader>v <Cmd>Vista<CR>
  AutoCmd VimEnter * call vista#RunForNearestMethodOrFunction()
endif
" }}}3

" wilder.nvim {{{3
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
" }}}3

" ultisnips {{{3
if s:plug.is_installed("ultisnips")
  let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
endif
" }}}3

" }}}2

" FuzzyFinder {{{2
if s:plug.is_installed("fzf-preview.vim")
  nmap <Leader>f <Plug>(fzf-p)
  xmap <Leader>f <Plug>(fzf-p)
  nnoremap <Plug>(fzf-p) <Nop>
  xnoremap <Plug>(fzf-p) <Nop>
  nnoremap <silent> <Plug>(fzf-p)aa :<C-u>FzfPreviewFromResourcesRpc project_mru git --experimental-fast<CR>
  nnoremap <silent> <Plug>(fzf-p)ar :<C-u>FzfPreviewProjectMruFilesRpc --experimental-fast --add-fzf-arg=--no-sort<CR>
  nnoremap <silent> <Plug>(fzf-p)aw :<C-u>FzfPreviewProjectMrwFilesRpc --experimental-fast --add-fzf-arg=--no-sort<CR>
  nnoremap <silent> <Plug>(fzf-p)gs :<C-u>FzfPreviewGitStatusRpc --experimental-fast<CR>
  nnoremap <silent> <Plug>(fzf-p)ga :<C-u>FzfPreviewGitActionsRpc<CR>
  nnoremap <silent> <Plug>(fzf-p)gb :<C-u>FzfPreviewBlamePRRpc<CR>
  nnoremap <silent> <Plug>(fzf-p)c  :<C-u>FzfPreviewChangesRpc<CR>
  nnoremap <silent> <Plug>(fzf-p)/  <Cmd>FzfPreviewLinesRpc --resume --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>
  nnoremap          <Plug>(fzf-p)gr :<C-u>FzfPreviewProjectGrepRpc --experimental-fast<Space>
  xnoremap          <Plug>(fzf-p)gr y:<C-u>FzfPreviewProjectGrepRpc --experimental-fast<Space> <C-r>"
  nnoremap <silent> <Plug>(fzf-p)cm :<C-u>FzfPreviewCommandPaletteRpc --experimental-fast<CR>
  nnoremap <silent> <Plug>(fzf-p)q  :<C-u>FzfPreviewQuickFixRpc --experimental-fast<CR>
  nnoremap <silent> <Plug>(fzf-p)l  :<C-u>FzfPreviewLocationListRpc --experimental-fast<CR>
  nnoremap <silent> <Plug>(fzf-p)todo :<C-u>FzfPreviewTodoCommentsRpc --experimental-fast<CR>
  nnoremap <silent> <Plug>(fzf-p)d  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
  nnoremap <silent> <Plug>(fzf-p)D  :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
  nnoremap <silent> <Plug>(fzf-p)df :<C-u>CocCommand fzf-preview.CocDefinition<CR>
  nnoremap <silent> <Plug>(fzf-p)rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
  nnoremap <silent> <Plug>(fzf-p)p  <Cmd>CocCommand fzf-preview.Yankround --add-fzf-arg=--no-sort<CR>

  let g:fzf_preview_use_dev_icons = 1
  let g:fzf_preview_command='batcat --color=always --plain --theme=Gruvbox-N {-1}'
endif
" }}}2

" Filer {{{2
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
  AutoCmd FileType fern set nonumber

  if s:plug.is_installed("glyph-palette.vim")
    AutoCmd FileType fern call glyph_palette#apply()
  endif
endif

" }}}2 

" undotree {{{3
" if s:plug.is_installed("undotree")
"   nnoremap <silent> <Leader>u <Cmd>UndotreeToggle<CR>
" endif
" }}}3


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

"}}} 2

" Move {{{2

" hop.nvim {{{3
if s:plug.is_installed("hop.nvim")
lua << EOF
require'hop'.setup()
EOF
  nnoremap <Leader>hc <Cmd>HopChar1<CR>
  nnoremap <Leader>hl <Cmd>HopLine<CR>
  nnoremap <Leader>hw <Cmd>HopWord<CR>
endif
" }}}3

" }}}2

" Edit {{{2

" lexima.vim {{{ 3
if s:plug.is_installed("cohama/lexima.vim")
endif
call lexima#add_rule({'char': '>', 'at': '(>\%#)', 'input': '<BS>() => {', 'input_after': '}', 'filetype': ['typescript', 'typescriptreact', 'javascript']})
call lexima#add_rule({'char': '>', 'at': '([a-zA-Z]+>\%#)', 'input': '<BS> => {', 'input_after': '}', 'filetype': ['typescript', 'typescriptreact', 'javascript']})
"}}} 3

" vim-jplus {{{3
if s:plug.is_installed("vim-jplus")
  nmap J <Plug>(jplus)
  vmap J <Plug>(jplus)
  nmap <Leader>J <Plug>(jplus-input)
  vmap <Leader>J <Plug>(jplus-input)
endif
" }}}3

" vim-textmanip {{{3
if s:plug.is_installed("vim-textmanip")
  xmap <C-j> <Plug>(textmanip-move-down)
  xmap <C-k> <Plug>(textmanip-move-up)
  xmap <C-h> <Plug>(textmanip-move-left)
  xmap <C-l> <Plug>(textmanip-move-right)
endif
" }}}3

" vim-trip {{{3
if s:plug.is_installed("vim-trip")
  nmap + <Plug>(trip-increment)
  nmap - <Plug>(trip-decrement)
endif
" }}}3

" }}}2

" Appearance {{{2

" nvim-colorizer.lua {{{3
if s:plug.is_installed("nvim-colorizer.lua")
  lua require('colorizer').setup()
endif
" }}}3

" indentLine {{{ 3
if s:plug.is_installed("indentLine")
  let g:indentLine_char_list = ['┊']
  let g:indentLine_bufTypeExclude = ['help', 'terminal', 'fern']
endif
"}}} 3

" smartnumber.vim {{{3
if s:plug.is_installed("smartnumber.vim")
  " let g:snumber_enable_startup = 1
  nnoremap <Leader>n <Cmd>SNumbersToggleRelative<CR>
endif
" }}}3

" todo-comments {{{3
if s:plug.is_installed("todo-comments.nvim")
lua << EOF
  require("todo-comments").setup {
  }
EOF
endif
" }}}3

" nvim-bqf {{{3
if s:plug.is_installed("nvim-bqf")
lua <<EOF
require'bqf'.setup {
  auto_resize_height = true,
  preview = {
    border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'},
  },
  func_map = {
    pscrollup = "<C-u>",
    pscrolldown = "<C-d>"
  }
}
EOF
endif
" }}}3

" vim-startify {{{3
if s:plug.is_installed("vim-startify")
  let g:startify_change_to_dir = 0
  let g:startify_lists = [
    \ { 'type': 'dir', 'header': ['   MRU '. getcwd()] },
    \ ]
  let g:startify_custom_header = [
        \'@gtnao',
        \'██╗   ██╗██╗███╗   ███╗',
        \'██║   ██║██║████╗ ████║',
        \'██║   ██║██║██╔████╔██║',
        \'╚██╗ ██╔╝██║██║╚██╔╝██║',
        \' ╚████╔╝ ██║██║ ╚═╝ ██║',
        \'  ╚═══╝  ╚═╝╚═╝     ╚═╝',
        \]
  if s:plug.is_installed("glyph-palette.vim")
    AutoCmd FileType startify call glyph_palette#apply()
  endif
endif
" }}}3

" airline {{{3
if s:plug.is_installed("vim-airline-themes")
  let g:airline_theme = "base16_gruvbox_dark_hard"
endif
" }}}3

" lightline.vim {{{3
if s:plug.is_installed("lightline.vim")
  let g:lightline = {
          \ 'colorscheme': 'gruvbox',
          \ 'mode_map': {'c': 'NORMAL'},
          \ 'active': {
          \   'left': [ [ 'error', 'mode', 'paste' ], [ 'readonly', 'fugitive', 'filename', 'modified' ] ],
          \ },
          \ 'component_function': {
          \   'modified': 'LightlineModified',
          \   'readonly': 'LightlineReadonly',
          \   'fugitive': 'LightlineFugitive',
          \   'filename': 'LightlineFilename',
          \   'fileformat': 'LightlineFileformat',
          \   'filetype': 'LightlineFiletype',
          \   'fileencoding': 'LightlineFileencoding',
          \   'mode': 'LightlineMode'
          \ },
          \ 'component_expand': {
          \   'syntastic': 'LightlineCocError',
          \ },
          \ 'component_type': {
            \ 'syntastic': 'error',
          \ },
          \ 'separator': { 'left': '', 'right': '' },
          \ 'subseparator': { 'left': '', 'right': '' }
          \ }
  function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction
  
  function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
  endfunction
  
  function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
  endfunction
  
  function! LightlineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    else
      return ''
    endif
  endfunction
  
  function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction
  
  function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  endfunction
  
  function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
  endfunction
  
  function! LightlineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  function! LightlineCocError() abort
    return b:coc_diagnostic_info['error'] != 0 ? ' ' . b:coc_diagnostic_info['error'] : ''
  endfunction

  set noshowmode
endif
" }}}3

"}}} 2

" Utils {{{2

" scratch.vim {{{3
if s:plug.is_installed("scratch.vim")
  let g:scratch_filetype = 'markdown'
  let g:scratch_height = 10
  let g:scratch_no_mappings = 1
  AlterCommand memo Scratch
endif

" vim-quickrun {{{3
if s:plug.is_installed("vim-quickrun")
  let s:quickrun_hook = {}
  let g:quickrun_notify_success_message = ''
  let g:quickrun_notify_error_message = ''
    
  function! s:quickrun_hook.on_success(session, context) abort
    let g:quickrun_notify_success_message = 'Success ' . a:session.config.command
    if s:plug.is_installed("nvim-notify")
      lua require('notify')(vim.g.quickrun_notify_success_message, 'info', { title = ' QuickRun' })
    endif
  endfunction

  function! s:quickrun_hook.on_failure(session, context) abort
    let g:quickrun_notify_error_message = 'Error ' . a:session.config.command
    if s:plug.is_installed("nvim-notify")
      lua require('notify')(vim.g.quickrun_notify_error_message, 'error', { title = ' QuickRun' })
    endif
  endfunction

  function! s:quickrun_hook.sweep() abort
    let g:quickrun_notify_success_message = ''
    let g:quickrun_notify_error_message = ''
  endfunction

  let g:quickrun_config = {
      \   '_' : {
      \     'outputter/error/success': 'buffer',
      \     'outputter/error/error': 'quickfix',
      \     'outputter/buffer/opener': ':botright 15split',
      \     'outputter/buffer/into': 1,
      \     'hooks': [s:quickrun_hook],
      \   },
      \ }

  AlterCommand qr QuickRun

  if s:plug.is_installed("vim-quickrun-neovim-job")
    let g:quickrun_config._.runner = 'neovim_job'
  endif
  if s:plug.is_installed("nvim-notify")
    lua require("notify").setup({ background_colour = "#282828" })
  endif
endif
" }}}3

" aho-backup.vim {{{3
if s:plug.is_installed("aho-bakaup.vim")
  let g:bakaup_auto_backup = 1
  let g:bakaup_backup_dir  = expand('~/.cache/vim/backup')
endif
" }}}2

" vim-which-key {{{3
if s:plug.is_installed("vim-which-key")
  nnoremap <silent> <Leader><CR> <Cmd>WhichKey '<Leader>'<CR>
endif
" }}}3

" }}}2
" }}}1

" FileType Settings {{{1

" Indent {{{2

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

" HTML escape characters {{{2

function! s:map_html_keys() abort
  inoremap <silent> <buffer> \\ \
  inoremap <silent> <buffer> \& &amp;
  inoremap <silent> <buffer> \< &lt;
  inoremap <silent> <buffer> \> &gt;
  inoremap <silent> <buffer> \<Space> &nbsp;
  inoremap <silent> <buffer> \' &#39;
  inoremap <silent> <buffer> \" &quot;
endfunction
AutoCmd FileType html,slim,javascriptreact,typescriptreact call <SID>map_html_keys()

" }}}2

" quit {{{2

AutoCmd FileType qf nnoremap <silent> <nowait> <buffer> q <Cmd>quit<CR>
AutoCmd FileType help nnoremap <silent> <nowait> <buffer> q <Cmd>quit<CR>

" }}}2

" }}}1

" Colorscheme {{{1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1

colorscheme gruvbox-material
" }}}1

