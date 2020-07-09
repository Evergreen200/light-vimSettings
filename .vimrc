set noswapfile
set nobackup

call plug#begin('~/.vim/plugged')
" Appearance:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-syntastic/syntastic'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'

" Functionality:
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" Settings:
set encoding=utf-8
syntax on 
set number
set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab autoindent smartcase
set nowrap incsearch hlsearch
set scrolloff=8
set hidden
set showcmd showmode

" Color:
set termguicolors
set t_Co=256
set laststatus=2

" Gruvbox:
colorscheme gruvbox 
set background=dark


" Configurations:

" AutoPairs:
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
" Isn't finished yet


" YouCompleteMe:
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")


" Airline:
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_z = '%{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline_theme='base16_gruvbox_dark_hard'
" Syntastic:
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UndoTree:
if has ("persisten_undo")
    set undodir=$HOME."~/.vim/undodir"
    set undofile
endif

if !exists('g:undotree_WindowLayout')
   let g:undotree_WindowLayout = 3
endif
" Tagbar:
let g:tagbar_width = 30

" Fuzzy:
let g:fzf_layout = {'down': '~25%'}

" Mapping:
map <C-n> :UndotreeToggle<CR>
map <C-m> :UndotreeFocus<CR>

let mapleader=","
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>b :Limelight<CR>
nnoremap <leader>v :Limelight!<CR> 

nnoremap <leader>r :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :source %<CR>

" Just for small tests while coding
nnoremap <leader>t :exe '!gcc %:p' <bar> exe '!'.getcwd().'/a.out'<cr>
