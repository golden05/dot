set langmenu=zh_CN.UTF-8
set noswf
"编码设置
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
"设置显示行号
set nu
"设置缩进
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
syntax on
filetype off

"设置自动换行
set wrap

"搜索时忽略大小学
set ignorecase

set smartcase

"设置不生成备份文件
set nobackup

set history=1000
"设置状态栏在倒数第二行
set laststatus=2
"Set mapleader
let mapleader = ","
"<silent>是指执行键绑定时不在命令行上回显，

set nocompatible
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'   "git
Plug 'scrooloose/syntastic'  "syntax checking 
Plug 'kien/ctrlp.vim'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'janko/vim-test'
Plug 'kchmck/vim-coffee-script'
if has('nvim')
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
 Plug 'Shougo/deoplete.nvim'
 Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'dense-analysis/ale'
Plug 'vim-ruby/vim-ruby'

Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'
Plug 'raimondi/delimitmate'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'tmhedberg/SimpylFold'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Yggdroot/indentLine'
call plug#end()

let g:ale_linters = {
    \ 'ruby':['standardrb','rubocop'],
    \ 'javascript':['eslint'],
    \}
let g:ale_fixers = {
    \ 'ruby':['standardrb'],
    \ 'javascript':['eslint'],
    \}
let g:ale_fix_on_save = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1


filetype plugin on
filetype indent on
set hlsearch incsearch "搜索高亮

let python_highlight_all=1
syntax on
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F5>")

map <leader>n :NERDTreeToggle<CR>

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="vertical"



" lazy load for ultisnips
" https://medium.com/@saaguero/improving-performance-in-vim-9b33598c8eaf
inoremap <silent> <C-j> <C-r>=LoadUltiSnips()<CR>
nnoremap <silent> <C-M-u> :call LoadUltiSnips()<CR>
" This function only runs when UltiSnips is not loaded
function! LoadUltiSnips()
    let l:curpos = getcurpos()
    execute plug#load('vim-snippets')
    execute plug#load('ultisnips')
    call cursor(l:curpos[1], l:curpos[2])
    call UltiSnips#ExpandSnippet()
    return ""
endfunction





let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_select_first = "1"
"let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippets'


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

nnoremap <space> za
set foldmethod=syntax
set foldlevel=99

let g:indentLine_setColors = 0

nmap <silent> t<C-f> :TestFile<CR>

let test#strategy = "neovim"

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
