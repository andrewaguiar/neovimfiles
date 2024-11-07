"                    .                    
"    ##############..... ##############   
"    ##############......##############   
"      ##########..........##########     
"      ##########........##########       
"      ##########.......##########        
"      ##########.....##########..        
"      ##########....##########.....      
"    ..##########..##########.........    
"  ....##########.#########.............  
"    ..################JJJ............    
"      ################.............      
"      ##############.JJJ.JJJJJJJJJJ      
"      ############...JJ...JJ..JJ  JJ     
"      ##########....JJ...JJ..JJ  JJ      
"      ########......JJJ..JJJ JJJ JJJ     
"      ######    .........                
"
"
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'andrewaguiar/wip.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'
Plug 'rust-lang/rust.vim'
call plug#end()

colorscheme gruvbox

syntax on
filetype plugin indent on
set hidden
set tabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set guicursor=
set nowrap               " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent           " always set autoindenting on
set copyindent           " copy the previous indentation on autoindenting
set number               " always show line numbers
set ruler
set shiftwidth=2         " number of spaces to use for autoindenting
set shiftround           " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch            " set show matching parenthesis
set ignorecase           " ignore case when searching
set smartcase            " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab             " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type
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

" close vim if last tab i NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
  \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:loaded_python3_provider = 0

let g:loaded_perl_provider=0

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

" change the mapleader from \ to ,
let mapleader=","

" Allows use ; instead of :
nnoremap ; :

imap <C-g> <M-\>

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

" Leader and Ctrl commands
nnoremap <C-p> :GFilesOrFiles<CR>
nnoremap <Leader><space> :noh<CR>
nnoremap <Leader>d d^==^
nnoremap <Leader>j $ik$
nnoremap <Leader>x $x
nnoremap <Leader>i ik$
nnoremap <Leader>p pkdd==
nnoremap <Leader>a :Ag 
nnoremap <Leader>w :execute ":Ag " . expand("<cword>")<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/
nnoremap <Leader><Leader> :NERDTreeToggleSmartly<CR>
nnoremap <Leader>8 :WIP<CR>
nnoremap <Leader>q :bd!<CR>
nnoremap <Leader>t :terminal<CR>

nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>

" NERDTree

" NERDTreeToggleSmartly: toggle nerdtree on current file
command! -nargs=* NERDTreeToggleSmartly call s:NERDTreeToggleSmartly()

function! s:NERDTreeToggleSmartly() abort
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    execute ":NERDTreeClose"
  else
    if expand('%:p') == ''
      execute ":NERDTree"
    else
      execute ":NERDTreeFind"
    endif
  endif
endfunction

" COC

" Use <tab> and <S-tab> to navigate completion list: >
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion: >
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <CR> to confirm completion, use:
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use:
inoremap <silent><expr> <CR> coc#pum#visible() ?
  \ coc#_select_confirm() :
  \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_node_path = '/home/andrew/.asdf/installs/nodejs/17.1.0/bin/node'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <Leader>ff <Plug>(coc-fix-current)
nmap <Leader>fa <Plug>(coc-codeaction)

tnoremap <C-c> <C-\><C-n>

" Custom Functions

" RemoveAllEmptyLines: removes all empty lines
command! -nargs=* RemoveAllEmptyLines call s:RemoveAllEmptyLines()

function! s:RemoveAllEmptyLines() abort
  execute ":g/^$/d"
endfunction

" GFilesOrFiles: opens Files or GFiles depending if we are on git folder or not
command! -nargs=* GFilesOrFiles call s:GFilesOrFiles()

function! s:GFilesOrFiles() abort
  silent! !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    execute ":GFiles"
  else
    execute ":Files"
  endif
endfunction

" JSONBeautify: beautifies current file
command! -nargs=* JSONBeautify call s:JSONBeautify()

function! s:JSONBeautify() abort
  execute "%!jq ."
endfunction

" LineBreakAt: Insert a newline after each specified string (or before if use '!') if no arguments, use previous search.
"
" https://vim.fandom.com/wiki/Add_a_newline_after_given_patterns
"
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)

function! LineBreakAt(bang, ...) range
  let save_search = @/
  if empty(a:bang)
    let before = ''
    let after = '\ze.'
    let repl = '&\r'
  else
    let before = '.\zs'
    let after = ''
    let repl = '\r&'
  endif

  let pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")

  if empty(pat_list)
    let find = @/
  else
    let find = join(pat_list, '\|')
  endif

  let find = before . '\%(' . find . '\)' . after
  " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction

" Del: deletes current file/buffer
command! -nargs=? Del call s:Del()

function! s:Del() abort
  let currentFile = resolve(expand('%:p'))

  if !filereadable(currentFile)
    echo "current file unreadable " . currentFile
    return
  endif

  execute "!rm " . currentFile

  bd!
endfunction

" creates dir when trying to save a buffer inside a absent dir
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
    \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END
