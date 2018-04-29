" File: .vimrc
" Author: Tilak Patidar <tilakpatidar@gmail.com>
"

" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
" ---  Enable for gnome-terminal not working for iterm2 ---- "
Plugin 'KevinGoodsell/vim-csexact'
" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'szw/vim-maximizer'
Plugin 'matze/vim-move'
Plugin 'terryma/vim-expand-region'
" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" --- Working with markdown files -------------------------------------
Plugin 'shime/vim-livedown'
Bundle 'gabrielelana/vim-markdown'
" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'

" ----- Autcomplete --- "
Plugin 'Shougo/neocomplete.vim'

"------ Javascript ----------------------------------
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'claco/jasmine.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lfilho/cosco.vim'

" --- Intellij Style multi cursor --- 
Plugin 'terryma/vim-multiple-cursors'
" --- CodeCompletion ---
Plugin 'Valloric/YouCompleteMe'

" --- Commenting "
Plugin 'tomtom/tlib_vim'
Plugin 'tomtom/tcomment_vim'

" ---- CSV Tabulation --- "
Plugin 'godlygeek/tabular'

" ----- Auto close HTML tags ----"
Plugin 'HTML-AutoCloseTag'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-liquid'
Plugin 'cakebaker/scss-syntax.vim'

" ----- Vimsession restore and save plugin ---- "
Plugin 'xolox/vim-session'

" ----- Code Snippets ---- "
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" ----- Highlight indentations --- "
Plugin 'Yggdroot/indentLine'

" --- Text objects for vim expand region --- "
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
syntax on


set mouse=a

" Required to get theme colors working
set t_Co=256
" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
let g:solarized_termcolors=256

" Set the colorscheme
" --- set gvim vs vim config ---- "
if has('gui_running')
  colorscheme PaperColor
else
  colorscheme PaperColor
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
endif

" Search highlight color
hi Search guibg=peru guifg=wheat

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1



" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
" nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Show hidden files in NerdTree
"let NERDTreeShowHidden=1

" CTRL-p show hidden files
let g:ctrlp_show_hidden = 1

" Ctrl ] next tab
map <C-S-]> :tabNext<CR>
noremap <C-S-]> :tabNext<CR>
inoremap <C-S-]> :tabNext<CR>
cnoremap <C-S-]> :tabNext<CR>

" CTRL [ is previous tab
noremap <C-S-[> :tabprevious<CR>
inoremap <C-S-[> :tabprevious<CR>
cnoremap <C-S-[> :tabprevious<CR>

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>
" ----- nerdtree-git-plugin ---- "
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
"
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ------ Set undo shortcut --- "
map <C-u> :u<CR>

" ------- TComment shortcut --- "
map <C-/> :TComment<CR>

" ------- YouCompeleteMe shortcut ---"
" map <C-]> :YcmCompleter GoToImprecise<CR>


" --- Cursor settings --- "
" highlight Cursor guifg=white guibg=white
" highlight iCursor guifg=white guibg=steelblue
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set guicursor=a:hor2-Cursor
set guicursor+=i:hor2-Cursor
set guicursor+=n:block-Cursor

" ---- Syntastic settings --- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---- Split keymaps ----
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Close tab
map <C-w> :tabclose<CR>
" ----- vim-move plugin --- "
let g:move_key_modifier = 'C'

" ---- set default shell ---- 
set shell=/bin/zsh

" ---- set gvim behaviour to mswin for ctrl-c/v copy pasting --- "
"  source $VIMRUNTIME/mswin.vim
"  behave mswin

" --- vim-javascript config --- "
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" --- import neocomplete --- "
source $HOME/.neocomplete.vim

" --- set line number highlight --- "
autocmd InsertEnter * set cul

" --- set gvim vs vim config ---- "
if has('gui_running')
  let g:airline_theme='base16_railscasts'
else
  let g:airline_theme='cool'
endif

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Enable autosave session
let g:session_autosave = 'prompt'
let g:session_autosave_periodic = 1
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" ---- Code snippets configuration ----
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ---- Eclim autocompletion with neocomplete ---- "
let g:EclimCompletionMethod = 'omnifunc'

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

" ---- GitGutter enable default ----- "
let g:gitgutter_enabled = 1

" ---- Remove preview window when option selected --- "
autocmd CompleteDone * pclose

" ----- Shortcut for code duplicate ---- "
nnoremap <C-d> yyp
vnoremap <C-d> y`>pgv

" --- Multi cursors config ---"
" to overide mswin selection behaviour "
" https://github.com/terryma/vim-multiple-cursors/issues/124
set selection=inclusive

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

set conceallevel=0

" --- Vim expand region shortcut --- "
map <C-Up> <Plug>(expand_region_expand)
map <C-Down> <Plug>(expand_region_shrink)

" --- Add copy paste shortcuts ---- "
map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" --- Avoiding the escape key"
:imap ii <Esc>

" -- Improve scrolling speed
" set lazyredraw
" set ttyfast

" -- Hide extra nerdtree 
autocmd VimEnter * call CloseExtraNERDTree()

" If vim is started with a file, simply show that file
" If vim is started with nothing or a directory close extra NERDTree buffer
function CloseExtraNERDTree()
  wincmd l " move to right pane
  let l:main_bufnr = bufnr('%')
  let l:fname = expand('%') " get name of current buffer
  if l:fname ==# 'NERD_tree_1'
    exe bufwinnr(l:main_bufnr) . "wincmd w"
    bd
  endif
endfunction
" --- Font settings --- "
set guifont=Fira\ Code:h17

" -- Disable python2 support -- "
let g:python_host_prog  = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 1

