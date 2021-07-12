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
nnoremap <C-l> :noh<CR>
let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :close<CR>
nnoremap <Leader><tab> <C-w><C-w>

call plug#begin('~/.vim/plugged')
" theme 
Plug 'folke/tokyonight.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" base
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'justinmk/vim-sneak'
Plug 'steelsojka/pears.nvim'
Plug 'b3nj5m1n/kommentary'
" utils
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" lsp
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
lua require("plugins")
let g:tokyonight_style = "night"
colorscheme tokyonight
" vim-sneak
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
" vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
" telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
" coc
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

nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>j <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>t <Plug>(coc-type-definition)
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
hi CocErrorSign  ctermfg=Red guifg=#EF4444
hi CocWarningSign  ctermfg=Brown guifg=#F59E0B
hi CocInfoSign  ctermfg=Yellow guifg=#FACC15
hi CocHintSign  ctermfg=Blue guifg=#2563EB
