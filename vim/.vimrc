set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'elzr/vim-json'
Plug 'davidhalter/jedi-vim'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'justmao945/vim-clang'
Plug 'benmills/vimux'
Plug 'julienr/vim-cellmode'
Plug 'kovisoft/slimv'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/csv.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'chr4/nginx.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

set number
colorscheme slate

" " YouCompleteMe setup
" let g:ycm_python_binary_path = 'python3'
" "" turn on completion in comments
" let g:ycm_complete_in_comments=1
" "" load ycm conf by default
" let g:ycm_confirm_extra_conf=0
" "" turn on tag completion
" let g:ycm_collect_identifiers_from_tags_files=1
" "" only show completion as a list instead of a sub-window
" set completeopt-=preview
" "" start completion from the first character
" let g:ycm_min_num_of_chars_for_completion=1
" "" don't cache completion items
" let g:ycm_cache_omnifunc=0
" "" complete syntax keywords
" let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_autoclose_preview_window_after_completion=1
" "" file exclusion
" let g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }
" "" debug
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'

" Powerline setup
set guifont=Hack-Regular
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
set laststatus=2

" toggle rainbow_parentheses
let g:lisp_rainbow=1

let g:C_UseTool_cmake = 'yes'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions

" Python
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Go-Vim
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" Vim-clang
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" Vim-CellMode
let g:cellmode_tmux_sessionname='' " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='1'
let g:cellmode_use_tmux=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" Airline
let g:airline_powerline_fonts = 1

" SimpylFold
let g:SimpylFold_fold_import = 0
let g:SimpylFold_doctring_preview = 1

" Custom Vim
let mapleader="\\"
set relativenumber
set path+=**
set wildmenu
packadd! matchit
set hidden
set clipboard=unnamed
set pastetoggle=<f5>
set ignorecase
set smartcase
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" visual start
" xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
" function! s:VSetSearch()
" 	let temp = @s
" 	norm! gv"sy
" 	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
" 	let @s = temp
" endfunction

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap jk <esc>
inoremap <esc> <nop>

autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal foldmethod=syntax
autocmd FileType crontab setlocal nowritebackup

" undos
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
nnoremap <F5> :MundoToggle<CR>
