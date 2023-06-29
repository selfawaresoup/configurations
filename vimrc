"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" see https://github.com/junegunn/vim-plug for docs

" begin themes"
Plug 'ntk148v/vim-horizon'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'liuchengxu/space-vim-theme'

" begin rust
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" begin latex
Plug 'vim-latex/vim-latex'

" misc plugins
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim' "https://github.com/mattn/emmet-vim/blob/master/doc/emmet.txt
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  "enable VIM improvements
set modelines=5   "interpret 5 lines at bottom for modelines
set modeline      "enable vim modelines usage

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window/Tab related                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap and Backup related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup                  " create backups
set undofile                " undo feature (even between exits)
set writebackup             " write backup files
set swapfile                " create .swp files
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, ab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab			"don't convert tabs to spaces
set shiftwidth=2    "length for indentation
set tabstop=2       "length for tabs
set smarttab        "enable smart indetation
"set fdm=indent     "set indentation mode
set autoindent      "enable auto indentation

set textwidth=120
set breakindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color/display related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monaco:h14

set background=dark "what it says, duh!
color space_vim_theme "choose color scheme
let &t_Co=256       "tell vim that the terminal support 256 colors
set hls!            "highlight search hits
syntax enable       "enable syntax highlighting
set showmatch       "show matching braces/brackets/parens
" set number        "display line numbers
set relativenumber
set laststatus=2    "always show the status bar even if there's only one window

set cursorline
" set cursorcolumn

set scrolloff=8     " keep more context when scrolling off the end of a buffer

set list                    " show invisible characters
set listchars=tab:›\        " set tabulator character
set listchars+=trail:⋅      " set trailing whitespace character
"set listchars+=eol:¬       " set end-of-line character
set showbreak=↪             " the character to put to show a line has been wrapped

set colorcolumn=80
"highlight ColorColumn ctermbg=123 guibg=gray10 "colors for the colorcolumns

" fix the ugly bright foldcolumns of the slate color scheme
highlight FoldColumn ctermbg=Black ctermfg=Cyan

" fix the Pmenu colors to be more readable
highlight Pmenu ctermfg=LightGray ctermbg=DarkGray
highlight PmenuSel ctermfg=Black ctermbg=magenta

set showcmd                 " show command characters
set showmode                " show the current (paste) mode on the open buffer

set ttyfast                 " may improve scrolling performance

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%f       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                      " enable menu at the bottom
set wildmode=longest:full         " wildcard matches show a list, matching the longest first, try list:longest
set wildignore+=.git,.hg,.svn     " ignore version control repos
set wildignore+=*.pyc             " ignore Python compiled files
set wildignore+=*.rbc             " ignore Rubinius compiled files
set wildignore+=*.swp             " ignore vim backups
set wildignore+=*/node_modules/*  " ignore node_modules

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase  "make search case insensitive
set incsearch   "enable incremental search (search while typing)
set smartcase   "preserve case when replacing

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldcolumn=5
set foldlevelstart=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on     "show filetype
filetype plugin on
filetype indent on
set hidden      "allow switching buffers without saving files, keeps unsaved changes for later

autocmd FileType vim
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2

autocmd FileType make
  \ setlocal tabstop=4 |
  \ setlocal noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startup stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CloseOtherBuffers()
	" closes all buffers that are named and listed (should skip e.g. NERDTree)
	" only closes hidden buffers so the current one stays open
  let l:buffers = getbufinfo()
	for l:buf in buffers
		if buf.listed == 1 && buf.hidden == 1 && buf.name =~ '^\/'
			execute "bdelete " . buf.bufnr
		endif
	endfor
endfunction

:command CloseOtherBuffers call CloseOtherBuffers()

" automatically resize new terminal windows
autocmd TerminalWinOpen *
  \ if &buftype == 'terminal' |
  \   resize 10 |
  \ endif

" change default mode of CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" folding
"   z1    set folding level to 1
"   z2    set folding level to 2
"   za    toggle a fold (vim default)
"   z0    open all folds
noremap <Leader>z1 :setlocal foldlevel=1 <Enter>
noremap <Leader>z2 :setlocal foldlevel=2 <Enter>
noremap <Leader>z0 :setlocal foldlevel=1000 <Enter> " open all folds

" Coc bindings

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Misc
"   h     remove search highlight
"   stw   remove trailing whitespace in current buffer
"   w     write buffer
"   nt    open NERDTree
"   tb    open terminal at the bottom
"   bc    close buffer and go to previously opened one
"   bco   close buffers exceot for current one
nnoremap <Leader>h :nohl <Enter>
nnoremap <leader>stw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <Leader>w :w <Enter>
nnoremap <Leader>nt :NERDTree <Enter>
nnoremap <Leader>tb :botright terminal <Enter>
nnoremap <Leader>bcp :bprevious<BAR>bdelete#<Enter>
nnoremap <Leader>bco :CloseOtherBuffers  <Enter>

"<Enter> indentation in visual mode
vmap < <gv
vmap > >gv

" make backspace behave normally
set backspace=indent,eol,start

" enable mouse in all modes
set mouse=a
