--                    .                    
--    ##############..... ##############   
--    ##############......##############   
--      ##########..........##########     
--      ##########........##########       
--      ##########.......##########        
--      ##########.....##########..        
--      ##########....##########.....      
--      ##########..##########.........    
--      ##########.#########.............  
--      ################JJJ............    
--      ################.............      
--      ##############.JJJ.JJJJJJJJJJ      
--      ############...JJ...JJ..JJ  JJ     
--      ##########....JJ...JJ..JJ  JJ      
--      ########......JJJ..JJJ JJJ JJJ     
--      ######    .........                
--

local Plug = vim.fn['plug#']

vim.fn['plug#begin']()

Plug('morhetz/gruvbox')
Plug('sheerun/vim-polyglot')
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim')
Plug('preservim/nerdtree')
Plug('preservim/nerdcommenter')
Plug('itchyny/lightline.vim')
Plug('ap/vim-buftabline')
Plug('tpope/vim-endwise')
Plug('preservim/nerdtree')
Plug('airblade/vim-gitgutter')
Plug('tpope/vim-fugitive')
Plug('andrewaguiar/wip.vim')
Plug('ryanoasis/vim-devicons')
Plug('elixir-editors/vim-elixir')
Plug('rust-lang/rust.vim')

vim.fn['plug#end']()

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme gruvbox')

local opt = vim.opt

opt.hidden = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.showmode = false
opt.guicursor = ""
opt.wrap = false
opt.backspace = { "indent", "eol", "start" }
opt.autoindent = true
opt.copyindent = true
opt.number = true
opt.ruler = true
opt.shiftround = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.smarttab = true
opt.hlsearch = true
opt.incsearch = true
opt.history = 1000
opt.undolevels = 1000
opt.wildignore = { "*.swp", "*.bak", "*.pyc", "*.class", "**/tmp/**", "node_modules", "_build" }
opt.title = true
opt.visualbell = true
opt.errorbells = false
opt.cursorline = true
opt.backup = false
opt.swapfile = false
opt.iskeyword:append("-")
opt.termguicolors = true
opt.background = "dark"
opt.list = true
opt.listchars = { tab = ">.", trail = ".", extends = "#", nbsp = "." }
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.laststatus = 2
opt.encoding = "UTF-8"
opt.signcolumn = "yes"

vim.g.mapleader = ","
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.fzf_mru_relative = 1
vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules --ignore *.log -g ""'

vim.g.lightline = {
  colorscheme = 'gruvbox',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'readonly', 'relativepath', 'modified' }
    }
  }
}

vim.g.fzf_layout = { window = { width = 1, height = 1 } }
vim.g.fzf_colors = {
  fg      = { 'fg', 'Normal' },
  bg      = { 'bg', 'Normal' },
  hl      = { 'fg', 'Comment' },
  ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
  ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
  ['hl+'] = { 'fg', 'Statement' },
  info    = { 'fg', 'PreProc' },
  prompt  = { 'fg', 'Conditional' },
  pointer = { 'fg', 'Exception' },
  marker  = { 'fg', 'Keyword' },
  spinner = { 'fg', 'Label' },
  header  = { 'fg', 'Comment' }
}

-- # KEYMAPPINGS

vim.keymap.set('n', ';', ':')

-- Disable arrow keys
vim.keymap.set('', 'Right', '<nop>')
vim.keymap.set('', 'Left', '<nop>')
vim.keymap.set('', 'Up', '<nop>')
vim.keymap.set('', 'Down', '<nop>')

-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')

-- Visual line movement
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Window navigation
vim.keymap.set('n', '<S-Left>', '<C-w>h')
vim.keymap.set('n', '<S-Down>', '<C-w>j')
vim.keymap.set('n', '<S-Up>', '<C-w>k')
vim.keymap.set('n', '<S-Right>', '<C-w>l')

-- File search
vim.keymap.set('n', '<C-p>', ':GFilesOrFiles<CR>')

-- Leader Mappings
vim.keymap.set('n', '<Leader><space>', ':noh<CR>')
vim.keymap.set('n', '<Leader>a', ':Ag ')
vim.keymap.set('n', '<Leader>w', ':execute ":Ag " . expand("<cword>")<CR>')
vim.keymap.set('n', '<Leader>r', ':%s/\\<<C-r><C-w>\\>/')
vim.keymap.set('n', '<Leader>t', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<Leader>8', ':WIP<CR>')
vim.keymap.set('n', '<Leader>b', ':bd!<CR>')
vim.keymap.set('n', '<Leader>q', ':q!<CR>')

-- Resize
vim.keymap.set('n', '<C-Right>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -5<CR>')

-- Auto complete
vim.keymap.set('i', '<Tab>', '<C-n>')

-- # AUTOCOMMANDS
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local mkdir_group = augroup("Mkdir", { clear = true })
autocmd("BufWritePre", {
  group = mkdir_group,
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end
})

-- # CUSTOM FUNCTIONS & COMMANDS

-- RemoveAllEmptyLines
vim.api.nvim_create_user_command('RemoveAllEmptyLines', 'g/^$/d', {})

-- RemoveTrailingWhiteSpaces
vim.api.nvim_create_user_command('RemoveTrailingWhiteSpaces', ':%s/\\s\\+$//e', {})

-- GFilesOrFiles
vim.api.nvim_create_user_command('GFilesOrFiles', function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    vim.cmd('GFiles')
  else
    vim.cmd('Files')
  end
end, {})

-- JSONBeautify
vim.api.nvim_create_user_command('JSONBeautify', '%!jq .', {})

-- Del
vim.api.nvim_create_user_command('Del', function()
  local currentFile = vim.fn.resolve(vim.fn.expand('%:p'))
  if vim.fn.filereadable(currentFile) == 0 then
    print("current file unreadable " .. currentFile)
    return
  end
  vim.fn.system("rm " .. currentFile)
  vim.cmd("bd!")
end, {})

-- LineBreakAt
vim.cmd([[
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
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)
]])
