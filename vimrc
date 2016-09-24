set nocompatible
source ~/.vim/plugins.vim

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
filetype plugin indent on      " Automatically detect file types.
syntax on
set nu
set autoindent
set ic
set hls
set lbr
colorscheme delek

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
set hlsearch		" search highlighting


"color config here
set cursorline
hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

if has("gui_running")	" GUI color and font settings
  
  set t_Co=256          " 256 color mode
  set cursorline     " highlight current line
  "colors moria

endif

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=3 
   set shiftwidth=3 

   au FileType Makefile set noexpandtab
"}      							

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"--------------------------------------------------------------------------- 
" Tip #382: Search for <cword> and replace with input() in all open buffers 
"--------------------------------------------------------------------------- 
fun! Replace() 
    let s:word = input("Replace " . expand('<cword>') . " with:") 
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
    :unlet! s:word 
endfun 


"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>bc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
map <S-H> gT
" go to next tab
map <S-L>  :tabnext<CR> 
"map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation) {
   " Ctrl-u 1:    underline Parts w/ #'s
   noremap  <C-u>1 yyPVr#yyjp
   inoremap <C-u>1 <esc>yyPVr#yyjpA
   " Ctrl-u 2:    underline Chapters w/ *'s
   noremap  <C-u>2 yyPVr*yyjp
   inoremap <C-u>2 <esc>yyPVr*yyjpA
   " Ctrl-u 3:    underline Section Level 1 w/ ='s
   noremap  <C-u>3 yypVr=
   inoremap <C-u>3 <esc>yypVr=A
   " Ctrl-u 4:    underline Section Level 2 w/ -'s
   noremap  <C-u>4 yypVr-
   inoremap <C-u>4 <esc>yypVr-A
   " Ctrl-u 5:    underline Section Level 3 w/ ^'s
   noremap  <C-u>5 yypVr^
   inoremap <C-u>5 <esc>yypVr^A
"}

"--------------------------------------------------------------------------- 
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 
 
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
autocmd FileType scala set dictionary=~/.vim/dict/scala.dict
autocmd FileType java set dictionary=~/.vim/dict/java.dict


" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo 

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

""**************My config of the VIM***************************************
inoremap <c-l> <Right>
inoremap <c-k> <Up>
inoremap <c-j> <Down>
inoremap <c-h> <Left>


" TECHNICAL
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set winaltkeys=no

nmap <Leader>; :w<CR>
inoremap <a-l> <Esc>
nmap <silent> gn :bn<CR>

autocmd BufRead *.java map <F5> :w<CR>:!clear <CR>:!javac % <CR>:!java %< <CR>
autocmd filetype python map <buffer> <Leader>py  :w<CR>:!python %<CR>
autocmd filetype python imap <buffer> <Leader>py <Esc>:w<CR>:!python %<CR>
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set nowrap
autocmd BufRead *.py set go+=b

autocmd filetype coffee map <buffer> <Leader>cof :w<CR>:!coffee %<CR>
autocmd filetype go map <buffer> <Leader>gor :w<CR>:!go run %<CR>
autocmd filetype haskell map <buffer> <Leader>hs :w<CR>:!runhaskell %<CR>
"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 
 
" --- AutoClose - Inserts matching bracket, paren, brace or quote 
"if !has("gui_running")	
   
  " imap OA <ESC>ki
  " imap OB <ESC>ji
  " imap OC <ESC>li
  " imap OD <ESC>hi
"let g:AutoClosePreservDotReg=0
  " nmap OA k
  " nmap OB j
  " nmap OC l
  " nmap OD h
"endif
"let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}

 
" --- SuperTab
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>
"set completeopt=menu
"set completeopt=longest,menuone 

" --- Tlist
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
nnoremap <silent> <Leader>tl :TlistToggle<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

"--------------------- --- NERDTree
map <leader>n <plug>NERDTreeTabsToggle <CR>  
"noremap <Leader>n :NERDTree<space>
noremap <Leader>n. :execute "NERDTree ".expand("%:p:h")<cr>
noremap <Leader>nb :NERDTreeFromBookmark<space>
noremap <Leader>nn :NERDTreeToggle<cr>
noremap <Leader>no :NERDTreeToggle<space>
noremap <Leader>nf :NERDTreeFind<cr>
noremap <Leader>nc :NERDTreeClose<cr>
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrowExpandable = "▸"
let g:NERDTreeDirArrowCollapsible = "▾"

" --- ConqueTerm
autocmd BufRead *.py noremap <F4> :ConqueTermSplit python<CR>
"autocmd BufRead *.scala noremap <F4> :ConqueTermSplit scala %<CR>
autocmd BufRead *.coffee noremap <F4> :ConqueTermSplit coffee %<CR>
noremap ,sh :ConqueTermSplit bash<CR>

