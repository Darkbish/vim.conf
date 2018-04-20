if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
" �����ݼ���ǰ׺����<Leader>
let mapleader=";"
" �ļ�����
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8
" �����ļ��������
filetype on
" ������⵽�Ĳ�ͬ���ͼ��ض�Ӧ�Ĳ��
filetype plugin on
" ����Ӧ��ͬ���Ե���������
filetype indent on
" �����ݼ������׺���β
nmap LB 0
nmap LE $
" ���ÿ�ݼ���ѡ���ı��鸴����ϵͳ������
vnoremap <Leader>y "+y
" ���ÿ�ݼ���ϵͳ����������ճ���� vim
nmap <Leader>p "+p
" �����ݼ��رյ�ǰ�ָ��
nmap <Leader>q :q<CR>
" �����ݼ����浱ǰ��������
nmap <Leader>w :w<CR>
" �����ݼ��������д������ݲ��˳� vim
nmap <Leader>WQ :wa<CR>:q<CR>
" �����κα��棬ֱ���˳� vim
nmap <Leader>Q :qa!<CR>
" ���α����Ӵ���
nnoremap nw <C-W><C-W>
" ��ת���ҷ��Ĵ���
nnoremap <Leader>lw <C-W>l
" ��ת���󷽵Ĵ���
nnoremap <Leader>hw <C-W>h
" ��ת���Ϸ����Ӵ���
nnoremap <Leader>kw <C-W>k
" ��ת���·����Ӵ���
nnoremap <Leader>jw <C-W>j
" �����ݼ��ڽ�Է�֮����ת
nmap <Leader>M %
" �����ñ��������Ч
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" ����ʵʱ��������
set incsearch
" ����ʱ��Сд������
set ignorecase
" �رռ���ģʽ
set nocompatible
" vim ����������ģʽ���ܲ�ȫ
set wildmenu
" ����������
set mouse=a
" �������ƶ����ʱ�������Ϸ����·����ٻᱣ����ʾ������
set so=999
" ��ɫ����
set background=dark
colorscheme onedark
" ����״̬��������
" let g:airline_theme='onedark'
" ��ֹ�����˸
set gcr=a:block-blinkon0
" ������ʾ״̬��
set laststatus=2
" ��ʾ��굱ǰλ��
set ruler
" �����к���ʾ
set number
" ������ʾ��ǰ��/��
set cursorline
set cursorcolumn
" ������ʾ�������
set hlsearch
" ��ֹ����
set wrap
" �����﷨��������
syntax enable
" ������ָ���﷨������ɫ�����滻Ĭ�Ϸ���
syntax on
" ���Ʊ����չΪ�ո�
set expandtab
" ���ñ༭ʱ�Ʊ��ռ�ÿո���
set tabstop=4
" ���ø�ʽ��ʱ�Ʊ��ռ�ÿո���
set shiftwidth=4
" �� vim �����������Ŀո���Ϊһ���Ʊ��
set softtabstop=4
" �����������﷨���д����۵�
set foldmethod=syntax
" ���� vim ʱ�ر��۵�����
set nofoldenable
nmap <C-TAB> :bnext<CR>
nmap <C-S-TAB> :bprev<CR>
" ��ݼ�
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" ��������Щ��Է�
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
let g:user_emmet_mode='i' " enable for insert mode

" airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
" buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ��������
if has('gui_running')
    " ��ֹ��ʾ�������Ͳ˵�
    set guioptions-=T
    set guioptions-=m
    " ��ֹ��ʾ������
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    " set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set guifont=Fira_Mono_for_Powerline:h12
endif

" �������ӻ���� Indent Guides
" �� vim ������
let g:indent_guides_enable_on_vim_startup=1
" �ӵڶ��㿪ʼ���ӻ���ʾ����
let g:indent_guides_start_level=1
" ɫ����
let g:indent_guides_guide_size=1
" ��ݼ� i ��/���������ӻ�
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" �Զ���������ӻ� ��ɫ
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3

" >>>>>>>>>>
" �����滻

" ����滻������ÿ�ݼ�
" Plug 'terryma/vim-multiple-cursors'

let g:multi_cursor_next_key='<S-n>'  " ѡ����һ���ַ�
let g:multi_cursor_skip_key='<S-k>'  " ѡ��������ǰ�ַ�

" ��׼�滻
" �滻����������˵����
" confirm���Ƿ��滻ǰ��һȷ��
" wholeword���Ƿ�����ƥ��
" replace�����滻�ַ���
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" ��ȷ�ϡ�������
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" ��ȷ�ϡ�����
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" ȷ�ϡ�������
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" ȷ�ϡ�����
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <<<<<<<<<<


" >>>>>>>>>>
" ���ٿ���ע��
" Plug 'scrooloose/nerdcommenter'

" ��ע�ͷ�Ĭ����ӿո�
let g:NERDSpaceDelims = 1
" ʹ�ý����﷨��������ע��
let g:NERDCompactSexyComs = 1
" ����ע�ͷ���������������Ĵ�������
let g:NERDDefaultAlign = 'left'
" ��������Ĭ��ʹ�ñ��ö����
let g:NERDAltDelims_java = 1
" ����Զ����ʽ�򸲸�Ĭ��ֵ��
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" ����ע�ͺ�ת�����У�ע������ʱ���ã�
let g:NERDCommentEmptyLines = 1
" ����ʱ����β��ո�ע��
let g:NERDTrimTrailingWhitespace = 1

" <<<<<<<<<<


" >>>>>>>>>>
" �﷨��������֪��JS��
" Plug 'othree/javascript-libraries-syntax.vim'

let g:used_javascript_libs = 'jquery,react,vue'

" autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

" <<<<<<<<<<

" >>>>>>>>>>
" �����ļ����

" �鿴�����ļ��б�
" Plug 'scrooloose/nerdtree'
" ʹ�� NERDTree ����鿴�����ļ������ÿ�ݼ����ټǣ�file list
nmap <Leader>fl :NERDTreeToggle<CR>

" NERDTree: File highlighting �ļ��б��ļ����ָ�����ɫ����
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade',   'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md',     'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'magenta', 'none', 'yellow', '#E70350')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html',   'green', 'none', 'green', '#04E703')
call NERDTreeHighlightFile('styl',   'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css',    'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js',     'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" ���� NERDTree �Ӵ��ڿ��
let NERDTreeWinSize=32
" ���� NERDTree �Ӵ���λ��
let NERDTreeWinPos="left"
" ��ʾ�����ļ�
let NERDTreeShowHidden=1
" NERDTree �Ӵ����в���ʾ���������Ϣ
let NERDTreeMinimalUI=1
" ɾ���ļ�ʱ�Զ�ɾ���ļ���Ӧ buffer
let NERDTreeAutoDeleteBuffer=1

" <<<<<<<<<<

" >>>>>>>>>>
" �����л��᳷�����һ����ಽ����
" Plug 'sjl/gundo.vim'
" ���� gundo ��
nnoremap <Leader>ud :GundoToggle<CR>

" <<<<<<<<<<
