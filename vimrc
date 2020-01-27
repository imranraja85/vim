set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rails'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'kien/ctrlp.vim'

call vundle#end()

colorscheme ir_black
set background=dark
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


set nu

set wildmenu
set hlsearch
set ignorecase
set smartcase
set hidden
set showcmd
set scrolloff=8
set directory=~/.backup
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent
set directory=.,$TEMP
set backupdir=~/.backup
set directory=~/.backup

" VIM CONFIGURATION MAPPINGS
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" NAVIGATION MAPPINGS
nmap <silent> <Leader>\ :NERDTreeToggle<CR>
nmap <Tab> :bn<CR> 
nmap <S-Tab> :bp<CR>
nmap <silent> ,bd :bd<CR>
nmap <S-h> :wincmd h<CR>
nmap <S-j> :wincmd j<CR>
nmap <S-k> :wincmd k<CR>
nmap <S-l> :wincmd l<CR>

" RAILS SPECIFIC MAPPINGS
map <Leader>m :Emodel 
map <Leader>sm :ESmodel 
map <Leader>vm :EVmodel 
map <Leader>u :Eunittest 
map <Leader>su :ESunittest 
map <Leader>vu :EVunittest 
map <Leader>c :Econtroller 
map <Leader>sc :EScontroller 
map <Leader>vc :EVcontroller 
map <Leader>v :Eview 
map <Leader>sv :ESview 
map <Leader>vv :EVview 
map <Leader>s :Estylesheet 
map <Leader>ss :ESstylesheet 
map <Leader>sv :EVstylesheet 
map <Leader>l :Elayout 
map <Leader>ls :ESlayout 
map <Leader>lv :EVlayout 
map <Leader>h :Ehelper 
map <Leader>hs :EShelper  
map <Leader>hv :EVhelper 
nmap <silent> ,er :e config/routes.rb<CR>
nmap <silent> ,eg :e Gemfile<CR>
nmap <silent> ,es :e db/schema.rb<CR>
imap db<Tab> require 'pry'; binding.pry<esc>

set statusline=%{fugitive#statusline()}[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" execute current ruby script
nmap <leader>q :!ruby %:p<CR>

map <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

map <C-w> <esc>:w<CR>
imap <C-w> <esc>:w<CR>

map <C-w> <esc>:W<CR>
imap <C-w> <esc>:W<CR>

nmap <F8> :TagbarToggle<CR>
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
noremap % v%

" CtrlP Mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" highlight a character that goes beyond 80 characters
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" Highlight words to avoid in tech writing
" =======================================
"
"   obviously, basically, simply, of course, clearly,
"   just, everyone knows, However, So, easy

"   http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basicallylly\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
autocmd FileType markdown call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()

runtime macros/matchit.vim