let g:ConqueTerm_InsertOnEnter = 0 " Go straight to insert mode
let g:ConqueTerm_CWInsert = 0      " Allow C-w in insert mode
let g:ConqueTerm_ReadUnfocused = 1 " Read while unfocused too
let g:ConqueTerm_CloseOnEnd = 0

 
 

"------------tagbar filetype-----
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :PluginInstall<CR>
nmap <Leader>bu :PluginInstall!<CR> " Because this also updates
nmap <Leader>bc :PluginClean<CR>

" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>

nmap <Leader>q :q<CR>

let g:gitgutter_sign_added = "✚"
let g:gitgutter_sign_modified = "✹"
"let g:gitgutter_sign_removed = '✖'

"---------------------CtrlP---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

"------git plugin of nerdtree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" Window Movement
" Here's a visual guide for moving between window splits.
"   4 Window Splits
"   --------
"   g1 | g2
"   ---|----
"   g3 | g4
"   -------
"
"   6 Window Splits
"   -------------
"   g1 | gt | g2
"   ---|----|----
"   g3 | gb | g4
"   -------------
nmap <silent> gh :wincmd h<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gk :wincmd k<CR>
nmap <silent> gl :wincmd l<CR>
" Upper left window
nmap <silent> g1 :wincmd t<CR>
" Upper right window
nmap <silent> g2 :wincmd b<Bar>:wincmd k<CR>
" Lower left window
nmap <silent> g3 :wincmd t<Bar>:wincmd j<CR>
" Lower right window
nmap <silent> g4 :wincmd b<CR>

" Top Middle
nmap <silent> gt g2<Bar>:wincmd h<CR>
" Bottom Middle
nmap <silent> gb g3<Bar>:wincmd l<CR>

" Previous Window
nmap <silent> gp :wincmd p<CR>
" Equal Size Windows
nmap <silent> g= :wincmd =<CR>
" Swap Windows
nmap <silent> gx :wincmd x<CR>

"------------------------------airline----
set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='term'
let g:bufferline_echo = 0
"set t_Co=16
let g:airline#extensions#tabline#enabled = 1

"rush racer -------------------------------------------------------
"set hidden
"let g:racer_cmd = "/home/bin/racer"
"let $RUST_SRC_PATH="/home/Soft/rust/rust/src/"
let g:ycm_rust_src_path = '/home/Soft/rust/rust/src/'

"unit--------------------------
"let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutFastWrap = '..'
noremap <Leader>ud :UndotreeToggle<cr>
noremap <Leader>st :SignatureToggle<cr>
noremap <Leader>sr :SignatureRefresh<cr>

noremap <Leader>to :Grep 'TODO\|FIXME\|XXX'<cr>
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
augroup END

"-----------------------------------------syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:statline_syntastic = 0
let g:syntastic_error_symbol = '✗'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black
let g:syntastic_enable_balloons = 1	"whether to show balloons
set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active','active_filetypes':[],'passive_filetypes': ['scala','java','sbt'] }
nnoremap <Leader>sc  :SyntasticCheck<CR> 
nnoremap <Leader>stt :SyntasticToggleMode<CR>
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
"let g:syntastic_html_checkers=['tidy', 'jshint']
"let g:syntastic_html_tidy_exec = 'tidy5'
"let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_key_list_previous_completion=["<c-k>"]
let g:ycm_key_invoke_completion = '<C-\>'
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0 
    return snippet
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

"--------------------------------unite mapping -------------------------------------
nmap <space> [unite]
nnoremap [unite] <nop>
"nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]d :<C-U>Unite -profile-name=mru directory_mru<CR>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
nnoremap <silent> [unite]o :<C-u>Unite outline<cr>
nnoremap <silent> [unite]bm :<C-U>Unite bookmark<CR>
"nnoremap <silent> [unite]ma :<C-U>Unite mark<CR>
nnoremap <silent> [unite]c :<C-U>Unite change<CR>
nnoremap <silent> [unite]dm :<C-u>Unite directory_mru<CR>
nnoremap <silent> [unite]rg :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> [unite]j :<C-U>Unite jump<CR>
nnoremap [unite]un  :<C-u>Unite -no-split<CR><Space>


"--------------------------vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/todolist' ,'syntax': 'markdown', 'ext':'.md'},
         \ {'path': '~/.vimwiki/diary' ,'syntax': 'markdown', 'ext': '.md'},
         \ {'path': '~/Soft/wikis' ,'syntax': 'markdown', 'ext': '.md'}]
nmap <Leader>wb <Plug>VimwikiGoBackLink
let g:vimwiki_global_ext = 0

"-------------------------go-vim
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <Leader>gdb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gim <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

"---------------------------lua-vim
let g:lua_complete_omni = 1

"--------------easymotion
" Gif config
map  /  <Plug>(easymotion-sn)
omap /  <Plug>(easymotion-tn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" Markdown
"let g:markdown_syntax_conceal = 1
let g:markdown_fenced_languages=['html','python','scala','go','rust','lua','julia','java','php','typescript','javascript','haskell','dart']
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
