call plug#begin()
Plug 'sjl/badwolf'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'cohama/lexima.vim'
call plug#end()

colorscheme badwolf

set hidden

set tabstop=2     " a tab is two spaces
set shiftwidth=2
set expandtab

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

set t_Co=256 " 256 colors
set background=dark

" change the mapleader from \ to ,
let mapleader=","

filetype plugin indent on

" turn syntax on
syntax on

" Change editing behaviour
"
" When you write a lot of code, you probably want to obey certain style rules
" In some programming languages (like Python), whitespace is important, so you
" may not just swap tabs for spaces and even the number of spaces is important
"
" Vim can highlight whitespaces for you in a convenient way:
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Pasting large amounts of text into Vim
"
" Every Vim user likes to enable auto-indenting of source code, so Vim can intelligently 
" position you cursor on the next line as you type. This has one big ugly consequence however: 
" when you paste text into your terminal-based Vim with a right mouse click, Vim cannot know it 
" is coming from a paste. To Vim, it looks like text entered by someone who can type incredibly 
" fast :) Since Vim thinks this is regular key strokes, it applies all auto-indenting and 
" auto-expansion of defined abbreviations to the input, resulting in often cascading indents 
" of paragraphs.
"
" There is an easy option to prevent this, however. You can temporarily switch to “paste mode”, 
" simply by setting the following option:
set pastetoggle=<F3>

" Enables mouse
set mouse=a
set laststatus=2

au BufRead,BufNewFile *.scss set filetype=scss

:hi TabLineFill ctermfg=Black ctermbg=Black
:hi TabLine ctermfg=White ctermbg=Black
:hi TabLineSel ctermfg=White ctermbg=DarkGreen

" MAPPINGS

" Allows use ; instead of :
nnoremap ; :
" Forces to use h j k l keys
map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>

" Use cursor keys to navigate buffers.
map  <Right> :bnext<CR>
map  <Left>  :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left>  <ESC>:bprev<CR>
map  <Del>   :bd<CR>

nnoremap j gj
nnoremap k gk

" Plugins binding
nnoremap <C-p> :FZF<CR>
nmap <F2> :NERDTreeToggle<cr>

" Easy window navigation
nnoremap <S-Left> <C-w>h
nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Right> <C-w>l

nmap <F4> :.w !xclip -i -sel c<CR><CR>
vmap <F4> :w !xclip -i -sel c<CR><CR>

function! PutBreakPoint()
  if match(expand("%"), ".html.erb$") != -1
    execute "norm o<% (require 'pry'; binding.pry) %>"
  elseif match(expand("%"), ".rb$") != -1 || match(expand("%"), ".rake$") != -1
    execute "norm o(require 'pry'; binding.pry)"
  elseif match(expand("%"), ".js$") != -1
    execute "norm odebugger"
  endif
endfunction

function! PutBreakPoint1()
  if match(expand("%"), ".html.erb$") != -1
    execute "norm o<% byebug %>"
  elseif match(expand("%"), ".rb$") != -1 || match(expand("%"), ".rake$") != -1
    execute "norm obyebug"
  elseif match(expand("%"), ".js$") != -1
    execute "norm odebugger"
  endif
endfunction

nnoremap <Leader><space> :noh<CR>
nmap <script> <silent> <unique> <Leader><Leader> :Buffers<CR>
nnoremap <Leader>bd :bufdo bd<CR>
nnoremap <Leader>q :bufdo q<CR>
nnoremap <Leader>w :bufdo w<CR>
map <Leader>p :call PutBreakPoint()<CR>
map <Leader>p1 :call PutBreakPoint1()<CR>
noremap <Leader>c <C-]>
nnoremap <Leader>cg :!ctags -R<CR>

map <Leader>mk :!mkdir -p %:h<CR>
map <Leader>rm :!rm -rf %<CR>
