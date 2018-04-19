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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

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
let g:indent_guides_start_level=2
" ɫ����
let g:indent_guides_guide_size=1
" ��ݼ� i ��/���������ӻ�
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" �Զ���������ӻ� ��ɫ
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3

" >>>>>>>>>>
" ��ǩ�б�

" Plug 'majutsushi/tagbar'
" ���ڱ�ǩ�ı�ʶ���б���
" ��Ҫ��װctags `brew install ctags`
" ��װctags ֮��ǩ�б��Ӵ��ڲ��ܳ���

let tagbar_left=1                      " ���� tagbar �Ӵ��ڵ�λ�ó��������༭�������
let tagbar_width=32                    " ���ñ�ǩ�Ӵ��ڵĿ��
let g:tagbar_compact=1                 " tagbar �Ӵ����в���ʾ���������Ϣ
nnoremap <Leader>ilt :TagbarToggle<CR> " ������ʾ�����ر�ǩ�б��Ӵ��ڵĿ�ݼ����ټǣ�identifier list by tag

" ���� ctags ����Щ�����ʶ�����ɱ�ǩ
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" <<<<<<<<<<

" >>>>>>>>>>
" ���뵼��
 
" ���ڱ�ǩ�Ĵ��뵼��

" �Զ����ɱ�ǩ������
" Plug 'vim-scripts/indexer.tar.gz'
" �����������������������
" Plug 'vim-scripts/DfrankUtil'
" Plug 'vim-scripts/vimprj'
" ���ò�� indexer ���� ctags �Ĳ���
" Ĭ�� --c++-kinds=+p+l����������Ϊ --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" Ĭ�� --fields=+iaS ������ YCM Ҫ�����Ϊ --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"


" �������ͬ����ǩ
nmap <Leader>tn :tnext<CR>
" �������ͬ����ǩ
nmap <Leader>tp :tprevious<CR>

" ��������Ĵ��뵼��

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" ֻ���� #include ���Ѵ򿪵��ļ�
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<<<<<<<<<



" >>>>>>>>>>
" ����

" �����Ĳ�����������ص��ؼ��֣��м����ԣ�չʾһ��������
" Plug 'dyng/ctrlsf.vim'
" ʹ�� ctrlsf.vim ����ڹ�����ȫ�ֲ��ҹ�����ڹؼ��֣����ÿ�ݼ���
" ��ݼ��ټǷ���search in project
let g:ctrlsf_ackprg = 'rg' 
nnoremap <Leader>sp :CtrlSF<CR>
" ѡ������ - �ı���ѡ�йؼ���
vmap     <Leader>sp <Plug>CtrlSFVwordPath
" ѡ������ - ����б�
vmap     <Leader>sl <Plug>CtrlSFQuickfixVwordPath
vmap     <Leader>sL <Plug>CtrlSFQuickfixVwordExec

" <<<<<<<<<<


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
" ģ�岹ȫ
" UltiSnips �� tab ���� YCM ��ͻ�������趨
let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
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
" YCM ��ȫ

" �����ȫ�ġ�֧��ģ�������ġ����ٲ�ȫ�Ĳ��
" YCM �� google ��˾������Ŀ����������ʦ Strahinja Val Markovic ������
" Plug 'Valloric/YouCompleteMe'
" YCM ��ȫ�˵���ɫ
" �˵�
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" ѡ����
" highlight PmenuSel term=bold ctermbg=darkred guibg=#13354A


" ��ȫ������ע����ͬ����Ч
let g:ycm_complete_in_comments=1

" ���� vim ���� .ycm_extra_conf.py �ļ���������ʾ
let g:ycm_confirm_extra_conf=0

" ���� YCM ��ǩ��ȫ����
let g:ycm_collect_identifiers_from_tags_files=0

" YCM ���� OmniCppComplete ��ȫ���棬�������ݼ�
inoremap <leader>; <C-x><C-o>

" ��ȫ���ݲ��Էָ��Ӵ�����ʽ���֣�ֻ��ʾ��ȫ�б�
set completeopt-=preview

" �ӵ�һ�������ַ��Ϳ�ʼ����ƥ����
let g:ycm_min_num_of_chars_for_completion=1

" ��ֹ����ƥ���ÿ�ζ���������ƥ����
let g:ycm_cache_omnifunc=0

" �﷨�ؼ��ֲ�ȫ
let g:ycm_seed_identifiers_with_syntax=1

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

" call NERDTreeHighlightFile('jade',   'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('md',     'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml',    'magenta', 'none', 'yellow', '#E70350')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf',   'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json',   'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html',   'green', 'none', 'green', '#04E703')
" call NERDTreeHighlightFile('styl',   'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css',    'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js',     'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

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
