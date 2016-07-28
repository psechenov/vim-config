set nocompatible " required
filetype off     " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'Valloric/YouCompleteMe' " autocompleter
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end() " required

filetype on
filetype plugin on
filetype plugin indent on " required
filetype indent on        " Keep indentation level from previous line

set nu                          " turn on numbering
set noswapfile                  " I don't like swap files
set hlsearch
set backspace=indent,eol,start  " make backspaces more powerfull
set encoding=utf-8              " Set the default file encoding to UTF-8
set ruler                       " show line and column number
set showcmd 			" show (partial) command in status line
set completeopt=menuone,longest " don't show preview win
syntax on

" au BufNewFile,BufReadPost *.cpp,*.hpp,*.cxx,*.c,*.h set filetype=cpp

" let mapleader = ","

" Powerline
set laststatus=2 " always show statys line

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger=0
let g:ycm_complete_in_strings=0
let g:ycm_min_num_of_chars_for_completion=0
let g:ycm_collect_identifiers_from_tags_files = 1

" NERD
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree



" ============= Colors ====================
"syntax enable
"set background=dark " or light
"colorscheme solarized
"call togglebg#map("<F5>")
set t_Co=256
colorscheme Tomorrow-Night2
" ============ End Colors Section ==========

"====================Start Hot Keys Section ==========================

" <leader>g - go to
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
" nnoremap <C-j> <C-w><C-j>
" nnoremap <C-k> <C-w><C-k>
" nnoremap <C-l> <C-w><C-l>
" nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
" inoremap <C-space> <C-x><C-o>

" Tab in normal mode - switch panels
nnoremap <Tab> <C-w><C-w>

" Disable Vim standart F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Close window by Ctrl-w
nnoremap <C-w> :q<CR>

" NERDTree
map <F1> :NERDTreeToggle<CR>  " browse the list of files in the current directory

" Simulate good enter behaviour during showing popup menu for completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" ================== End Hot Keys Section =================
"

" Remove whitespaces at the end of all lines in the file being saved
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

autocmd BufWritePre * :call TrimWhitespace()


