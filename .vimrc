execute pathogen#infect()

set ignorecase
set hlsearch
set incsearch
set showmatch

set noerrorbells
set novisualbell

set tabstop=2
set shiftwidth=2

set autoindent
set copyindent
set expandtab

set nobackup
set noswapfile

set cursorline

set wildmenu

syntax enable

colorscheme molokai
"colorscheme badwolf

set t_Co=256
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

let g:airline_left_sep=''
let g:airline_right_sep=''

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:bufferline_echo = 0
  autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()

