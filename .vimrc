" ======================    ��������    ======================{{{
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

"  ===============   ��ɫ�� Colors�� & ���֣�Fonts��========= {{{
set guifont=Terminus\ 13
set gfw=Terminus:cGB2312\ 11
au GUIEnter * winpos 0 0
au GUIEnter * call MaximizeWindow()
color wombat

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"end }}}

"  ===============   ���ļ�ʱ�����������˳�֮ǰ�Ĺ�괦========= {{{
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
"end }}}

set nobackup			" �����ļ�ʱ������
set number			" ��ʾ�к�
setlocal noswapfile		" ��Ҫ����swap�ļ�

