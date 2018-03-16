if &compatible
  set nocompatible               " Be iMproved
endif

" Follow installation instructions at https://github.com/Shougo/dein.vim
" Install to ~/.local/share/dein
"     curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
"     sh installer.sh ~/.local/share/dein
set runtimepath+=$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.local/share/dein')
  call dein#begin('$HOME/.local/share/dein')
  call dein#add('$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('jiangmiao/auto-pairs')             " paired brackets
  call dein#add('tpope/vim-fugitive')               " git wrapper
  call dein#add('christoomey/vim-tmux-navigator')   " easily move between tmux/vim
  call dein#add('easymotion/vim-easymotion')        " really good vim motions
  call dein#add('godlygeek/tabular')                " align stuff with :Tab /=
  call dein#add('junegunn/goyo.vim')                " distraction free editing
  call dein#add('amix/vim-zenroom2')                " zenroom enhancements
  call dein#add('junegunn/limelight.vim')           " dim view outside paragraph
  call dein#add('kshenoy/vim-signature')            " marks in gutter
  call dein#add('maxbrunsfeld/vim-emacs-bindings')  " very useful sometimes
  call dein#add('mattn/calendar-vim')               " calendar view (org-mode)
  call dein#add('mbbill/undotree')                  " :UndotreeToggle
  call dein#add('michaeljsmith/vim-indent-object')  " indentation text objects (i and l)
  call dein#add('moll/vim-bbye')                    " :Bdelete = :bd w/o CTRL-W_c
  call dein#add('tpope/vim-repeat')                 " . support for plugins
  call dein#add('tpope/vim-surround')               " cs]) and friends
  call dein#add('tpope/vim-sleuth')                 " autodetect indentations
  call dein#add('tpope/vim-speeddating')            " Inc/dec dates w CTRL+A/X
  call dein#add('tpope/vim-unimpaired')             " move around quickly
  call dein#add('tpope/vim-vinegar.git')            " buffer control
  call dein#add('sjbach/lusty')                     " change buffers nicely
  call dein#add('scrooloose/nerdcommenter')         " easy comments
  call dein#add('scrooloose/syntastic')             " linter
  call dein#add('vim-scripts/paredit.vim')          " paredit
  call dein#add('chaoren/vim-wordmotion')           " CCase text objects
  call dein#add('Chiel92/vim-autoformat')           " Formatting
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('joshdick/onedark.vim')		        " color scheme from Atom
  call dein#add('Shougo/deoplete.nvim')             " autocompletion
  call dein#add('Shougo/neoinclude.vim')            " auto include
  call dein#add('Shougo/echodoc.vim')               " func sign in echo

  " Language plugins
  call dein#add('pangloss/vim-javascript')          " vastly improved js
  call dein#add('HerringtonDarkholme/yats.vim')     " typescript hilite
  call dein#add('mhartington/nvim-typescript')      " typescript for nvim
  call dein#add('JuliaLang/julia-vim')              " Julia support
  call dein#add('keith/tmux.vim')					" tmux syntax hilite
  call dein#add('chrisbra/csv.vim')                 " CSV editing support
  call dein#add('plasticboy/vim-markdown')          " Markdown support
  call dein#add('jceb/vim-orgmode')					" Org mode for vim
  call dein#add('vim-scripts/utl.vim')              " Links (needed by Org)
  call dein#add('Quramy/vim-js-pretty-template')    " Pretty template strings
  call dein#add('fleischie/vim-styled-components')  " Styled components support

  call dein#add('Shougo/vimshell')

  call dein#end()
  call dein#save_state()
endif

" Required by dein
filetype plugin indent on
syntax enable

set title                               " set title of window
set titlestring=v:%t                  " to just the filename "
set fileformats=unix,dos,mac            " <EOL> detection/handling
set number                              " show line numbers
set ruler                               " show cursor position
set hidden                              " hide buffers, don't delete
set foldlevelstart=99                   " unfold everything on open
set completeopt=menu,longest            " sane completion options
set backspace=eol,start,indent          " sane backspace
set cursorline                          " highlight current line
set switchbuf=usetab                    " reuse windows when opening buffers

" display invisible characters using :set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nnoremap <Leader>8 "*

" toggle paste mode and tell us what you went to
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"

