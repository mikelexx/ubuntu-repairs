
set completeopt=menuone,noinsert,noselect
set incsearch
set relativenumber
set cindent
set autoindent
set number
syntax enable
set tabstop=8 shiftwidth=8 noexpandtab
filetype plugin indent on
call plug#begin('~/.vim/plugged')
" Add your plugins here
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'iamcco/markdown-preview.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
call plug#end()
autocmd bufwritepost *.js silent !semistandard % --fix

let g:syntastic_javascript_checkers=['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'
set autoread
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']
" Set the leader key to Tab
let mapleader="\<Tab>"

" Map Tab + ito Ctrl + n for next completion
inoremap <silent> <Leader>o <C-n>

" Select completion item
inoremap <expr><CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

