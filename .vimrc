

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

"   ===============   标签页设置   ========= {{{
if has("gui_running")
    set showtabline=2
    map! tn tabnew
    nmap <C-c> :tabclose<CR>
endif

" end }}}

"  ===============  插件设置  ========= {{{

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
" 0:不要将驼峰式词组作为 Wiki 词条; 1:将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0
" 用 GUI 菜单来选择可用的 wiki, 缺省值: 'Vimwiki'
let g:vimwiki_menu = 'Plugin.Vimwiki'
" 0:在多行列表项里将换行符转为 <BR />,这是与 HTML 相关的选项
let g:vimwiki_list_ignore_newline =  0
" 可以在 vimwiki 里使用的 html 标签列表，以逗号分隔
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
"au BufNewFile,BufRead *.wiki exe 'AcpLock' | setlocal fenc=utf-8

" plugin end }}}

" ====================  快键键映射  ========================={{{
"vimwiki
map <S-F4> :VimwikiAll2HTML<cr>
imap <S-F4> <ESC>:VimwikiAll2HTML<CR>

map <F4> :Vimwiki2HTML<cr>
imap <F4> <ESC>:Vimwiki2HTML<CR>

map <F9> :NERDTreeToggle<cr>
imap <F9> <ESC>:NERDTreeToggle<CR>

map <F10> :TlistToggle<cr>
imap <F10> <ESC>:NERDTreeToggle<CR>

"快速载入 .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"快速编辑 .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

"end}}}

" 重启后撤销历史可用 persistent undo 
if has('persistent_undo')
    set undofile
    set undodir=$VIMFILES/\_undodir "要新建一个“_undodir”的文件夹
    set undolevels=1000
endif


" ======================    全局设置 =================={{{
" 设置leader为,
let mapleader=","
let g:mapleader=","
let $VIMFILES = $HOME.'/.vim'
let $V = $HOME.'/.vimrc'
set nocompatible		" 关闭 vi 兼容模式
set number			" 显示行号
filetype plugin indent on	" 开启插件
syntax on			" 语法高亮
syntax enable
set hidden			" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set autochdir			" 自动切换当前目录为当前文件所在的目录
set wrap                  	" 自动换行
set history=400
set nobackup			" 覆盖文件时不备份
setlocal noswapfile		" 不要生成swap文件

"set insertmode			" 默认为插入模式
"end}}}
