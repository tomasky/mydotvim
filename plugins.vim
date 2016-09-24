set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 " let Vundle manage Vundle
 " required! 
Plugin 'VundleVim/Vundle.vim'
 
" ----- Plugins managed by Vundle -----My Bundles here:
"Plugin 'osyo-manga/vim-monster' 
Plugin 'vimwiki/vimwiki'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree' 
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'kchmck/vim-coffee-script' 
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'alderz/smali-vim' 
Plugin 'derekwyatt/vim-sbt'
Plugin 'rust-lang/rust.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin  'fatih/vim-go'
Plugin 'derekwyatt/vim-scala'
Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'JuliaLang/julia-vim' 
Plugin 'tpope/vim-markdown' 
Plugin 'davidhalter/jedi-vim' 

Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'suan/vim-instant-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin  'scrooloose/syntastic' 

Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/unite-outline'
Plugin 'mbbill/undotree'
Plugin 'dkprice/vim-easygrep'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim' 
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'

"------------others




Plugin 'taglist.vim' 
Plugin 'TaskList.vim' 

"nouseage
"Plugin 'ternjs/tern_for_vim'
"Plugin  'nsf/gocode', {'rtp': 'vim/'}
"Plugin 'ervandew/supertab'
"Plugin 'add20/vim-conque' 
"Plugin 'ensime/ensime-vim'
"Plugin 'Shougo/neomru.vim'
"Plugin 'wting/rust.vim'
"Plugin 'racer-rust/vim-racer'
"Plugin 'tomtom/quickfixsigns_vim'

"Plugin 'javacomplete' 
"Plugin  'Shougo/vimshell.vim'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'Shougo/neocomplete.vim' 


"---------------plugin config end--------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
