"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	"enable VIM improvements
set modelines=5		"interpret 5 lines at bottom for modelines
set modeline			"enable vim modelines usage

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window/Tab related																				"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeQuitOnOpen=1 "close NERDTree when opening a file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap and Backup related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup									" create backups
set undofile								" undo feature (even between exits)
set writebackup							" write backup files
set swapfile								" create .swp files
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, ab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab			"don't convert tabs to spaces
set shiftwidth=2		"length for indentation
set tabstop=2				"length for tabs
set smarttab				"enable smart indetation
set fdm=indent		 "set indentation mode
set autoindent			"enable auto indentation

set breakindent
set lbr


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color/display related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme slate "choose color scheme
let &t_Co=256				"tell vim that the terminal support 256 colors
set hls!						"highlight search hits
syntax enable				"enable syntax highlighting
set showmatch				"show matching braces/brackets/parens
set number				"display line numbers
" set relativenumber
set laststatus=2		"always show the status bar even if there's only one window

" set cursorline
" set cursorcolumn

set scrolloff=8			" keep more context when scrolling off the end of a buffer

set list										" show invisible characters
set listchars=tab:›\				" set tabulator character
set listchars+=trail:⋅			" set trailing whitespace character
"set listchars+=eol:¬				" set end-of-line character
set showbreak=↪							" the character to put to show a line has been wrapped

set colorcolumn=80
"highlight ColorColumn ctermbg=123 guibg=gray10 "colors for the colorcolumns

" fix the ugly bright foldcolumns of the slate color scheme
highlight FoldColumn ctermbg=Black ctermfg=Cyan

" fix the Pmenu colors to be more readable
highlight Pmenu ctermfg=LightGray ctermbg=DarkGray
highlight PmenuSel ctermfg=Black ctermbg=magenta

set showcmd									" show command characters
set showmode								" show the current (paste) mode on the open buffer

set ttyfast									" may improve scrolling performance

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%f				"tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h			"help file flag
set statusline+=%m			"modified flag
set statusline+=%r			"read only flag
set statusline+=%y			"filetype
set statusline+=[%{wordcount().words}\ words]
set statusline+=%=			"left/right separator
set statusline+=%c,			"cursor column
set statusline+=%l/%L		"cursor line/total lines
set statusline+=\ %P		"percent through file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu											" enable menu at the bottom
set wildmode=longest:full					" wildcard matches show a list, matching the longest first, try list:longest
set wildignore+=.git,.hg,.svn			" ignore version control repos
set wildignore+=*.pyc							" ignore Python compiled files
set wildignore+=*.rbc							" ignore Rubinius compiled files
set wildignore+=*.swp							" ignore vim backups
set wildignore+=*/node_modules/*	" ignore node_modules

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase	"make search case insensitive
set incsearch		"enable incremental search (search while typing)
set smartcase		"preserve case when replacing

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldcolumn=5
set foldlevelstart=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on			"show filetype
filetype plugin on
filetype indent on
set hidden			"allow switching buffers without saving files, keeps unsaved changes for later

autocmd FileType vim
	\ setlocal shiftwidth=2 |
	\ setlocal tabstop=2

autocmd FileType make
	\ setlocal tabstop=4 |
	\ setlocal noexpandtab

autocmd FileType markdown
	\ let b:coc_suggest_disable = 1 |
	\ set statusline+=%{wordcount().words}\ words


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startup stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" noremap <Up> gk
" noremap <Down> gj
" inoremap <Up> <C-o>gk
" inoremap <Down> <C-o>gj

let mapleader = ","

" folding
"		z1		set folding level to 1
"		z2		set folding level to 2
"		za		toggle a fold (vim default)
"		z0		open all folds
noremap <Leader>z1 :setlocal foldlevel=1 <Enter>
noremap <Leader>z2 :setlocal foldlevel=2 <Enter>
noremap <Leader>z0 :setlocal foldlevel=1000 <Enter> " open all folds


" Misc
"		h			remove search highlight
"		stw		remove trailing whitespace in current buffer
"		w			write buffer
"		nt		open NERDTree
"		tb		open terminal at the bottom
"		bcp		close buffer and go to previously opened one
"		bco		close buffers exceot for current one
"		bb		open CtrlP in buffers mode
nnoremap <Leader>h :nohl <Enter>
nnoremap <leader>stw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <Leader>w :w <Enter>
nnoremap <Leader>nt :NERDTree <Enter>
nnoremap <Leader>tb :botright terminal <Enter>
nnoremap <Leader>bcp :bprevious<BAR>bdelete#<Enter>
nnoremap <Leader>bco :CloseOtherBuffers <Enter>
nnoremap <Leader>bb :CtrlPBuffer <Enter>

"<Enter> indentation in visual mode
vmap < <gv
vmap > >gv

" make backspace behave normally
set backspace=indent,eol,start

" enable mouse in all modes
set mouse=a
