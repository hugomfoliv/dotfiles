syntax on

set encoding=utf-8
set hlsearch
set hidden
set cursorline
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set relativenumber
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set termguicolors
set omnifunc=syntaxcomplete#Complete

call plug#begin('~/.vim/plugged')

	Plug 'morhetz/gruvbox'
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tpope/vim-eunuch'
	Plug 'jremmen/vim-ripgrep'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'airblade/vim-gitgutter'
	Plug 'haya14busa/is.vim'
	Plug 'machakann/vim-highlightedyank'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-utils/vim-man'
	Plug 'kien/ctrlp.vim'
	Plug 'mbbill/undotree'
	Plug 'frazrepo/vim-rainbow'
	Plug 'vim-syntastic/syntastic'
	Plug 'lifepillar/vim-mucomplete'
	Plug 'stephpy/vim-yaml'
	Plug 'jvirtanen/vim-hcl'
	Plug 'ekalinin/dockerfile.vim'
	Plug 'prettier/vim-prettier'
	Plug 'osyo-manga/vim-anzu'
	Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1

let g:airline_theme='powerlineish'

" ntpeters/vim-better-whitespace
let g:strip_whitespace_on_save=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" MUcomplete
set completeopt+=menuone

" Ruby
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_ruby_rubocop_exec='/usr/local/bin/cookstyle'

" Prettier
let g:prettier#autoformat = 1

" Anzu
" mapping
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}

" is-vim
map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)

" NERDTRee
let g:NERDTreeWinSize=40
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
