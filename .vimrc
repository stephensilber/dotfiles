filetype off                  " required
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() " alternatively, pass a path where Vundle should install plugins "
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a " different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" Highlights letters in current line for easier f/F/t/T traversal
Plugin 'unblevable/quick-scope'

" Sets indent levels to what is detected in current file
Plugin 'tpope/vim-sleuth'

" Better status bar
Plugin 'bling/vim-airline'

" fuzzy file opener
Plugin 'ctrlpvim/ctrlp.vim'

" end/endif for vim
Plugin 'tpope/vim-endwise'

" bunch of rails specific stuff
Plugin 'tpope/vim-rails'

" Markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" cpplint support
Plugin 'scrooloose/syntastic'

" sidebar viewer
Plugin 'scrooloose/nerdtree'

" Fix buffer delete forcing nerdtree to be the last window open
Plugin 'qpkorr/vim-bufkill'

" Vim Go bindings
Plugin 'fatih/vim-go'

" Surround text objects with stuff like parantheses, quotes, etc.
" `saiw(` makes foo into (foo) for example
Plugin 'machakann/vim-sandwich'

" Highlight all matches bb
Plugin 'haya14busa/incsearch.vim'

" Easy Motion!
Plugin 'easymotion/vim-easymotion'

"autocmd bufenter * AirlineToggle

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ " Put your non-Plugin stuff after this line

" Activate NERDTree plugin
" Start NERDTree
"autocmd VimEnter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Jump to the main window.
"autocmd VimEnter * wincmd p

" Close NERDTree if it's the last open window autocmd bufenter
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

syntax enable       " enable syntax processing
colorscheme Tomorrow-Night-Bright " monokai colorscheme
 
" spaces & tabs
set tabstop=2       " number of visual spaces per tab
set softtabstop=2   " number of spaces in tab while editing
set shiftwidth=2    " number of spaces inserted for indentation
set expandtab       " tabs are spaces
 
" vim ui config
"set cursorline      " show current line editing
set number          " show line numbers
set showcmd         " show command in buttom bar
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]
set title           " set title of terminal
set visualbell      " remove sounds
set noerrorbells    " remove error sounds
set history=1000    " set longer command history storing
set undolevels=1000 " set longer undo history set wildignore=*.swp,*.bak,*.pyc,*.class "ignore compiled files
set smarttab        " indenting will go to the expected indentation level
set matchpairs+=<:> " match brackets in HTML
set ignorecase      " ignore case when searching
set hlsearch        " highlight all search results
set incsearch       " begin searching immediately as you type
set timeoutlen=2000
set colorcolumn=80  " show a ruler at the 80th column
set hidden          " allows buffers to be hidden without saving
set wildchar=<Tab> wildmenu wildmode=full
let mapleader="\<Space>"

" make splits open in a more natural way
set splitbelow
set splitright
 
" search
set incsearch       " search as chars are entered
set hlsearch        " highlight matches
nnoremap ,<space> :nohlsearch<CR>        " turn off search highlight
 
" folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
"nnoremap <space> za     " space open/closes folds   " remaps fold from za to space

" Indentation magic
set cino+=(0
 
" movement
nnoremap j gj
nnoremap k gk
" Map 0 to ^ for easy access to first non-blank character at the beginning of
" a line.
noremap 0 ^
noremap ^ 0
" Use normal regex instead of Vim's custom one
"noremap / /\v
" Go to command mode
noremap <cr> :
" Leave Ex mode--for good
nnoremap Q <nop>

" make window navigation easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>v :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" nnoremap <expr> <Leader>* @/=='\<'.expand('<cword>').'\>' ? '*' : ":let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>"
nnoremap <expr> * @/=='\<'.expand('<cword>').'\>' ? '*' : ":let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>"

" Fix buffer delete forcing nerdtree to be the last window open
cnoremap bd BD

" Mappings for improved incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" airline settings
set ttimeoutlen=50
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" ctrl-p settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_working_path_mode = 'ra'

" syntastic settings
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_args="--extensions=cxx,h"

" vim-go settings

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"


" EasyMotion settings
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ }


" Quick-Scope config
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim

let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim


" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']


" Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
" Note that you must use nmap/vmap instead of their non-recursive versions (nnoremap/vnoremap).
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
