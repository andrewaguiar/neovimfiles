call plug#begin()
Plug 'sjl/badwolf'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'andrewaguiar/putbreakpoints.vim'
Plug 'andrewaguiar/wip.vim'
Plug 'andrewaguiar/simple-bash.vim'
call plug#end()

colorscheme badwolf

set hidden

set tabstop=2     " a tab is two spaces
set shiftwidth=2
set expandtab
set noshowmode

set guicursor=

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set ruler
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,**/tmp/**,node_modules
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set cursorline
set nobackup
set noswapfile

set iskeyword+=-

" 256 colors
set t_Co=256
set background=dark

" change the mapleader from \ to ,
let mapleader=","

filetype plugin indent on

" turn syntax on
syntax on

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F3>

" Enables mouse
set mouse=a
set laststatus=2

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

au BufRead,BufNewFile *.scss set filetype=scss

:hi TabLineFill ctermfg=Black ctermbg=Black
:hi TabLine ctermfg=White ctermbg=Black
:hi TabLineSel ctermfg=White ctermbg=DarkGreen

let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

let g:lightline = {
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['gitbranch', 'readonly', 'relativepath', 'modified']
\     ]
\   },
\   'component_function': {
\     'gitbranch': 'gitbranch#name'
\   },
\ }

" Allows use ; instead of :
nnoremap ; :

" Forces to use h j k l keys
map <Right> <nop>
map <Left> <nop>
map <Up> <nop>
map <Down> <nop>

" Use cursor keys to navigate buffers.
map  <Right> :bnext<CR>
map  <Left>  :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left>  <ESC>:bprev<CR>

nnoremap j gj
nnoremap k gk

command! -nargs=? SearchCurrentWord call s:SearchCurrentWord()

function! s:SearchCurrentWord() abort
  let l:word = expand("<cword>")
  execute ":Ag " . l:word
endfunction

" Searches with Ag current selected word
nmap <F9> :SearchCurrentWord()<cr>

" Plugins binding
nnoremap <C-p> :FZF<CR>
nmap <F2> :Ranger<cr>
nmap <F8> :WIP<cr>

" Easy window navigation
nnoremap <S-Left> <C-w>h
nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Right> <C-w>l

nmap <F4> :.w !xclip -i -sel c<CR><CR>
vmap <F4> :w !xclip -i -sel c<CR><CR>

" Cancels current searching
nnoremap <Leader><space> :noh<CR>
" Replaces current selected word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Closes all buffers
nnoremap <Leader>bd :bufdo bd<CR>
" CTags
nnoremap <Leader><F10> :!ctags -R<CR>
noremap <F10> <C-]>

" Splits line and pushes to line above
nnoremap <Leader>o i<CR><ESC>^
