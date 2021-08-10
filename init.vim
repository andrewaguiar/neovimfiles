call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'pbogut/fzf-mru.vim'
Plug 'andrewaguiar/wip.vim'
Plug 'andrewaguiar/simple-bash.vim'
call plug#end()

colorscheme gruvbox

syntax on
filetype plugin indent on
set hidden
set tabstop=2     " a tab is two spaces
set shiftwidth=2
set expandtab
set noshowmode
set guicursor=
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set ruler
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,**/tmp/**,node_modules,_build
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set cursorline
set nobackup
set noswapfile
set iskeyword+=-
set t_Co=256
set background=dark
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set clipboard=unnamedplus
set mouse=a
set laststatus=2
set encoding=UTF-8
set signcolumn=yes

au BufRead,BufNewFile *.scss set filetype=scss

let g:fzf_mru_relative=1

let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore *.log -g ""'

let g:lightline = {
      \   'colorscheme': 'gruvbox',
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['readonly', 'relativepath', 'modified']
      \     ]
      \   }
      \ }

let g:ranger_command_override = 'ranger --confdir='.$HOME.'/.config/nvim/ranger.conf/'

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }

let g:fzf_colors = {
  \   'fg':      ['fg', 'Normal'],
  \   'bg':      ['bg', 'Normal'],
  \   'hl':      ['fg', 'Comment'],
  \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \   'hl+':     ['fg', 'Statement'],
  \   'info':    ['fg', 'PreProc'],
  \   'prompt':  ['fg', 'Conditional'],
  \   'pointer': ['fg', 'Exception'],
  \   'marker':  ['fg', 'Keyword'],
  \   'spinner': ['fg', 'Label'],
  \   'header':  ['fg', 'Comment']
  \ }

" let g:NERDCreateDefaultMappings = 0

" change the mapleader from \ to ,
let mapleader=","

" Allows use ; instead of :
nnoremap ; :

" Forces to use h j k l keys
map <Right> <nop>
map <Left> <nop>
map <Up> <nop>
map <Down> <nop>

" Use Tab to buffers.
map  <Tab> :bnext<CR>
map  <S-Tab> :bprev<CR>

nnoremap j gj
nnoremap k gk

" Easy window navigation
nnoremap <S-Left> <C-w>h
nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Right> <C-w>l

nnoremap <Leader><space> :noh<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Files<CR>
nnoremap <Leader>a :Ag 
nnoremap <Leader>w :execute ":Ag " . expand("<cword>")<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/
nnoremap <Leader>b :Ranger<CR>
nnoremap <Leader>8 :WIP<CR>
nnoremap <Leader>q :bd!<CR>
nnoremap <Leader>u :FZFMru<CR>

" CTags
nnoremap <Leader>tt :!ctags -R<CR>
noremap <Leader>t <C-]>
