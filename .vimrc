" Allow extensions made to Vi by Vim
set nocompatible

" Use syntax-based color highlighting
syntax on

" Enable plugins based on file type including indentation
filetype plugin indent on

" Enable hybrid line numbers
set number relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Take care of tabs / spaces
filetype plugin indent on
filetype indent on
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" Turn off wrapping
set nowrap

" Sets wrapping for certain types of files based on extension
autocmd BufRead,BufNewFile *.txt setlocal wrap linebreak
autocmd BufRead,BufNewFile *.md setlocal wrap linebreak

" Enable 256-color mode
set t_Co=256

" Add ruler on bottom
set laststatus=2
set ruler

" Show matching brackets and parens
set showmatch

" Turn off automatic backup files
set nobackup
set nowritebackup

" Default character encoding
set encoding=utf-8

" Highlight all search hits
set hlsearch
	
" Map keyboard commands
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Don't save colorscheme and fontsize in the session
set sessionoptions-=options
