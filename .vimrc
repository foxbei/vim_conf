let $VIMFILES = $HOME.'/.vim'
let $V = $HOME.'/.vimrc'
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

"   ===============   ��ǩҳ����   ========= {{{
if has("gui_running")
    set showtabline=2
    map! tn tabnew
    nmap <C-c> :tabclose<CR>
endif

" ��ǩҳֻ��ʾ�ļ���
function ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
set guitablabel=%{ShortTabLabel()}
" end }}}

set nobackup			" �����ļ�ʱ������
set number			" ��ʾ�к�
setlocal noswapfile		" ��Ҫ����swap�ļ�
set nocompatible		" �ر� vi ����ģʽ
filetype plugin on		" �������
syntax on			" �﷨����
set hidden			" ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�

"  ===============  �������  ========= {{{

" taglist.vim
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 1
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'"""

" vimwiki
let g:vimwiki_list = [{'path': '/home/foxbei/Project/Mywiki/vimwiki/',
	\ 'path_html': '/home/foxbei/Project/Mywiki/vimwiki_html/',
	\ 'html_header': '/home/foxbei/Project/Mywiki/vimwiki_template/header.tpl',
	\ 'html_footer': '/home/foxbei/Project/Mywiki/vimwiki_template/footer.tpl',
	\ 'css_name': '/home/foxbei/Project/Mywiki/vimwiki_template/style.css',
	\ 'auto_export': 1,
	\ 'diary_link_count': 5}]
" 0:��Ҫ���շ�ʽ������Ϊ Wiki ����; 1:���շ�ʽ������Ϊ Wiki ����
let g:vimwiki_camel_case = 0
" �� GUI �˵���ѡ����õ� wiki, ȱʡֵ: 'Vimwiki'
let g:vimwiki_menu = 'Plugin.Vimwiki'
" 0:�ڶ����б����ｫ���з�תΪ <BR />,������ HTML ��ص�ѡ��
let g:vimwiki_list_ignore_newline =  0
" ������ vimwiki ��ʹ�õ� html ��ǩ�б��Զ��ŷָ�
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
"au BufNewFile,BufRead *.wiki exe 'AcpLock' | setlocal fenc=utf-8

" plugin end }}}

" ====================  �����ӳ��  ========================={{{
"vimwiki
map <S-F4> :VimwikiAll2HTML<cr>
map <F4> :Vimwiki2HTML<cr>
imap <F4> <ESC>:Vimwiki2HTML<CR>

map <F9> :NERDTreeToggle<cr>
imap <F9> <ESC>:NERDTreeToggle<CR>

map <F10> :TlistToggle<cr>
imap <F10> <ESC>:NERDTreeToggle<CR>

map <silent> <C-F11> :call ToggleMenu()<cr>
map <F11> :call ToggleFullScreen()<cr>

"end}}}

" ����������ʷ���� persistent undo 
if has('persistent_undo')
    set undofile
    set undodir=$VIMFILES/\_undodir "Ҫ�½�һ����_undodir�����ļ���
    set undolevels=1000
endif

