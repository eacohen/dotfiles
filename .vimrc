""""""""""""""""""
" PLUGIN MANAGER "
""""""""""""""""""

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" Colorschemes "
Plug 'danilo-augusto/vim-afterglow'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'

" Terraform highlighting + formatting
Plug 'https://github.com/hashivim/vim-terraform.git'
" Jenkinsfile highlighting
Plug 'martinda/Jenkinsfile-vim-syntax'
" Powershell highlighting
Plug 'PProvost/vim-ps1'
" Golang stuff
"Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }

" Better status line
Plug 'itchyny/lightline.vim'

" Directory tree
Plug 'scrooloose/nerdtree'

" Integrate window navigation with tmux
Plug 'christoomey/vim-tmux-navigator'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""
" KEY REMAPS "
""""""""""""""

" Set the leader
noremap <Space> <Nop>
let mapleader = " "

" Don't time out on remaps
set notimeout
" ...but still time out for key codes
" (prevents esc from hanging forever)
set ttimeout
" Make keycode timeouts as quick as possible
" (makes esc quicker)
set ttimeoutlen=0

" Make it easier to go to beginning/end of line. H and L are kinda useless
noremap H ^
noremap L $

" Map J and K to quick scroll
nnoremap <silent> J <C-e>:redraw<CR><C-e>
nnoremap <silent> K <C-y>:redraw<CR><C-y>
" Replace old J and K
nnoremap M J
nnoremap <leader>k K

" Turn off search highlight (give back <space>)
nnoremap <leader><space> :nohlsearch<CR>
" Open .vimrc in split (so you can add/+ to it)
nnoremap <leader>+ :sp $MYVIMRC<CR>
" Toggle <$>pell
nnoremap <leader>$ :set spell!<CR>
" Le<t>'s see the nerd<t>ree!
nnoremap <leader>t :NERDTreeToggle<CR>:wincmd p<CR>
" <T>o nerd<t>ree!!!
nnoremap <leader>T :NERDTreeFocus<CR>

""""""""""""""""""
" PLUGIN OPTIONS "
""""""""""""""""""

" vim-terraform "

" *.tf files are automatically formatted on save
let g:terraform_fmt_on_save=1

" lightline "

" Helps with enabling
set laststatus=2
" Don't show old line
set noshowmode

" nerdtree "
" load nerdtree automatically but go editing window
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p
" close vim if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""
" BASICS "
""""""""""

"Ignore junk files
set wildignore+=*.o,*.obj,*.class,*.swp,*.pyc

" IN SYSTEM VIMRC Allow hidden buffers
"   set hidden

" IN SYSTEM VIMRC Enabling filetype support provides filetype-specific indenting,
"   syntax highlighting, omni-completion and other useful settings.
"   filetype plugin indent on

" Minimal automatic indenting for any filetype.
set autoindent
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
"backspace removes in tabs
set softtabstop=2

" Highlight all search matches
set hlsearch

" Set minimum lines above/below cursor
set scrolloff=5

" Graphical menu for tab completion
set wildmenu
" Initially unix-like completion, then vim default
set wildmode=longest:full,full

"Change directory to currently open file
set autochdir

"Don't redraw while running macros (faster)
set lazyredraw

" Only used for xterm but whatever
set title

" Allow better colors
if !has('gui_running')
  set t_Co=256
endif

" Fix memory leak with matching
autocmd BufWinLeave * call clearmatches()

""""""""""""""""
" CUSTOM STUFF "
""""""""""""""""
" Colorscheme
set background=dark
colorscheme PaperColor

" Only wrap on 'good' characters for wrapping
set linebreak
" Change break style
set showbreak=\ ↪

" Make split bar look better
set fillchars+=vert:│

" CursorLine is visible
" set cursorline
" hi clear CursorLine
" hi CursorLine ctermfg=NONE ctermbg=234

" Turn on (relative) line numbers
set number relativenumber
" Line number style
hi LineNr ctermfg=244 ctermbg=236
hi CursorLineNr ctermfg=226 ctermbg=240

" Show trailing whitespace
highlight TrailingWhitespace ctermbg=52
match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

" Set misspelled words styling
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=yellow ctermbg=NONE

""""""""""""""
" MISC FIXES "
""""""""""""""

" Ruby files are slow with new engine
set regexpengine=1

" Turn on tabs for rego files
autocmd FileType rego setlocal noexpandtab 
autocmd FileType rego set syntax=conf
