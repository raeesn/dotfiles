"BASIC CONFIGURATION
"##############################
set number
set nobackup
set nowritebackup
set noswapfile
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nohlsearch
set hidden
set incsearch
syntax on
set background=dark
set hidden

let mapleader = " "

"PLUGIN INSTALLATION
"##############################

call plug#begin('~/.config/nvim/autoload/plug.vim')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do': './install --all' }
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

Plug 'morhetz/gruvbox'

" Autocomplete
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

" Plug 'rust-lang/rust.vim'
"Plug 'chriskempson/base16-vim'

call plug#end()

" APPEARANCE
"##############################
"if !has('gui_running')
"  set t_Co=256
"endif
"if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
"  " screen does not (yet) support truecolor
"  set termguicolors
"endif
"let base16colorspace=256
" let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"
"colorscheme base16-gruvbox-dark-hard
"let g:gruvbox_(option) = '(value)'
colorscheme gruvbox
"hi Normal ctermbg=NONE
"call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" ADDITIONAL EDITOR CONFIGURATION 
"##############################
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

" LANGUAGE CUSTOMIZATION
"##############################
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
" note that if you are using Plug mapping you should not use `noremap` mappings.
"nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
"nmap <silent>K <Plug>(lcn-hover)
"nmap <silent> gd <Plug>(lcn-definition)
"nmap <silent> <F2> <Plug>(lcn-rename)

" JAVA
"<Plug>(coc-codeaction)              " line action
"nmap <silent> gd <Plug>(coc-definition) " definition
"nmap <silent> gr <Plug>(coc-references) " references
"nmap <silent> gt <Plug>(coc-type-definition) " type definition
"<Plug>(coc-rename)                  " rename
"<Plug>(coc-declaration)             " declaration
"<Plug>(coc-implementation)          " implementation
"nmap <silent> cf <Plug>(coc-format)  " format
"<Plug>(coc-fix-current)             " quickfix
"<Plug>(coc-codelens-action)         " code lens
"<Plug>(coc-diagnostic-next)         " next diagnostic
"<Plug>(coc-diagnostic-next-error)   " next error
":CocList diagnostics                " diagnostics
":CocList outline                    " search outline
":CocList -I symbols                 " references
":CocUpdate                          " update CoC
":CocDisable                         " disable CoC
":CocEnable                          " enable CoC
