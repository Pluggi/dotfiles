""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Pluggi
"   <pluggi512@gmail.com>
"
" Complete_version:
"   You can find the complete configuration,
"   including all the plugins used, here:
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" General parameters
""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable vi compatibility mode
set nocompatible

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
set encoding=utf-8

" Hide buffers instead of closing them
set hidden

" Set the time (in milliseconds) spent idle until various actions occur
" In this configuration, it is particularly useful for the tagbar plugin
set updatetime=500

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line numbers relatively to the current one
" set relativenumber

" Show line number
set number

" Always show status line
set laststatus=2

" Format the status line
" This status line comes from Pierre Bourdon's vimrc
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=list:longest:full

" Disable bell completely
set visualbell
set t_vb=

" Color the column after textwidth, usually the 80th
if version >= 703
  set colorcolumn=+1
  hi ColorColumn ctermfg=NONE ctermbg=235
endif

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤

set fillchars=vert:│

" Enables syntax highlighting
syntax on

" Enable Doxygen highlighting
let g:load_doxygen_syntax=1

" Allow mouse use in vim
set mouse=a

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on column 80
set textwidth=79

" Disable preview window on completion
set completeopt=menu,longest

" Highlight current line
set cursorline
hi CursorLine ctermfg=NONE cterm=bold term=bold ctermbg=235
hi CursorLineNr ctermfg=NONE cterm=bold term=bold ctermbg=235

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" Toggle g option by default on substition
set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The number of spaces inserted when you press tab
set softtabstop=4

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" This one is complicated. See :help cinoptions-values for details
set cinoptions=(0,u0,U0,t0,g0,N-s

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set "," as map leader
let mapleader = ","

" 'very magic' regexp searches
nnoremap / /\v
nnoremap ? ?\v

" 'very magic' regexp substitutions
cnoremap %s %s/\v

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Move between rows in wrapped lines
noremap j gj
noremap k gk

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Write as root, when you forgot to sudoedit
cnoreabbrev w!! w !sudo tee % >/dev/null

" map ; to :
noremap ; :

" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" The ultimate mapping for edit/compile/edit workflow
" This mapping runs :make silently, then opens the quickfix window
" if there are errors, or close it if it was already opened and there are
" no more errors
noremap <leader>m :silent! :make \| :redraw! \| :botright :cw<cr>

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" From the Vim wiki
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vim/autoload/pathogen.vim"))
    runtime! autoload/pathogen.vim
    if exists("g: loaded_pathogen")
        execute pathogen#infect()
    endif
endif

