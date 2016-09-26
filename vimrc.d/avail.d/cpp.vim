Plugin 'vim-scripts/Conque-GDB'
Plugin 'octol/vim-cpp-enhanced-highlight'

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" ConqueGDB
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

" Enhanced Highlighter
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1 " not very good one

map <C-B> :wa<CR>:!make<CR>
nnoremap <F4> :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nnoremap <F5> :ConqueGdb<CR>
