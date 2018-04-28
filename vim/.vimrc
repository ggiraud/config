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
"Plug 'davidhalter/jedi-vim'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'justmao945/vim-clang'
Plug 'benmills/vimux'
Plug 'julienr/vim-cellmode'
Plug 'kovisoft/slimv'
Plug 'chrisbra/csv.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'terryma/vim-expand-region'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'mbbill/undotree'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'davisdude/vim-love-docs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lambdalisue/gina.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-obsession'
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

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
	exec "set <M-".toupper(c).">=\e".c
	exec "imap \e".c." <M-".toupper(c).">"
	let c = nr2char(1+char2nr(c))
endw

" lightline-ale
let g:lightline = {}
let g:lightline.component_expand = {
			\'linter_checking': 'lightline#ale#checking',
			\'linter_warnings': 'lightline#ale#warnings',
			\'linter_errors': 'lightline#ale#errors',
			\'linter_ok': 'lightline#ale#ok',
			\}
let g:lightline.component_type = {
			\'linter_checking': 'left',
			\'linter_warnings': 'warning',
			\'linter_errors': 'error',
			\'linter_ok': 'left',
			\}
let g:lightline.active = {
			\'right': [
			\[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
			\[ 'lineinfo' ],
			\[ 'percent' ],
			\[ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
			\]
			\}

" Tmuxline  setup
set laststatus=2
let g:tmuxline_powerline_separators = 0

" toggle rainbow_parentheses
let g:lisp_rainbow=1

let g:C_UseTool_cmake = 'yes'

" Enable omni completion.
set omnifunc=syntaxcomplete#Complete

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#ternjs#filetypes = [
			\ 'jsx',
			\ 'javascript.jsx',
			\ 'html'
			\ ]
autocmd FileType html set ft=html.javascript_tern

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

" ALE
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {
\	'json': ['fixjson'],
\	'javascript': ['eslint', 'prettier-eslint'],
\	'javascript.jsx': ['eslint', 'prettier-eslint']
\}

" SimpylFold
let g:SimpylFold_fold_import = 0
let g:SimpylFold_doctring_preview = 1

" Vim-JSX
let g:jsx_ext_required = 0

" Emmet
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx'
\  }
\}

" Prettier
autocmd FileType javascript set formatprg=prettier\ --stdin

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
let g:netrw_localrmdir='rm -r'
autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>
set tabstop=2
set shiftwidth=2

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
autocmd FileType javascript setlocal foldmethod=syntax
autocmd FileType crontab setlocal nowritebackup

" undos
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undo//
nnoremap <F5> :MundoToggle<CR>
" backups
set backupdir=~/.vim/backup//
" swaps
set directory=~/.vim/swp//
