set nocompatible " required
filetype off     " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

" Plugin 'klen/python-mode'
" Plugin 'Valloric/YouCompleteMe' " autocompleter
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'joonty/vdebug' " debugger
Plugin 'rosenfeld/conque-term' " call interpreter

" python syntax checker
Plugin 'scrooloose/syntastic' " checking syntax
Plugin 'nvie/vim-flake8'  " PEP8 support

"filesystem
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'


call vundle#end() " required
filetype on
filetype plugin on
filetype plugin indent on " required

set hlsearch

"------------Start Python PEP 8 stuff----------------

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
filetype indent on
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

" Folding based on indentation:
" autocmd FileType python set foldmethod=indent

" use space to open folds
" nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

" =====================================================
" Python-mode settings
" =====================================================
" Python-mode
" Activate rope
" Keys:
" K Show python docs
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
" let g:pymode_rope = 0

" Documentation
" let g:pymode_doc = 0
" let g:pymode_doc_bind = 'K'

"Linting
" let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pylint', 'pep8']
" let g:pymode_lint_cwindow = 1
" let g:pymode_lint_ignore="E501,W601,C0110,C0111"
" let g:pymode_lint_write = 0

" Support virtualenv
" let g:pymode_virtualenv = 1

" Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
" let g:pymode_folding = 0

" Get possibility to run Python code
" let g:pymode_run = 0
" ====================================================
" ====================================================

" let mapleader = ","

" Jedi-vim
let g:jedi#show_call_signatures = 0 " Show call signatures
let g:jedi#popup_on_dot = 0         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0 " Disable first select from auto-complete
let g:jedi#rename_command = "<leader>r"
set completeopt=menuone,longest " don't show preview win

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2 " always show statys line
set t_Co=256

let g:SimpylFold_docstring_preview = 1

"autocomplete
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_auto_trigger=0
" let g:ycm_complete_in_strings=0
" let g:ycm_min_num_of_chars_for_completion=0

"custom keys
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

" python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" ============= Colors ====================
"syntax enable
"set background=dark " or light
"colorscheme solarized
"call togglebg#map("<F5>")
set t_Co=256
colorscheme Tomorrow-Night2
" ============ End Colors Section ==========

"====================Start Hot Keys Section ==========================

" VDebug hot keys
" http://docs.activestate.com/komodo/4.4/debugpython.html
" python -S ~/py_dev/Komodo-PythonRemoteDebugging-10.0.1-89237-linux-x86_64/py3_dbgp.py -d 127.0.0.1:9000 ~/python_test/project_test/test.py
"map <C-b> :Breakpoint<CR>
"map <F10> :VdebugCommandStepOver<CR>
"map <F11> :VdebugCommandStepIn<CR>
"map <C-F11> :VdebugCommandStepOut<CR>
"map <F4> :VdebugCommandRunToCursor<CR>
"map <F5> :VdebugStart<CR>

let g:vdebug_keymap = {
			\'set_breakpoint' : '<C-b>',
			\'step_over' : "<F10>",
			\'step_into' : '<F11>',
			\'step_out' : '<S-F11>',
			\'run' : '<F5>',
			\'close' : '<S-F5>'
			\}

nnoremap <buffer> <F5> :wa<CR> :VdebugStart<CR>

" ConqueTerm
" run interpreter by Ctrl-F5
nnoremap <C-F5> :wa<CR> :ConqueTermSplit ipython<CR>
"nnoremap <buffer> <C-F5> :w<CR> :exec '!python' shellescape(@%, 1)<cr>

" а debug-mode на Ctrl <F6>
" nnoremap <C-F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0


" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Tab in normal mode - switch panels
nnoremap <Tab> <C-w><C-w>

" Disable Vim standart F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Close window by Ctrl-w
nnoremap <C-w> :q<CR>

" NERDTree
map <F1> :NERDTreeToggle<CR>  " browse the list of files in the current directory
" ================== End Hot Keys Section =================
"

" Remove whitespaces at the end of all lines in the file being saved
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

autocmd BufWritePre * :call TrimWhitespace()

