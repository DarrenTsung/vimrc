"---------------------------------------------
"| VUNDLE SET-UP
"---------------------------------------------
	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	"---------------------------------------------
	"| PLUGINS BEGIN HERE
	"---------------------------------------------
		Plugin 'kien/ctrlp.vim'
        Plugin 'Valloric/YouCompleteMe'
		Plugin 'scrooloose/syntastic'
		Plugin 'terryma/vim-multiple-cursors'
        Plugin 'flazz/vim-colorschemes'
        Plugin 'Lokaltog/vim-easymotion'
        Plugin 'bling/vim-airline'
        Plugin 'embear/vim-localvimrc'
        Plugin 'mileszs/ack.vim'
	"---------------------------------------------
	"| PLUGINS END HERE
	"---------------------------------------------

	call vundle#end()
	filetype plugin indent on



"---------------------------------------------
"| PLUGIN SET-UP
"---------------------------------------------
	"---------------------------------------------
	"| SYNTASTIC
	"---------------------------------------------
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_auto_jump = 2
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_enable_balloons = 0

	"---------------------------------------------
	"| CTRL-P
	"---------------------------------------------
    " remap Ctrl-O to call open CtrlP
    nnoremap <C-O> :CtrlP<cr>
    " remap exiting CtrlP to be Ctrl-w
    let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<C-w>'] }

    " mark root directories by making a temporary file .ctrlp
    let g:ctrlp_root_markers = ['.ctrlp']
    let g:ctrlp_by_filename = 1

	"---------------------------------------------
	"| VIM-MULTIPLE-CURSORS
	"---------------------------------------------
    let g:multi_cursor_use_default_mapping = 0

    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<C-w>'

	"---------------------------------------------
	"| VIM-AIRLINE
	"---------------------------------------------
    set laststatus=2
    
	"---------------------------------------------
	"| ACK
	"---------------------------------------------
    " remap Ctrl-F to start with :Ack -i (case-insensitive)
    nnoremap <C-F> :Ack -i

    " use the_silver_searcher to search instead of ack
    let g:ackprg = 'ag --vimgrep'


"---------------------------------------------
"| NORMAL SET-UP
"---------------------------------------------
	"---------------------------------------------
	"| MAPPING
	"---------------------------------------------
	let mapleader = ","

	nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>

    " remap <esc> to jk (and remove <esc> from working)
	inoremap jk <esc>
	inoremap <esc> <nop>

    " remap : to ; (and remove : from working)
    nnoremap ; :
    nnoremap : <nop>

    " remap ,r to replace " with ' in the selection
    vnoremap <leader>r :s/"/'/g<cr>

	"---------------------------------------------
	"| SET-UP
	"---------------------------------------------
	" turn on numbering with lines
	set number

	" configure backspace so it acts as it should act
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

	" Change to  colorscheme
	try
	    colorscheme molokai
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
