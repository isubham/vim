" use this command to set location of your vim config
" vim -u ./path/to/your/vimrcfile

set number
" set relativenumber
syntax on

"enable mouse support"
set mouse=a

"highlight current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

"enable highlight search pattern"
set hlsearch
set incsearch

" use system clipboard
set clipboard=unnamedplus
vnoremap <C-c> "+y
vnoremap <C-p> "+p

" smartcase search sensitivity"
set ignorecase
set smartcase

" indentation using spaces
" tabstop: width of tab character
" softtabstop: fine tunes the amount of whitepspaces to be added
" shiftwidth: determines the amount of whitspaes to be add in normal mode
" expandtab; white on use space instead of tab
" textwidth: test wrap width
" autoindent: autointent in new line
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix

" cros platform settings
set nocompatible
set encoding=utf-8


" show the matching part of pairs [] {} ()
set showmatch

" splitting
set splitbelow splitright

" tab and switching
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprev<CR>
nnoremap <silent> tn :tabnew<CR>

colorscheme elflord

" status bar
set laststatus=2

" package management
" reference
" - https://www.linode.com/docs/guides/introduction-to-vim-customization/
" - https://www.youtube.com/watch?v=zE0hno3vV9M
"
"   Run this to install plugged
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Git Error
" https://stackoverflow.com/questions/32232655/go-get-results-in-terminal-prompts-disabled-error-for-github-private-repo
" git config --global --add url."git@github.com:".insteadOf "https://github.com/"

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-gitgutter'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

" Coc Settings
" ===============================================
"
" Reference https://github.com/neoclide/coc.nvim
"


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc select the suggestion
" https://stackoverflow.com/questions/65387663/how-to-remap-coc-vim-autocomplete-key
" selection on tab key
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"





" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


