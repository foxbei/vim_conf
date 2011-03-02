"================   基础设置   =================={{{
set nocompatible
" 设置leader为,
let mapleader=","
let g:mapleader=","

let $VIMFILES = $HOME.'/.vim'
let $V = $HOME.'/.vimrc'

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype plugin on
filetype indent on
syntax on
syntax enable
filetype on

" 文件格式，默认 ffs=dos,unix
set fileformat=unix
set fileformats=unix,dos,mac
"set guioptions-=m 		" 隐藏菜单栏
"set guioptions-=T 		" 隐藏工具栏
"set guioptions-=L 		" 隐藏左侧滚动条
"set guioptions-=r		 " 隐藏右侧滚动条
"set guioptions-=b		 " 隐藏底部滚动条
"set showtabline=0		 " 隐藏Tab栏

" Text options
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

"}}}

" ======================    编码设置    ======================{{{
set shortmess=atI
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
language messages zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" end }}}

"  ===============   窗口最大化/配色/文字设置    ========= {{{
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
let Tlist_WinWidth=30
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
let g:vimwiki_timestamp_format='%Y年%m月%d日 %H:%M:%S'

"au BufNewFile,BufRead *.wiki exe 'AcpLock' | setlocal fenc=utf-8

" Calendar
" @see http://www.gracecode.com/archives/674/
let g:calendar_smnd = 1
let g:calendar_monday = 1                   " week start with monday.
let g:calendar_weeknm = 1                   " don't work with g:calendar_diary
let g:calendar_mark = 'left-fit'            " let plus(+) near the date, like +8.
"let g:calendar_mruler = '一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月'
"let g:calendar_wruler = '日 一 二 三 四 五 六'
"let g:calendar_navi_label = '上月,本月,下月'

" zencoding.vim
let g:user_zen_expandabbr_key = '<C-l>'
let g:user_zen_leader_key = '<C-y>'

" fuf.vim  fuzzyfinder
"在打开的文件中查找
nmap <leader>fb :FufBuffer<cr>
"在当前文件所在目录查找
nmap <leader>fi :FufDirWithCurrentBufferDir<cr>
"切换工作目录
nmap <leader>fd :FufDir<cr>
"在工作目录查找文件并编辑
nmap <leader>ff :FufFile<cr>
nmap <leader>ft :FufTag<cr>
nmap <leader>fh :FufHelp<cr>

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

" ====={{{重启后撤销历史可用 persistent undo
if has('persistent_undo')
    set undofile
    set undodir=$VIMFILES/\_undodir "要新建一个“_undodir”的文件夹
    set undolevels=1000
endif
"}}}

" ======================    全局设置 =================={{{

set nocompatible		" 关闭 vi 兼容模式
set number			    " 显示行号
set hidden			    " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set wrap                " 自动换行
set history=800
set nobackup			" 覆盖文件时不备份
setlocal noswapfile		" 不要生成swap文件
set backupcopy=yes		" 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set nowrapscan          " 禁止在搜索到文件两端时重新搜索
set incsearch           " 输入搜索内容时就显示搜索结果
set hlsearch            " 搜索时高亮显示被找到的文本
set noerrorbells        " 关闭错误信息响铃
set novisualbell        " 关闭使用可视响铃代替呼叫
set t_vb=               " 置空错误铃声的终端代码
set ambiwidth=double	"设置宽度不明的文字(如 “”①②→ )为双宽度文本

set autochdir			" 自动切换当前目录为当前文件所在的目录
set browsedir=buffer

set foldmethod=marker  "fold based on marker
set foldmarker={{{,}}}

"set insertmode			" 默认为插入模式
"end}}}

" =============FencView.vim 自动识别文件编码==============={{{
" @see http://www.vim.org/scripts/script.php?script_id=1708
let g:fencview_autodetect=1
let g:fencview_auto_patterns='*.txt,*.js,*.css,*.c,*.cpp,*.h,*.java,*.cs,*.htm{l\=}'
let g:fencview_checklines=20
let $FENCVIEW_TELLENC='tellenc'
"}}}

"===================   FileExplorer ======================={{{
" Windows: Explorer.exe
" Linux:   nautilus $PWD
"          nautilus .
" Mac:     open .
" @see http://www.zhuoqun.net/html/y2010/1516.html
function! FileExplorer(path)
    if a:path == ""
        let p = expand("%:p")
    else
        let p = a:path
    endif
    if has("win32") && exists("+shellslash") && &shellslash
        let p = substitute(p, "/", "\\", "g")
    endif

    if executable("chcp")
        let code_page = 'cp' . matchstr(system("chcp"), "\\d\\+")
    else
        " If chcp doesn't work, set its value manually here.
        let code_page = 'cp936'
    endif
    if has('win32') && !has('win32unix') && (&enc!=code_page)
        let p = iconv(p, &enc, code_page)
    endif

    exec ":!start explorer /select, " . p
    " Open Explorer Tree.
    "exec ":!start explorer /e,/select, " . p
endfunction
" }}}

"=========================F12 Chromeit=================={{{
function! Chromeit()
    if has('win32')
        exec '!start "'.$HOME.'\AppData\Local\Google\Chrome\Application\chrome.exe" --enable-extension-timeline-api "%:p"'
    else
        exec '!chromium %:p'
    endif
endfunction

map <silent> <F12> :call Chromeit()<cr>
"}}}

"================对搜索的设置=============={{{
function! Search_Word()
    let w = expand("<cword>") " 在当前光标位置抓词
    execute "vimgrep " w " *"
endfunction

function! Search_Word_dtree()
    let w = expand("<cword>") " 在当前光标位置抓词
    execute "vimgrep " w " **"
endfunction

map <leader>f :call Search_Word()<CR>:copen<CR>
map <leader>ff :call Search_Word_dtree()<CR>:copen<CR>


nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
map <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" }}}
