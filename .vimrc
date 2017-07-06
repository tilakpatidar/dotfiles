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
" Plugin 'Valloric/YouCompleteMe'

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
"set background=light

" Uncomment the next line if your terminal is not configured for solarized
let g:solarized_termcolors=256

" Set the colorscheme
colorscheme codeschool

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
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1



" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
"nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Show hidden files in NerdTree
"let NERDTreeShowHidden=1

" CTRL-p show hidden files
let g:ctrlp_show_hidden = 1

" Ctrl Right next tab
map <C-Right> :tabNext<CR>
noremap <C-Right> :tabNext<CR>
inoremap <C-Right> :tabNext<CR>
cnoremap <C-Right> :tabNext<CR>

" CTRL-Left is previous tab
noremap <C-Left> :<C-U>tabprevious<CR>
inoremap <C-Left> <C-\><C-N>:tabprevious<CR>
cnoremap <C-Left> <C-C>:tabprevious<CR>

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
map <C-?> :TComment<CR>

" ------- YouCompeleteMe shortcut ---"
" map <C-]> :YcmCompleter GoToImprecise<CR>

" --- Font settings --- "
set guifont=Hack\ 12

" --- Cursor settings --- "
highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=steelblue
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
"set shell=/bin/zsh

" ---- set gvim behaviour to mswin for ctrl-c/v copy pasting --- "
source $VIMRUNTIME/mswin.vim
behave mswin

" --- vim-javascript config --- "
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" CtrlP file search shortcut
map <C-Space> :CtrlP<CR>

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


" ---- set different cursor shapes for gnome-terminal ---- "
"  http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape underline"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif
