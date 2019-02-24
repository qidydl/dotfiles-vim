" qidydl's vimrc file. Intended for use with tpope/vim-sensible providing some defaults.

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set tab settings
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

set copyindent       " copy previous line's indenting structure by default
set showmode         " display insert/replace/visual mode
set showcmd          " display incomplete commands
set hidden           " unloaded buffers are hidden rather than closed
set wildmode=list:longest
set visualbell       " flash the screen for errors
if exists("+cursorline")
   set cursorline    " highlight the line the cursor is on
endif

set number           " turn on line numbering
set nobackup         " do not keep a backup file
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
