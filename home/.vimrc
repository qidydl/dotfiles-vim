" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Disable modelines, prevents some possible security exploits
set modelines=0

" Set tab settings
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

set encoding=utf-8

set scrolloff=3      " always show some context lines when scrolling
set autoindent       " always set autoindenting on
set copyindent       " copy previous line's indenting structure by default
set showmode         " display insert/replace/visual mode
set showcmd          " display incomplete commands
set hidden           " unloaded buffers are hidden rather than closed
set wildmenu         " enhanced mode for command-line completion
set wildmode=list:longest
set visualbell       " flash the screen for errors
if exists("+cursorline")
   set cursorline    " highlight the line the cursor is on
endif
set ruler            " show the cursor position all the time

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set laststatus=2     " always show status line
set number           " turn on line numbering
set nobackup         " do not keep a backup file
set history=500      " keep 500 lines of command line history
set undolevels=500   " keep 500 levels of undo

" toggles paste mode, which temporarily disables smartness for indentation,
" making it easier to paste
set pastetoggle=<F2>

let mapleader = ","  " set leader key to ,

" automatically insert a \v before search strings, for normal regex syntax
nnoremap / /\v
vnoremap / /\v
set ignorecase       " case-insensitive searches...
set smartcase        " unless we use capitals, in which case it automatically
                     " switches to case-sensitive
set gdefault         " default to replacing all instances on a line
set incsearch        " do incremental searching
set showmatch        " show matching brackets
set hlsearch         " highlight search results

" <leader><space> will clear search highlights
nnoremap <leader><space> :noh<cr>

set wrap             " enable line wrapping
set textwidth=120
set formatoptions=cqrno
if exists('+colorcolumn')
   set colorcolumn=120
endif

set list             " show hidden characters
if v:version >= 700
   set listchars=tab:→\ ,trail:·,extends:#,nbsp:·
else
   set listchars=tab:→\ ,trail:·,extends:#
endif

" force me to learn hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" move up and down by screen rows, not file lines
nnoremap j gj
nnoremap k gk

" Make CTRL-Tab go to the next buffer and Shift-CTRL-Tab go to the previous
" buffer
nnoremap <C-Tab> :bnext<CR>
nnoremap <S-C-Tab> :bprevious<CR>

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

" Set up options for Win32 GUI
set guifont=Lucida\ Console
set bg=dark
colorscheme desert

" ,W strips all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ^t opens a new vertical split
nnoremap <C-t> <C-w>v<C-w>l

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
endif " has("autocmd")

" Enable sh syntax highlighting for Pkgfiles
au BufNewFile,BufRead *Pkgfile set filetype=sh
