set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=a

" remap
let mapleader = " "
inoremap jk <Esc>
noremap ; :
noremap <Up>				<NOP>
noremap <Down>				<NOP>
noremap <Left>				<NOP>
noremap <Right>				<NOP>
noremap <S-Right>			<C-w><Right>
noremap <S-Left>			<C-w><Left>
noremap <S-Up>				<C-w><Up>
noremap <S-Down>			<C-w><Down>
noremap <S-l>				<C-w>l
noremap <S-h>				<C-w>h
noremap <S-k>				<C-w>k
noremap <S-j>				<C-w>j
noremap <leader>j  			:join<cr>
noremap <leader>h			:noh<cr>

" keep selection after identation
xnoremap <  <gv
xnoremap >  >gv

set noswapfile
set textwidth=0
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
"set textwidth=100   "Line wrap (number of cols)
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set visualbell  "Use visual bell (no beeping)
set cursorline          " highlight current line
set matchpairs+=<:>     " specially for html

set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally

syntax on
set nu
set tabstop=4
set autoindent   " Auto-indent new lines
set shiftwidth=4 " Number of auto-indent spaces
set smartindent  " Enable smart-indent
set smarttab     " Enable smart-tabs
set wildmenu     " visual autocomplete for command menu
set lazyredraw   " redraw only when we need to.
set confirm      " get a dialog when :q, :w, or :wq fails
set nobackup     " no backup~ files.
set hidden       " remember undo after quitting
set history=150  " keep 50 lines of command history
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set backspace=indent,eol,start
set t_ut=

"change cursor shape in insert mode
"Iterm2 only
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<

"color scheme
set background=dark
colorscheme solarized
" colorscheme molokai
let g:molokai_original = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'godlygeek/tabular'

Plugin 'rhysd/vim-clang-format'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-dispatch'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'fatih/vim-go'

Plugin 'isRuslan/vim-es6'

Plugin 'itchyny/lightline.vim'

Plugin 'ryanoasis/vim-devicons'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'prettier/vim-prettier'

Plugin 'OrangeT/vim-csharp'

Plugin 'leafgarland/typescript-vim'

""" Completion
if !has('nvim')
	Plugin 'Valloric/YouCompleteMe'
endif

if has('nvim')
	Plugin 'Shougo/deoplete.nvim'
	Plugin 'carlitux/deoplete-ternjs'
endif

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
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" NERDTree config
noremap <leader>n :NERDTreeToggle<CR>

if !has('nvim')
	"   YCM
	" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
	" :h ins-completion.
	" :YcmDiags - errors
	let g:ycm_confirm_extra_conf = 0
	let g:ycm_error_symbol = '%'
	let g:ycm_warning_symbol = '%'
	nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
	nnoremap <leader>yg :YcmCompleter GoTo<CR>
	nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
	nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
	nnoremap <leader>yd :YcmCompleter GetDocImprecise<CR>
	nnoremap <leader>yf :YcmCompleter FixIt<CR>
	nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
	nnoremap <leader>ys :YcmDiags<CR>
	nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
	nnoremap <leader>yR :YcmRestartServer<CR>
endif


" CLANG FORMAT
" default settings
let g:clang_format#code_style = "chromium"
let g:clang_format#auto_format = 0

autocmd FileType cpp ClangFormatAutoEnable

let g:clang_format#style_options = {
			\ "AllowShortFunctionsOnASingleLine": "Empty",
			\ "AlwaysBreakTemplateDeclarations": "true",
			\ "IndentCaseLabels": "true",
			\ "IndentWidth":     4,
			\ "MaxEmptyLinesToKeep": 2,
			\ "TabWidth": 4,
			\ "UseTab": "ForIndentation"}

" Default multi cursors mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

autocmd VimResized * wincmd =

" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 90

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'es5'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'

let g:prettier#autoformat = 0

set laststatus=2
set noshowmode
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
