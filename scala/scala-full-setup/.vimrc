set bg=dark
autocmd ColorScheme * highlight TabLineSel ctermfg=Yellow ctermbg=Black

" Timeouts
set notimeout
set ttimeout
set ttimeoutlen=10
set timeoutlen=500

" GENERAL SETTINGS
let mapleader=" "
set ts=2 sts=2 sw=2 expandtab
set ai ci
set nowrap
set nowb
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set scrolloff=8
set signcolumn=number
set rnu nu
set hidden
set smartcase
set ignorecase
set nocompatible
set wildmenu
set wildignorecase
set wildignore=\*.git/\*
set wildmode=longest:full,full
set complete=.,w,b,u,t
set completeopt=longest,menuone
set foldmethod=syntax foldlevel=10
set splitbelow splitright
set nrformats+=alpha
set lazyredraw
set showmatch
set noshowcmd
set vb
set t_vb=
set shortmess=atIsc
set ru
set clipboard=unnamed
set wildchar=<Tab> wildmenu wildmode=full
set colorcolumn=+1
set encoding=utf-8
set guioptions=-e
set sessionoptions+=tabpages,globals

set statusline=%#Search#\ %{expand('%:t')}\ %m%r\ %#DiffChange#\ %{FugitiveStatusline()}\ %#LineNr#%=%<%l,%c%V\ %P\ [%{&ff}]\ %y\ (%{strftime(\"%m/%d\ %H:%M\",getftime(expand(\"%:p\")))})\ 
" DEFAULT STATUSLINE
" set statusline=%f%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

syntax enable
filetype plugin on
filetype plugin indent on
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

let g:statusline_active = "%#Search#\ %{expand('%:t')}\ %m%r\ %#DiffChange#\ %{FugitiveStatusline()}\ %#LineNr#%=%<%l,%c%V\ %P\ [%{&ff}]\ %y\ (%{strftime(\"%m/%d\ %H:%M\",getftime(expand(\"%:p\")))})\ "
let g:statusline_inactive = "\ %{expand('%:t')}\ %m%r\ %#DiffChange#\ %#LineNr#%=%<%l,%c%V\ %P\ "
augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!statusline_active
    autocmd WinLeave,BufLeave * setlocal statusline=%!statusline_inactive
augroup end

au FocusGained,BufEnter * :checktime
au InsertLeave * silent! set nopaste

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType yaml setlocal foldmethod=indent
au FileType yml setlocal foldmethod=indent
au FileType make setl noexpandtab

" NETRW
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_preview=1

augroup netrw_mappings
  au!
  au filetype netrw call NetrwMappings()
augroup END

" KEY UNMAPPINGS
map <Space>tm <Nop>

" KEY MAPPINGS
nnoremap <silent><C-l> :wincmd l<CR>
nnoremap <silent><C-h> :wincmd h<CR>
nnoremap <silent><C-k> :wincmd k<CR>
nnoremap <silent><C-j> :wincmd j<CR>

" find and list buffers
nnoremap <leader>bf :b<Space>
nnoremap <leader>bl :buffers<CR>
nnoremap <silent>bk :bd<CR>
nnoremap <silent>bs :w!<CR>
nnoremap <silent><leader>cf :let @*=printf('file:%s:%d', expand('%:p') , line('.'))<CR>

" opens netrw to the right in the dir where you launch vim from
nnoremap <silent><leader>nl :30Lex!<CR>
" opens netrw to the right in the dir where the current buffer resides
nnoremap <silent><leader>ns :30Sex!<CR>

" Greatest paste remaps ever!!
nnoremap <silent><leader>p :set paste expandtab<CR>
vnoremap <silent><leader>p "_dP

" structure by replacing tabs by 2 spaces
nnoremap <silent><leader>st :%s/\t/  /g<CR>

" following unimpaired.vim's convention
nnoremap <silent>yoz :set rnu! nu! smd! ru!<CR>

" tabs
nnoremap <silent><leader>tc :tabclose<CR>
" mnemonic for factory hence f
nnoremap <silent><leader>tn :tabnew<CR>
nnoremap <silent><leader>to :tabonly<CR>
" sends the current pane into a different tab maintaining the pane in the current tab
" <C-w>T does the same thing but does not maintain the pane in the current tab
nnoremap <silent>ts :tab sp<CR>
nmap <silent><S-Tab> :tabprev<CR>
nmap <silent><Tab> :tabnext<CR>

" Reorient windows between vertical and horizontal
nnoremap <silent>tv <C-w>t<C-w>H
nnoremap <silent>th <C-w>t<C-w>K

nnoremap <silent>[wh :resize -5<CR>
nnoremap <silent>]wh :resize +5<CR>

nnoremap <silent>[wv :vertical resize -5<CR>
nnoremap <silent>]wv :vertical resize +5<CR>

" the ultimate find and replace
" to match whole word, surround it with \<word\>
" eg, :s/\<bar\>/baz
vnoremap - <ESC>:'<,'>s/\%V/gI<Left><Left><Left>

" the ultimate find
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" the ultimate surround
vnoremap + <ESC>:'<,'>s/\%V\(\w.*\)/"\1"<Left><Left><Left><Left>

" to retain visual selection upon indent/unindent
vnoremap > >gv
vnoremap < <gv

" change every backslash to forward slash and vice-versa in the current line
nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>

" Cycling through buffers
nnoremap <C-n> :execute ":buffer ".(bufnr("%") + 1)<CR>
nnoremap <C-p> :execute ":buffer ".(bufnr("%") - 1)<CR>

" ins-completion
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

" presentation mode - source .vimrc to undo
nnoremap <silent><F5> :set nornu nonu nosmd nohid noru signcolumn=no colorcolumn=<CR>

" FUNCTIONS
fun! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfun

fun! NetrwMappings()
  nnoremap <silent><buffer><C-l> :wincmd l<CR>
endfun

