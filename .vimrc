filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-css-color'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mtth/scratch.vim'
Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Bundle 'justinmk/vim-sneak'
" Bundle 'kassio/neoterm'
Bundle 'altercation/vim-colors-solarized'
" Plugin 'sjl/gundo.vim.git'
" Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show trailing whitespace chars
match ErrorMsg '\s\+$'

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" No line numbers
set nonumber

" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Auto-reload vimrc
augroup reload_vimrc " {
        autocmd!
            autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END " }

" Show last command (after tpope's vim-sensible)
set showcmd

" Set to auto read when a file is changed from the outside
au FileChangedShell * echo "file changed on disk"

" Remove tabline
set showtabline=1

" Highlight current line
set cursorline

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
set colorcolumn=85

" Special intendation mode for HTML
" autocmd FileType html setlocal shiftwidth=2 tabstop=2

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Got Solarized working for VIM, finally!
set t_Co=256
colorscheme solarized
set background=dark

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
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" Intendation for web development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


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
" Neoterm setup
" if has("nvim")
"     autocmd TermOpen * setlocal statusline=%{b:term_title} | let w:airline_disabled = 1
"     let g:neoterm_position = "horizontal"
"     let g:neoterm_size = 8
"     let g:neoterm_autoinsert = 1
"     tnoremap <Esc> <C-\><C-n>
    " tnoremap <A-h> <C-\><C-n><C-w>h
    " tnoremap <A-j> <C-\><C-n><C-w>j
    " tnoremap <A-k> <C-\><C-n><C-w>k
    " tnoremap <A-l> <C-\><C-n><C-w>l
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
let NERDTreeChDirMode=2
map <F2> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Sneak
nmap s <Plug>Sneak_s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic setup
let g:syntastic_check_on_open = 1
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive setup
" noremap <leader>gw :Gwrite<bar>Gcommit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP setup
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>f :CtrlPMRUFiles /home/$USER/<CR>

let g:ctrlp_working_path_mode = 'a'

if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pymode setup

let g:pymode_trim_whitespaces = 0
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0

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
" Unite setup

nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>d :Unite -start-insert buffer<cr>
nnoremap <space>f :Unite file<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mappings for easy buffer switching
noremap gn :bn<cr>
noremap gp :bp<cr>
noremap gd :bd<cr>
noremap gr :b#<cr>

" Mappings for easy buffer switching
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>

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

" Read vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Kill white space
nnoremap <Leader>dw :%s/\s\+$//e<CR>

" Folding
nnoremap <space> za

" paste toggle
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" For LaTeX compiling
map <f9> :w<bar>!pdflatex %<cr>

" For LaTeX compiling
map <f10> :!scp % root@192.168.110.163:/

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
" func! DeleteTrailingWS()
"   exe "normal mz"
"   %s/\s\+$//ge
"   exe "normal `z"
" endfunc
" autocmd BufWrite *.py :call DeleteTrailingWS()
