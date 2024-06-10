vim.cmd([[
syntax on
colorscheme desert
filetype plugin indent on
setlocal spell spelllang=en_us
set nocompatible
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
set grepprg=grep\ -nH\ $* 
set <F5>=<C-v><F5>

" autocmd TextChanged,TextChangedI <buffer> silent update 

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'chrisbra/Colorizer'
Plug 'kaarmu/typst.vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = ";"
let g:coq_settings = { 'auto_start': 'shut-up' }
let g:netrw_browse_split = 2
let g:newrw_banner = 0
let g:newrw_winsize = 25
let g:ctrlp_use_caching = 0
let g:typst_cmd = "typst"
let g:typst_pdf_viewer = "zathura"

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>q :bd <CR>
nnoremap <leader>` :qa! <CR>
nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>1 :bn <CR>
nnoremap <leader>2 :bp <CR>
nnoremap <leader>w :wincmd k <CR>
nnoremap <leader>a :wincmd h <CR>
nnoremap <leader>s :wincmd j <CR>
nnoremap <leader>d :wincmd l <CR>
nnoremap <leader>v :vsplit <CR>
nnoremap <leader>h :split <CR>
nnoremap <silent><leader>. :vertical resize +5<CR>
nnoremap <silent><leader>, :vertical resize -5<CR>
nnoremap <leader>r :noh<CR>
nnoremap <F5> :source ~/.config/nvim/init.lua<CR>
]])

-- setup language servers.
local lsp = require('lspconfig')
local coq = require('coq')
lsp.clangd.setup{coq.lsp_ensure_capabilities{}}
lsp.pyright.setup{coq.lsp_ensure_capabilities{}}
lsp.phpactor.setup{coq.lsp_ensure_capabilities{}}
lsp.bashls.setup{coq.lsp_ensure_capabilities{}}
lsp.lua_ls.setup{coq.lsp_ensure_capabilities{}}
lsp.typst_lsp.setup{coq.lsp_ensure_capabilities{}}

-- global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