set wildmode=longest:full               " complete to longest common string

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/target/*

" File searching with ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set nobackup                            " disable back-up
set nowb                                " disable back-up
set noswapfile                          " disable swap file

set nowrap                              " don't wrap lines
set linebreak                           " wrap at spaces, not chars
set colorcolumn=80                      " hilite col 80
set breakindent                         " soft wrapped lines continue indent
set showbreak=                          " dont highlight softwrapped lines

set expandtab                           " tabs are spaces
set shiftwidth=2
set tabstop=2
set autoindent                          " continue indentation

set formatoptions=
set formatoptions+=jroq					" apply formatting to comments
set formatoptions+=tc					" wrap lines at textwidth
set formatoptions+=n					" wrap list indent correctly
set formatoptions+=l					" dont reformat already too long lines
set formatoptions+=1					" put one-letter word on new lines

set hlsearch                            " highlight search results
set ignorecase                          " ignore case when searching
set smartcase                           " ...only when all lowercase
set incsearch                           " show hits immediately
set gdefault                            " global replace by default

set cmdheight=2                         " space for echodoc

set mouse=a                             " mouse support

" THEME CONFIGURATION
" set background=dark
" set termguicolors
" colorscheme nord
" if (has("nvim"))
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
if (has("termguicolors"))
 set termguicolors
endif
syntax enable                           " enable syntax hilite
colorscheme onedark

hi QuickFixLine guibg=#bf616a guifg=#d8dee9

" distraction free but not that distraction free
let g:goyo_height = '95%'
let g:goyo_linenr = 1

" support changing insert cursor in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" deoplete / autocomplete
"
" trydeoplete on startup, but it slows stuff down
let g:echodoc#enable_at_startup = 0
let g:deoplete#auto_complete_delay = 0
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#enable_at_startup = 0
" autocmd FileType typescript  call deoplete#enable()
autocmd FileType typescript map <F12> :TSDefPreview<CR>
autocmd FileType typescript map <S-F12> :TSRefs<CR>

" automatically lint stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

let g:vim_markdown_frontmatter=1            " hilite markdown frontmatter
let g:vim_markdown_math=1                   " support math in md (latex)

let g:netrw_dirhistmax = 0                  " disable .netrwhist files

" let g:airline_left_sep=''
" let g:airline_right_sep=''

let NERDSpaceDelims=1						" spaces around comment delims

let g:org_heading_shade_leading_stars = 1   " dont show leading stars in org
let g:org_indent = 1
autocmd BufNewFile,BufRead *.org setlocal ts=2 sw=2 sts=2 expandtab

au FileType qf setlocal nonumber colorcolumn=

" " typescript show signatures
" let g:tsuquyomi_completion_detail = 1
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:nvim_typescript#type_info_on_hold = 1

" Clojure
" let g:paredit_electric_return = 0

" git commit messages
" soft wrapping advice from https://stackoverflow.com/a/989317/303748
au FileType gitcommit setlocal wrap tw=0 fo=jroqnl1 co=86 nuw=6

" Key bindings

let mapleader=" "                           " space is leader key
let maplocalleader=" "

" ,w and friends for _ and CamelCase motions
let g:wordmotion_prefix = '<Leader>'

" visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

nnoremap <Leader>q :Bdelete<CR>             " close buffer wo window
nnoremap <F5> :UndotreeToggle<CR>           " undo tree with <F5>
nnoremap <silent> <Leader><CR> :noh<CR>     " disable hl when ,<CR> pressed
nnoremap <Leader>fef :normal! gg=G``<CR>    " format entire file
nnoremap <Leader>cd :lcd %:h<CR>            " cd to dir of buffer
nnoremap <Leader>md :!mkdir -p %:p:h<CR>    " mkdir dir of buffer

" toggle paste mode and tell us what you went to
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" upper/lowercase word
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" upper/lowercase first char of word
nmap <Leader>U mQgewvU`Q
nmap <Leader>L mQgewvu`Q

" Slow start-up so disable
" nnoremap <silent> <Leader>\ :NERDTreeToggle<CR>

" quickly open config vim
nmap <Leader>fed :e $MYVIMRC<CR>

nmap <Leader>b :LustyBufferExplorer<CR>

" some emacs bindings
imap <C-b> <Left>
imap <C-f> <Right>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
imap <C-d> <Del>
imap <C-h> <BS>

imap <M-BS> <C-w>

"# OLD AND DISABLED PLUGINS

" Plug 'tpope/vim-vinegar.git'            " slow start-up, replace with vanilla vinegar
" Plug 'editorconfig/editorconfig-vim'    " slows down start-up time
" Plug 'terryma/vim-multiple-cursors'     " See https://goo.gl/VKRkqd for alternatives
" Plug 'jmcantrell/vim-virtualenv'        " slow start-up
" Plug 'digitaltoad/vim-pug'              " Pug (Jade) support
" Plug 'leafgarland/typescript-vim'       " Typescript syntax
" Plug 'Quramy/tsuquyomi'                 " Typescript support
" Plug 'altercation/vim-colors-solarized'
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'

" These might be relevant for Clojure editing
" Plug 'tpope/vim-leiningen'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-fireplace'
" Plug 'guns/vim-clojure-highlight'
" Plug 'venantius/vim-cljfmt'
" Plug 'luochen1990/rainbow'
