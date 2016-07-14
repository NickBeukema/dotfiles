execute pathogen#infect()

" NERD Tree
map <C-n> :NERDTreeToggle<CR> " Map ctrl-n to toggle pane
:hi Directory guifg=#FF0000 ctermfg=red " Set filename colors to red
let NERDTreeShowHidden=1 " auto show hidden files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close tree if last pane

filetype plugin indent on
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.hbs set filetype=js

let mapleader=","

set autoindent
set number
syntax on
set et|retab
set showmatch

set shiftwidth=2
set softtabstop=2
set smartindent
set smarttab
set expandtab

set hlsearch
set visualbell

set undolevels=1000
set backspace=indent,eol,start

set ffs=unix,dos
