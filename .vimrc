"---------------------------------------------
"| VUNDLE SET-UP
"---------------------------------------------
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" syntax checker for languages
Plugin 'scrooloose/syntastic'
" commands for commenting (sweet!)
Plugin 'scrooloose/nerdcommenter'
" movement plugin 
Plugin 'Lokaltog/vim-easymotion'
" auto complete! it's awesomee
Plugin 'Valloric/YouCompleteMe'
" change the vim syntax highlighting for the autocompletion suggestions
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff
" multiple cursors (like sublime :D, fav feature from the editor)
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"---------------------------------------------
"| SET-UP 
"---------------------------------------------

" turn on numbering with lines
set number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"---------------------------------------------
"| COLORS AND FONTS
"---------------------------------------------

" Enable syntax highlighting
syntax enable 

" Change to desert colorscheme
try
    colorscheme desert
catch
endtry

set background=dark

"---------------------------------------------
"| TEXT AND TABS
"---------------------------------------------
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"---------------------------------------------
"| MOVING AROUND
"---------------------------------------------
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Return to last edit position when opening files 
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" --> EASY MOTION MAPPINGS
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"---------------------------------------------
"| STATUS LINE
"---------------------------------------------
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"---------------------------------------------
"| HELPER FUNCTIONS
"---------------------------------------------
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"---------------------------------------------
"| COMMANDS	
"---------------------------------------------
" :W -- sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null
