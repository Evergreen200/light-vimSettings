set noswapfile
set nobackup

call plug#begin('~/.vim/plugged')
" Appearance:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-syntastic/syntastic'

" Functionality:
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/limelight.vim'
call plug#end()

set encoding=utf-8
syntax on 
set number
set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab autoindent smartcase
set nowrap incsearch
set scrolloff=8
set hidden
set showcmd showmode

set termguicolors
set t_Co=256
set background=light
colorscheme PaperColor
highlight Pmenu guibg=black guibg=grey gui=bold
highlight Comment gui=bold
highlight Normal gui=none
set laststatus=2


" Configurations:

" Airline:
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_z = '%{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

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
   let g:undotree_WindowLayout = 1
endif
" Tagbar:
let g:tagbar_width = 30

" Mapping:
map <C-n> :UndotreeToggle<CR>
map <C-m> :UndotreeFocus<CR>
map <C-o> :Ex<CR>
map <C-b> :Limelight<CR>
map <C-v> :Limelight!<CR>

let mapleader=","
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
