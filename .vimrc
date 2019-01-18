filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-css-color'
Plugin 'Shougo/denite.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'
Bundle 'lifepillar/vim-solarized8'
Plugin 'mhinz/vim-signify'
Plugin 'justinmk/vim-sneak'
Plugin 'Shougo/deoplete.nvim'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

let g:deoplete#enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Numbering
set nu

" Show trailing whitespace chars
match ErrorMsg '\s\+$'

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show last command (after tpope's vim-sensible)
set showcmd

" Set to auto read when a file is changed from the outside
au FileChangedShell * echo "file changed on disk"

" Remove tabline
set showtabline=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu
set wildignore=*.o,*~,*.pyc
set ignorecase
set smartcase

" Perl compatible regex syntax while searching
nnoremap / /\v
vnoremap / /\v
set magic

" Always search globally
set gdefault

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set wrap
set textwidth=0
set formatoptions=cq
set wrapmargin=0

" Save on losing focus
au FocusLost * :wa

" Line break setting
setlocal fo+=t

" Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

set mouse=a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Termtrans=1 to avoid overlap with colors from gnome terminal
" set t_Co=256
let g:solarized_termtrans=1
set background=light
colorscheme solarized8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set noswapfile
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " store swap files here


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related (PEP8)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Many settings are from: http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

" Use PEP8 conform Python style (only spaces)
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Also PEP8, but only for Python files; as well as folding
" au BufRead,BufNewFile *.py,*.pyw set textwidth=79 | set foldmethod=indent | set foldlevel=99

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.html,*.php,*.js match BadWhitespace /\s\+$/

" Intendation for web development
autocmd Filetype html setlocal ts=2 sw=2 foldmethod=indent
autocmd Filetype scss,css,sass setlocal ts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sw=2


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Open splits below or to the right
set splitbelow
set splitright

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
let NERDTreeChDirMode=2
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Sneak
" nmap s <Plug>Sneak_s
let g:sneak#s_next = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline setup

let g:airline_powerline_fonts=1
let g:airline_theme='solarized'  "or use 'raven'
let g:airline_exclude_preview = 0 "no additional airline in preview windows

" let g:airline#extensions#branch#enabled = 0
" call airline#parts#define_accent('branch', 'red')
" let g:airline#extensions#branch#format = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#excludes = ['term:']
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_inactive_collapse=0
let g:airline#extensions#tabline#buffer_min_count = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easytags setup
let g:easytags_auto_highlight = 0
let g:easytags_by_filetype = '~/.vimtags'
let g:easytags_async = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Denite setup

" nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>d :Denite buffer<cr>
nnoremap <space>f :Denite file/rec<cr>
nnoremap <space>a :Denite grep<cr>
nnoremap <leader>f :<C-u>DeniteCursorWord grep:.<CR>
vnoremap <leader>f y:Denite -input=<C-r>" grep<CR>
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar setup
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale setup
let g:ale_fixers = {
\   'javascript': ['standard'],
\   'python': ['flake8', 'pylint'],
\}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
noremap <C-a> :ALENext<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mappings for easy buffer switching
noremap gn :bn<cr>
noremap gp :bp<cr>
noremap gd :bd<cr>
noremap gr :b#<cr>

" Turn off highlighting of search hits
map <F3> :nohl <CR>

" Fix syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Avoid colon to spare your pinky ;-)
nnoremap <Space><Space> :

" Avoid ESC
inoremap jj <ESC>

" Change leader key from odd '\' to ','
let mapleader = ","

" Then make good use of the new leader for an easy saving
" and closing of buffers ;-)
map <leader>w :w<cr>
map <leader>q :q<cr>

" Reselect text pasted just before
map <leader>v V`]

" Copy visual selection into clipboard
noremap <Leader>y "*y

" Kill white space
nnoremap <Leader>dw :%s/\s\+$//e<CR>

" Folding
nnoremap <space> za

" Last edit location
nnoremap ;; g;

" paste toggle
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" Remap VIM 0 to first non-blank character
map 0 ^

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
