" dein requires these settings
filetype plugin indent on
syntax enable

" Enables mouse for all modes
set mouse=a

" Prefers \n over \r\n but adapt
set fileformats=unix,dos

" Sets title of window to filename
set title
set titlestring=v:%t

" Displays line numbers and cursor position
set number
set ruler
set cursorline

" Unfolds everything on open
set foldlevelstart=99

" Breaks lines at breaking characters
" Shifting the new line further without highlight
set linebreak
set breakindent
set breakindentopt=min:20,shift:4
set showbreak=

" Disables wrapping but highlights column 80
set nowrap
set colorcolumn=80

" Expand tabs into 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

" Resets format options
" Formats numbered lists correctly
" Puts one-letter words on a new line
" Wraps text and comments automatically
" Adds/removes comments leaders automatically
set formatoptions=
set formatoptions+=n
set formatoptions+=1
set formatoptions+=tc
set formatoptions+=jro

" Allows formatting comments with q
set formatoptions+=q

" Keeps buffers around and reuse windows
set hidden
set switchbuf=usetab

" Disables backups and other temporary files
set nobackup
set nowritebackup
set noswapfile

" Allows backspace to work across various things in insert mode
set backspace=eol,start,indent

" Completes with menu and preview of there are multiple options
set completeopt=menu,longest,preview

" Configures how filenames are expanded and which files are ignored
set wildmode=longest:full
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/target/*

" Characters used to display whitespace with `set list`
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" Configures search to be case-insenitive and global replace by default
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

" Key bindings
let mapleader=" "
let maplocalleader=" "

" Some useful key bindings from emacs/macOS
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-d> <Del>
imap <C-h> <BS>
imap <M-BS> <C-w>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Edits $MYVIMRC
nmap <Leader>fed :e $MYVIMRC<CR>

