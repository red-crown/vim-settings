" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Monaco:h12            " Font family and font size.

" colorscheme railscasts
color emacs 
" set background=light

set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
" set transparency=0
" set background=light              " Background.
" set lines=25 columns=100          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar

if has("gui_macvim")
   macmenu &File.Print key=<nop>
   map <D-p> <Plug>PeepOpen
endif

