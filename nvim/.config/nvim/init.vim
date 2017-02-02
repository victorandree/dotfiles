" it might make more sense to store this in .local since
" it's not technically config (and clutters the .dotfiles
" directory
call plug#begin('~/.config/nvim/plugged')

" Directory browsing
Plug 'scrooloose/nerdtree'
Plug 'dhruvasagar/vim-vinegar'          " NERDTree fork

Plug 'tpope/vim-fugitive'               " git wrapper
Plug 'airblade/vim-gitgutter'           " git status gutter
Plug 'Xuyuanp/nerdtree-git-plugin'      " git status in NERDTree

Plug 'christoomey/vim-tmux-navigator'   " easily move between tmux/vim
Plug 'easymotion/vim-easymotion'        " really good vim motions
Plug 'editorconfig/editorconfig-vim'    " cross-editor configuration
Plug 'godlygeek/tabular'                " align stuff with :Tab /=
Plug 'junegunn/goyo.vim'                " distraction free editing
Plug 'amix/vim-zenroom2'                " zenroom enhancements
Plug 'junegunn/limelight.vim'           " dim view outside paragraph
Plug 'kshenoy/vim-signature'            " marks in gutter
Plug 'maxbrunsfeld/vim-emacs-bindings'  " very useful sometimes
Plug 'mattn/calendar-vim'               " calendar view (org-mode)
Plug 'mbbill/undotree'                  " :UndotreeToggle
Plug 'michaeljsmith/vim-indent-object'  " indentation text objects (i and l)
Plug 'moll/vim-bbye'                    " :Bdelete = :bd w/o CTRL-W_c
Plug 'tpope/vim-repeat'                 " . support for plugins
Plug 'tpope/vim-surround'               " cs]) and friends
Plug 'tpope/vim-sleuth'                 " autodetect indentations
Plug 'tpope/vim-speeddating'            " Inc/dec dates w CTRL+A/X
Plug 'tpope/vim-unimpaired'             " move around quickly
Plug 'sjbach/lusty'                     " change buffers nicely
Plug 'scrooloose/nerdcommenter'         " easy comments
Plug 'scrooloose/syntastic'             " linter
Plug 'vim-airline/vim-airline'          " vim airline
Plug 'vim-airline/vim-airline-themes'   " with themes
Plug 'vim-scripts/paredit.vim'          " paredit
Plug 'chaoren/vim-wordmotion'           " CCase text objects
Plug 'kylef/apiblueprint.vim'           " API Blueprint
Plug 'jdkanani/vim-material-theme'      " Material design
Plug 'Shougo/vimproc.vim'               " Required for Typescript
Plug 'Chiel92/vim-autoformat'           " Formatting
Plug 'mhinz/vim-startify'               " Fancy start screen

set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'                 " fzf support

" Multiple cursors is great but not for vim
" See https://goo.gl/VKRkqd for alternatives
" Plug 'terryma/vim-multiple-cursors'

" Autocomplete plugin
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Language plugins
Plug 'pangloss/vim-javascript'          " vastly improved js
Plug 'chase/vim-ansible-yaml'           " ansible yaml
Plug 'JuliaLang/julia-vim'              " Julia support
Plug 'jmcantrell/vim-virtualenv'        " py virtualenv support
Plug 'keith/tmux.vim'					" tmux syntax hilite
Plug 'chrisbra/csv.vim'                 " CSV editing support
Plug 'plasticboy/vim-markdown'          " Markdown support
Plug 'digitaltoad/vim-pug'              " Pug (Jade) support
Plug 'jceb/vim-orgmode'					" Org mode for vim
Plug 'vim-scripts/utl.vim'              " Links (needed by Org)
Plug 'leafgarland/typescript-vim'       " Typescript syntax
Plug 'Quramy/tsuquyomi'                 " Typescript support
Plug 'Quramy/vim-js-pretty-template'    " Pretty template strings
Plug 'fleischie/vim-styled-components'  " Styled components support

" These might be relevant for Clojure editing
" Plug 'tpope/vim-leiningen.git'
" Plug 'tpope/vim-projectionist.git'
" Plug 'tpope/vim-dispatch.git'
" Plug 'tpope/vim-fireplace.git'
" Plug 'guns/vim-clojure-highlight'
" Plug 'venantius/vim-cljfmt'
" Plug 'luochen1990/rainbow'

call plug#end()

syntax enable                           " enable syntax hilite
set title                               " set title of window
set fileformats=unix,dos,mac            " <EOL> detection/handling
set number                              " show line numbers
set ruler                               " show cursor position
set hidden                              " hide buffers, don't delete
set foldlevelstart=99                   " unfold everything on open
set completeopt=menu,preview,longest    " sane completion options
set backspace=eol,start,indent          " sane backspace
set cursorline                          " highlight current line
set switchbuf=usetab                    " reuse windows when opening buffers
" set clipboard=unnamed                   " use system clipboard default

" display invisible characters using :set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nnoremap <Leader>8 "*

" toggle paste mode and tell us what you went to
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

set wildmode=longest:full               " complete to longest common string

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/target/*

set nobackup                            " disable back-up
set nowb                                " disable back-up
set noswapfile                          " disable swap file

set nowrap                              " don't wrap lines
set linebreak                           " wrap at spaces, not chars
set colorcolumn=80                      " hilite col 80
set breakindent                         " soft wrapped lines continue indent
set showbreak=                          " dont highlight softwrapped lines

set expandtab                           " tabs are spaces
set shiftwidth=4
set tabstop=4
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

set background=dark
set termguicolors
colorscheme nord

" function! s:base16ParaisoAdjust()
"     hi org_shade_stars guifg=#2f1e2e
" endfunction
" autocmd ColorScheme base16-paraiso call s:base16ParaisoAdjust()
" color base16-paraiso
" call togglebg#map("<F2>")               " toggle dark/light with F2

" distraction free but not that distraction free
let g:goyo_height = '95%'
let g:goyo_linenr = 1

" support changing insert cursor in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" automatically lint stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:vim_markdown_frontmatter=1            " hilite markdown frontmatter
let g:vim_markdown_math=1                   " support math in md (latex)

let g:netrw_dirhistmax = 0                  " disable .netrwhist files

let g:airline_left_sep=''
let g:airline_right_sep=''

let NERDSpaceDelims=1						" spaces around comment delims

let g:org_heading_shade_leading_stars = 1   " dont show leading stars in orgA
let g:org_indent = 1

" typescript show signatures
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']

" Key bindings

let mapleader=","                           " , is leader key
let maplocalleader=","

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

map <silent> <c-p> :FZF<CR>
nnoremap <silent> <Leader>\ :NERDTreeToggle<CR>
