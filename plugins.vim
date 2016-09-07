set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 " let Vundle manage Vundle
 " required! 
Plugin 'VundleVim/Vundle.vim'
 
" ----- Plugins managed by Vundle -----My Bundles here:
"Plugin 'osyo-manga/vim-monster' 
Plugin 'tpope/vim-repeat'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
Plugin 'MattesGroeger/vim-bookmarks'

 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'easymotion/vim-easymotion'
 "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 "Bundle 'tpope/vim-rails.git'
 Bundle 'tpope/vim-surround'
 Bundle 'scrooloose/nerdtree' 
 Bundle 'jiangmiao/auto-pairs'
 Bundle 'scrooloose/nerdcommenter'
 "Bundle 'ervandew/supertab'
 Bundle 'majutsushi/tagbar'
 Bundle 'suan/vim-instant-markdown'
 Bundle 'derekwyatt/vim-scala'

Plugin 'vimwiki/vimwiki'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'JuliaLang/julia-vim' 
Plugin 'SirVer/ultisnips'

 Bundle 'derekwyatt/vim-sbt'
 Bundle 'honza/vim-snippets'
 Bundle 'kchmck/vim-coffee-script' 


"Plugin  'nsf/gocode', {'rtp': 'vim/'}
Plugin  'fatih/vim-go'

 "Bundle 'add20/vim-conque' 
 Bundle 'mattn/emmet-vim' 
 Bundle 'tpope/vim-markdown' 
 Bundle 'alderz/smali-vim' 
 Bundle 'mattn/gist-vim'
 Bundle 'mattn/webapi-vim'
 Bundle 'wting/rust.vim'

"Plugin 'ensime/ensime-vim'
Plugin 'davidhalter/jedi-vim' 
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin  'scrooloose/syntastic' 
Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/unite-outline'
Plugin 'mbbill/undotree'
"Plugin 'Shougo/neomru.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'kshenoy/vim-signature'
"Plugin 'tomtom/quickfixsigns_vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'racer-rust/vim-racer'
Plugin 'vim-airline/vim-airline-themes'

" vim-scripts repos
 "Bundle 'L9'

 Bundle 'taglist.vim' 
"Plugin 'artur-shaik/vim-javacomplete2'
 Bundle 'javacomplete' 
 Bundle 'TaskList.vim' 

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

"nouseage
"Plugin  'Shougo/vimshell.vim'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'Shougo/neocomplete.vim' 


"---------------plugin config end--------------------------

call vundle#end()      
filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
