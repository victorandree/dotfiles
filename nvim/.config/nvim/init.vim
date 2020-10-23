if &compatible
  set nocompatible
endif

" Uses https://github.com/kristijanhusak/vim-packager to manage vim plugins
" This must be installed independently:
"
" git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
"
" Then, :PackagerInstall and :PackagerUpdate are used to install packages
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('easymotion/vim-easymotion')
  call packager#add('kshenoy/vim-signature')
  call packager#add('maxbrunsfeld/vim-emacs-bindings')
  call packager#add('michaeljsmith/vim-indent-object')
  call packager#add('moll/vim-bbye')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-sleuth')
  call packager#add('tpope/vim-speeddating')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('tpope/vim-vinegar')
  call packager#add('tyrannicaltoucan/vim-deep-space')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

filetype plugin indent on
syntax enable

try
  colorscheme deep-space
  set background=dark
  set termguicolors
catch
  colorscheme peachpuff
endtry

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

" Unset problematic settings in VS Code
if exists('g:vscode')
  set colorcolumn=
  set nohidden
endif

