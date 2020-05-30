""=================================================================



let g:python_highlight_all = 1


"autocmd BufWritePost *.py call Flake8()
let g:PyFlakeOnWrite = 1 "Auto-check file for errors on write
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes' "List of checkers used
let 
" ~~~~~~~~~~~~~~~~~~~~~~~
colorscheme snazzy
let g:SnazzyTransparent = 1
" set background=dark
set background=dark
set laststatus=2
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
""=================================================================
" ~~~~~~~~~~~~~~~
" -- shortcut -- 
" ~~~~~~~~~~~~~~~
" -- others -- "
map <space>rc :e ~/.config/nvim/init.vim<CR>
map <space>rs :e ~/.config/nvim/tmp/backup<CR>
map ` <nop>
map ; :
map q; q:
map s <nop>
map r <nop>
map t <nop>
noremap . <nop>
map R :source $MYVIMRC<CR>
noremap < <<
noremap > >>
noremap Y y$
nnoremap sa %d%

" -- search -- "
noremap <space><CR> :nohlsearch<CR>
noremap - nzz
noremap = Nzz
noremap ss :%s/
noremap sv :s/
noremap <space>ss :%s/<C-R>=expand("<cword>")<CR>/
noremap <space>sv :s/<C-R>=expand("<cword>")<CR>/
" -- bar -- "
inoremap <c-c> <c-o>zz
nnoremap <c-c> zz
" -- change
nnoremap U ~
" -- spell -- "
noremap sf :set spell!<CR>
noremap sc <nop>
inoremap <c-s> <c-x>s
nnoremap <c-s> hea<C-X>s
" -- normal -- "
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap <s-h> <home>
nnoremap <s-l> <end>
nnoremap <s-k> 5k
nnoremap <s-j> 5j
nnoremap <s-w> 5w
nnoremap <s-b> 5b
nnoremap <up> kzz
nnoremap <down> jzz
" -- insert --"
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-k> <up>
inoremap <c-j> <down>
" -- command line -- "
cnoremap <c-k> <up>
cnoremap <c-j> <down>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
" -- terminal --"

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

noremap t/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

nnoremap t <nop>
nnoremap T :te<CR>
tnoremap <tab> <c-\><c-n>
tnoremap <s-tab> <c-\><c-n>:bd!<CR>

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
"=================================================================
" ~~~~~~~~~~~~
" -- search --
" ~~~~~~~~~~~~
set hlsearch
exec"nohlsearch"
set incsearch
set ignorecase
set smartcase

"=================================================================
" ~~~~~~~~~~~
" -- split --
" ~~~~~~~~~~~
" -- split -- "
map sh :vsplit<CR>
map sl :vsplit<CR><c-w>l
map sk :split<CR>
map sj :split<CR><c-w>j
" -- move -- "
map <space>h <c-w>h
map <space>l <c-w>l
map <space>k <c-w>k
map <space>j <c-w>j
map <space>w <c-w>r
" -- roate-- "
map srv <c-w>t<c-w>H
map srh <c-w>t<c-w>K
" -- size -- "
map rl :vertical resize +1<CR>
map rh :vertical resize -1<CR>
map rk :res +1<CR>
map rj :res -1<CR>
"=================================================================
" ~~~~~~~~~~~
" -- tab --
" ~~~~~~~~~~~
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
map tmh :-tabmove<CR>
map tml :+tabmove<CR>
"=================================================================
" ~~~~~~~~~~~
" -- buffer --
" ~~~~~~~~~~~
map zh :bprevious<CR>
map zl :bnext<CR>
map sb :bd!<CR>
"=================================================================
map <space>r :r !
map <space>e :e 
"=================================================================

nnoremap sg :r !figlet 
nnoremap <space>rr :r !
nnoremap <space>/ :!


set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
tnoremap <left> <c-\><c-n> :bprevious<CR>
nnoremap <right> :bnext<CR>
nnoremap <left> <nop>

""let g:syntastic_ignore_files=[".*\.py$"]
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"set noundofile
"set nobackup
