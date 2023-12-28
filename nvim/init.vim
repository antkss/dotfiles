call plug#begin('/home/as/.config/nvim/plugged')
"NERDTree plugin 
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" nerdtree hightlight and icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" save and restore nerdtree state between sessions
"Git status flag
Plug 'Xuyuanp/nerdtree-git-plugin'
" Using a non-default branch

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
"COC VIM
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using npm
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
"Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Vim theme 
Plug 'morhetz/gruvbox'
"find and replace
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-pack/nvim-spectre'
" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"comment plugin
Plug 'numToStr/Comment.nvim'
"chatgpt plugin 
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

Plug 'dpayne/CodeGPT.nvim'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
set background=dark
colorscheme gruvbox
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"use enter key to comfirm completion
inoremap <expr> <return> coc#pum#visible() ? coc#pum#confirm() : "\<RETURN>"
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" There are also colorschemes for the different styles.
" NERDTreeToggle configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap ; :Files<CR>

" NERDTree hightlight configuration
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
set number
lua require('Comment').setup()

