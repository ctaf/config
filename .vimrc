set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ap/vim-css-color'
Plugin 'davidhalter/jedi-vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-reload vimrc
augroup reload_vimrc " {
        autocmd!
            autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END " }

" Sets how many lines of history VIM has to remember
set history=700

" Show last command (after tpope's vim-sensible)
set showcmd

" Set to auto read when a file is changed from the outside
set autoread
au FileChangedShell * echo "file changed on disk"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for :Explorer
let g:netrw_liststyle=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic setup
let g:syntastic_check_on_open = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP setup
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
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
" Airline setup
set laststatus=2
set termencoding=utf-8
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'  "or use 'raven'
let g:airline_exclude_preview = 0 "no additional airline in preview windows
let g:airline#extensions#branch#enabled = 1

" Got Solarized working for VIM, finally!
set t_Co=256
colorscheme solarized
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show trailing whitespace chars
match ErrorMsg '\s\+$'

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


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
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

" Also PEP8, but only for Python files
au BufRead,BufNewFile *.py,*.pyw set textwidth=79

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/


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

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Mappings for easy buffer switching
noremap gn :bn<cr>
noremap gp :bp<cr>
noremap gd :bd<cr>
noremap gr :b#<cr>

" Turn off highlighting of search hits
map <F3> :nohl <CR>

" Fix syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kill white space
nnoremap <Leader>dw :%s/\s\+$//e<CRt

" paste toggle
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" For LaTeX compiling
map <f9> :w<bar>!pdflatex %<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remove tabline
set showtabline=1

" Saved macros
let @d = "Oimport DomainTools as dt"
