syntax on
filetype off		" required
set nocompatible	" be iMproved, required
set undodir=~/.cache/nvim
set undofile
set number relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set incsearch
set clipboard+=unnamedplus

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
"Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'chrisbra/Colorizer'
"Plug 'tyru/eskk.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'mbbill/undotree'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'morhetz/gruvbox'
call plug#end()

colorscheme desert 

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader=" "
let g:netrw_browse_split=2
let g:newrw_banner=0
let g:newrw_winsize=25
let g:ctrlp_use_caching=0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
"nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>ev :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>
nnoremap <leader>r :noh<CR>

