" call vundle#begin()

" python syntax checker
" Plugin 'klen/python-mode'
" Plugin 'davidhalter/jedi-vim'
Plugin 'joonty/vdebug' " debugger
Plugin 'rosenfeld/conque-term' " call interpreter
Plugin 'scrooloose/syntastic' " checking syntax
Plugin 'nvie/vim-flake8'  " PEP8 support

" call vundle#end() " required

" ============ Python-mode setting ===============

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
"

" Don't autofold code
" let g:pymode_folding = 0

" Get possibility to run Python code
" let g:pymode_run = 0
" ====================================================


" Jedi-vim
"let g:jedi#completions_enabled = 0
"let g:jedi#show_call_signatures = 0 " Show call signatures
"let g:jedi#popup_on_dot = 0         " Enable autocomplete on dot
"let g:jedi#popup_select_first = 0 " Disable first select from auto-complete
"let g:jedi#rename_command = "<leader>r"


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
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*c set omnifunc=omni#cpp#complete#Main

"=============== Python debug hot keys ============

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
			\'close' : '<S-F5>',
			\'eval_under_cursor' : '<leader>E'
			\}
" ConqueTerm
" run interpreter by Ctrl-F5
nnoremap <C-F5> :wa<CR> :ConqueTermSplit ipython<CR>
nnoremap <F4> :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

nnoremap <buffer> <F5> :wa<CR> :VdebugStart<CR>

" nnoremap <buffer> <C-F5> :w<CR> :exec '!python' shellescape(@%, 1)<cr>

" а debug-mode на Ctrl <F6>
" nnoremap <C-F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

"==================================================


