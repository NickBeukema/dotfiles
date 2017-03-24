"execute pathogen#infect()
call plug#begin()

Plug 'dsawardekar/ember.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'dsawardekar/portkey'
Plug 'kchmck/vim-coffee-script'
Plug 'skammer/vim-css-color'
Plug 'mustache/vim-mustache-handlebars'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

let test#runners = {'JavaScript' : ['Ember']}
let test#javascript#runner = 'ember'

" NERD Tree
map <C-n> :NERDTreeToggle<CR> " Map ctrl-n to toggle pane
:hi Directory guifg=#FF0000 ctermfg=red " Set filename colors to red
let NERDTreeShowHidden=1 " auto show hidden files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close tree if last pane

" CTRLP
"if executable('ag')
  "" Use Ag over Grep
  "set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore and .agignore
  "let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  "" ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0

  "if !exists(":Ag")
    "command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    "nnoremap \ :Ag<SPACE>
  "endif
"endif

" Map // to search for visually selected text
vnoremap // y/<C-R>"<CR>

" Remap Ctrl-w J to Ctrl-j and so on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

filetype plugin indent on
au BufRead,BufNewFile *.thor set filetype=ruby

:set t_Co=256

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

colorscheme railscasts

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
map <C-p> :Files<CR>

" Vim Test shortcuts
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "vimux"
