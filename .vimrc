filetype plugin on
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set spell
set spelllang=en
set t_ut=""
syntax on
nmap <C-n> :NERDTreeToggle<CR>
let g:tex_flavour='latex'
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/slime/start-swank.lisp"'
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'vim-scripts/camelcasemotion'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'cocopon/iceberg.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kien/rainbow_parentheses.vim'
call plug#end()
colorscheme iceberg
let g:airline_powerline_fonts = 1
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
set background=dark
