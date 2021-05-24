" base config
set guifont=FiraCodeNerdFont:h15
set termguicolors
set noshowmode
set splitbelow
set splitright
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set clipboard+=unnamedplus
set hidden
set updatetime=100
set signcolumn=number
set noswapfile
set nobackup
set nowritebackup
set textwidth=80
" base mappings
inoremap jj <ESC>
nnoremap m d|xnoremap m d
nnoremap M D|xnoremap M D
nnoremap mm dd|xnoremap mm dd
nnoremap Y y$|xnoremap Y y$
let mapleader = "\<Space>"
nnoremap <Leader><tab> <C-w><C-w>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :close<CR>
" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'folke/tokyonight.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'glepnir/dashboard-nvim'
Plug 'rmagatti/auto-session'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'justinmk/vim-sneak'
Plug 'steelsojka/pears.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'b3nj5m1n/kommentary'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
let g:tokyonight_style = "night"
colorscheme tokyonight
let g:lightline = {'colorscheme' : 'tokyonight'}
" lualine
lua << EOF
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
EOF
" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", 
    highlight = {
        enable = true
    },
    autotag = {
        enable = true
    }
}
EOF
autocmd BufNewFile,BufRead go.mod set ft=gomod
" telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
lua << EOF
require('telescope').setup { 
  defaults = { 
    file_ignore_patterns = {"node_modules"} 
  } 
}
EOF
" vim-sneak
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
" vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
" nvim-toggleterm
lua << EOF
require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-`>]],
}
EOF
" pears.vim
lua require "pears".setup()
" nvim-colorizer
lua require'colorizer'.setup()
" kommentary
lua << EOF
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>//", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>/", "<Plug>kommentary_visual_default", {})
EOF
" dashboard-vim
" let g:dashboard_default_executive ='telescope'
" autosession
" lua << EOF
" local opts = {
"   log_level = 'info',
"   auto_session_enable_last_session = false,
"   auto_session_root_dir = vim.fn.stdpath('config').."/sessions/",
"   auto_session_enabled = true,
"   auto_save_enabled = true,
"   auto_restore_enabled = true
" }
" require('auto-session').setup(opts)
" EOF
" coc-explorer
nnoremap <space>e :CocCommand explorer<CR>
" coc.nvim
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
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
nmap <leader>s <Plug>(coc-rename)
