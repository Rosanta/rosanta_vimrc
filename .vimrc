" git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim



if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" inoremap <expr> . MayComplete()
" func MayComplete()
"     if (can complete)
"       return ".\<C-X>\<C-O>"
"     endif
"     return '.'
" endfunc


" Rosanta Define 
filetype on
filetype plugin on
let mapleader=";"
" move cursor to the start of a line or end of a line 
nmap LB 0
nmap LE $
" intime search 
set incsearch
" ignore word case while searching 
set ignorecase
" vim cmd line complete 
set wildmenu
" syntax on 
syntax on 
" cursor line 
set cursorline
" enable mouse 
set mouse=a
" tab width
set shiftwidth=4
" show line number
set nu
"disable cursor blinking 
set gcr=a:block-blinkon0
" always show status bar
set laststatus=2
" show line numer
set ruler
" enable auto indent 
filetype indent on
" expand tab to blanks 
set expandtab
" tab lenth
set tabstop=4
" take 4 space as a tab
set softtabstop=4

set clipboard+=unnamed

set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp'
" Plugin 'othree/vim-autocomplpop'
Plugin 'ervandew/supertab'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'Shougo/vimproc.vim', {'do' : 'yes \| make'}
Plugin 'xolox/vim-shell'
Plugin 'chemzqm/vim-v2ex'
Plugin 'xolox/vim-misc'
Plugin 'luochen1990/rainbow'
call vundle#end()
filetype plugin indent on

color molokai 

if has("cscope") && filereadable("/usr/local/bin/cscope")
   set csprg=/usr/local/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
 

" ctrl-N to Tab
" function! CleverTab()
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"       return "\<Tab>"
"    else
"       return "\<C-N>"
"    endif
" endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>



"indent-guides settings 
"start indent_guides on vim startup
let g:indent_guides_enable_on_vim_startup=0
" visionable indent on level 2 
let g:indent_guides_start_level=2
" width of cursor
let g:indent_guides_size=1
"endof indent-guides settings

" autocomplete
"set tags+=/usr/include/sys.tags


" taglist 
"let Tlist_Ctags_Cmd = '/usr/bin/catgs'
"let Tlist_Ctags_Cmd = '/Users/xiaochen16/Downloads/ctags-5.8/ctags'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags2'
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
" let Tlist_Auto_Open = 1

"CtrlP configuration
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
map <s-p> :CtrlPTag<CR>

filetype off
filetype plugin indent on
