" ======================    编码设置    ======================{{{
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
language messages zh_CN.utf-8
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
behave mswin
" end }}}

"  ===============   配色（ Colors） & 文字（Fonts）========= {{{
set guifont=Terminus\ 13
set gfw=Terminus:cGB2312\ 11
au GUIEnter * winpos 0 0
au GUIEnter * call MaximizeWindow()
color wombat

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"end }}}

"  ===============   打开文件时，总是跳到退出之前的光标处========= {{{
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
"end }}}

set nobackup			" 覆盖文件时不备份
set number			" 显示行号
setlocal noswapfile		" 不要生成swap文件

