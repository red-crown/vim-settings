" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

" syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\\\\\\\\ %<%.99f\\\\\\\\ %h%w%m%r%y\\\\\\\\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\\\\\\\\ %l,%c-%v\\\\\\\\ %)%P

" Or use vividchalk
if has("gui_running")
  " colorscheme solarized 
  " set background=light

  " colorscheme topfunky-light 
  colorscheme nazca 
else
  " colorscheme elflord
  syntax on
  set background=dark
  " set t_Co=256
  color mango

endif

set guioptions=aAce               " Get rid of macvim toolbar
set guifont=Inconsolata:h15
" set font=Monoco:h12

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
set foldenable
" set foldmethod=syntax

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec


"Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>
nmap ,gv :tabedit $MYGVIMRC<cr>

"Faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
    \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>' 

"Map escape key to jk -- much faster
imap jk <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <M-Up> ddkP
nmap <M-Down> ddp
"Bubble multiple lines
vmap <M-Up> xkP`[V`]
vmap <M-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc  source $MYVIMRC
  autocmd bufwritepost .gvimrc source $MYGVIMRC 
endif

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


"Shortcut for NERDTreeToggle
nmap <silent> ,nt :NERDTreeTabsToggle<cr>

"Show hidden files in NerdTree
let NERDTreeShowHidden=0

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTreeToggle
autocmd vimenter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p

" au BufNewFile,BufRead *.less set filetype=less
" shortcut to convert less to css file
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Buffergator
" nmap <silent> ,ls :BuffergatorOpen<cr>
" nmap <silent> ,lc :BuffergatorClose<cr>


" Better Filetype Switching
nmap <silent> ,ht :set filetype=phtml<cr>
nmap <silent> ,pt :set filetype=php<cr>

" EasyMotion key mapping
" nmap <silent> ,w :call EasyMotionWB()<CR>

set vb


"toggle highlighted searching
nnoremap <silent> <C-u> :nohl<CR><C-l>

"CoffeeScript
" au BufWritePost *.coffee silent CoffeeMake!

let g:EasyMotion_leader_key = '<Leader>' 

"Markdown
nmap <Leader>md ! Markdown.pl<cr>
vmap <Leader>md ! Markdown.pl<cr>

"Html indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
