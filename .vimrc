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
colorscheme PaperColor

" ColorFunctions:
function! GenHighlight()
    highlight Comment gui=bold
    highlight Normal gui=none
endfunction

function! Theme()
    set background=light
    highlight Pmenu guibg=black guibg=grey gui=bold
    call GenHighlight()
endfunction

function! DarkTheme()
    set background=dark
    highlight Pmenu guibg=white guibg=black gui=bold
   " highlight Comment gui=bold
   " highlight Normal gui=none
    call GenHighlight()
endfunction

function DayNight()
let hr = (strftime('%H'))
if hr >= 19 || hr >= 0 && hr < 8
    1:call DarkTheme()
else
    1:call Theme()
endif
endfunction      


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
   let g:undotree_WindowLayout = 3
endif
" Tagbar:
let g:tagbar_width = 30

" Mapping:
map <C-n> :UndotreeToggle<CR>
map <C-m> :UndotreeFocus<CR>
map <C-o> :Ex<CR>

let mapleader=","
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>d :call Theme()<CR>
nnoremap <leader>n :call DarkTheme()<CR>
nnoremap <leader>a :call DayNight()<CR>

nnoremap <leader>b :Limelight<CR>
nnoremap <leader>v :Limelight!<CR> 
