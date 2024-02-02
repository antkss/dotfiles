"NERDTree plugin 
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" nerdtree hightlight and icons

Plug 'neovim/nvim-lsp' " nvim-lsp

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'ryanoasis/vim-devicons'
" save and restore nerdtree state between sessions
"Git status flag
Plug 'Xuyuanp/nerdtree-git-plugin'
"vim plugin for go language
" Plug 'fatih/vim-go', { 'tag': '*' }
"COC VIM
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Vim theme 
"Plug 'folke/tokyonight.nvim'
" Plug 'morhetz/gruvbox'
"find and replace
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-pack/nvim-spectre'
" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" debug plugin "
Plug 'puremourning/vimspector'
"comment plugin
Plug 'numToStr/Comment.nvim'
"chatgpt plugin 
" Plug 'nvim-lua/plenary.nvim'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'dpayne/CodeGPT.nvim'
Plug 'joshdick/onedark.vim'
call plug#end()
" Plug 'mfussenegger/nvim-dap'
" Plug 'puremourning/vimspector'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`. call plug#end()
" set background=dark
syntax on
colorscheme onedark  
"colorscheme tokyonight-storm
"let g:lightline = {
"  \ 'colorscheme': 'onedark',
" \ }
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
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap \ :Files<CR>
set number


" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" nmap /\ :noh<CR>
" map the alt key to the esc key
inoremap <C-c> <Esc>
"airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" NERDTree hightlight configuration
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" auto close bracket setup 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
lua require('Comment').setup()
"debug configuration "

nnoremap <S-m> :call vimspector#Launch()<CR>
nnoremap <S-c> :call vimspector#Continue()<CR>

nnoremap <S-b> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <S-d> :call vimspector#ClearBreakpoints()<CR>

nmap <C-S-r> <Plug>VimspectorRestart
nmap <S-o> <Plug>VimspectorStepOut
nmap <S-i> <Plug>VimspectorStepInto
nmap <S-n> <Plug>VimspectorStepOver
nnoremap <S-e> :call vimspector#Reset( { 'interactive': v:false } )<CR>
" Set the basic sizes

" let g:vimspector_code_minwidth = 90
" let g:vimspector_code_height = 90
" let g:vimspector_terminal_maxwidth = 40
" let g:vimspector_terminal_minwidth = 0


