" ~~~~~~~~~~~~~~~~~~~~~~ Colemak Specific Keybindings ~~~~~~~~~~~~~~~~~~~~~~~~
" Inserts

nnoremap a I
nnoremap r i
nnoremap s o
nnoremap S O
nnoremap t A


" Testing without these has movement with colemak handled on my keyboard
" firmware. 
"
" Right hand nav
"nnoremap h h
"nnoremap n j
"nnoremap e k
"nnoremap i l

" Line Movement
" Move word forward, maybe try alternate white space  
"nnoremap I w
"nnoremap H B
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set mouse=a "Adds mouse functionality

set nocompatible
"syntax on " Syntax highlighting
filetype indent on 
set ignorecase " If all lowercase, case insensitive search
set smartcase " If one or more upper-case, case sensitive search
set backspace=start,eol,indent " ability to delete these 
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set tw=80 " 80 Character text width

" Cursor change when in different modes mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


" Lines
set number relativenumber "Hybrid line numbering
set nowrap "No Linewrapping
set scrolloff=5 " 5 lines of space top/bottom when scrolling


" To deal with delay
set ttimeout
set ttimeoutlen=1
set ttyfast

" Plugins
filetype plugin on " Allow Plugins
call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'lukas-reineke/indent-blankline.nvim'

" testing start
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
set background=dark
colorscheme gruvbox
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" testing end

" Sets vimwiki to use reqular markdown instead of vimwiki's markdown
let g:vimwiki_list = [{'path': '/home/harrison/backup/my_gits/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" Python PEP-8 standard 79 character marker
" Also suitable for markdown 80 character standard
set colorcolumn=80 " red line, at pep-8 max width
highlight ColorColumn ctermbg=9
