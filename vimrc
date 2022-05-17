" To use as-is, you will need:
" NERDtree file explorer - https://github.com/scrooloose/nerdtree
" Vividchalk colour theme - https://github.com/tpope/vim-vividchalk
" VimWiki - https://github.com/vimwiki/vimwiki
" GnuPG - https://github.com/jamessan/vim-gnupg
" Airline - https://github.com/vim-airline/vim-airline
" Jekyll plugin - https://github.com/parkr/vim-jekyll

execute pathogen#infect()

syntax on 
set background=dark
colo vividchalk

filetype plugin indent on

"activate omni completion
set omnifunc=syntaxcomplete#Complete

let mapleader = ","

" Set options {{{

set laststatus=2 " Always show status line

set nowrap 
set lbr " When we break, do it in sensible places, not mid-word

set nu  " Always on line numbering
set rnu " Relative line numbering 

" Text mode pedantry
set shiftwidth=4      " Shift-width is half a tab
set tabstop=8      " This is the default, but be explicit
set expandtab " Use spaces not tab characters


" Content from Damian Conway http://is.gn/IBV2013
"====[ Improved search behaviour ]====================
set incsearch       " Lookahead as search pattern is specified
set ignorecase      " Ignore case in all searches...
set smartcase       " ...unless uppercase letters used
set hlsearch        " Highlight all matches

set history=1000
set hidden
" }}}

" Key mappings {{{
"http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
nnoremap <silent><leader>r :set relativenumber!<cr> 
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>m :!open -a Marked\ 2 "%"<CR>
nnoremap <Leader>d :!open -a Deckset "%"<CR>
" @bob_koss https://twitter.com/bob_koss/status/254230953835253760
nnoremap <leader><leader> <c-^>
" Underline a headline in Markdown
nnoremap <leader>= yyp0v$r=
nnoremap <leader>- yyp0v$r-

" Move to next buffer
nnoremap <Leader>b :bn<CR>

" Yank selection to system clipboard https://twitter.com/dotvimrc/status/179570915749797888
vnoremap Y "*y

" Timestamps
nnoremap <F3> "=strftime("%F")<CR>P
inoremap <F3> <C-R>=strftime("%F")<CR>
inoremap <leader>r <C-R>=strftime("%F")<CR>
nnoremap <F4> "=strftime("%H:%M")<CR>P
inoremap <F4> <C-R>=strftime("%H:%M")<CR>
inoremap <leader>t <C-R>=strftime("%H:%M")<CR>

inoremap ,[ * [ ] 

" }}}

" Airline configuration {{{
let g:airline_section_y      =''
let g:airline_section_warning=''
let g:airline#extensions#tabline#enabled = 1
"AirlineToggleWhitespace
"}}}

" Text & Markdown files {{{
augroup filetype_txt 
    " Activate wrapping and spell check for text files
    autocmd BufNewFile,BufRead *.txt,*.md setlocal wrap
    autocmd BufNewFile,BufRead *.txt,*.md setlocal spell spelllang=en_au
    " Automatically write text files on Cmd-Tab or equiv
    autocmd FocusLost *.txt,*.md :write
    " Mark task done ('[ ] ' -> '[x] ') and move to the bottom of the file.
    " Overwrites mark 'a'
    autocmd BufNewFile,BufRead *.txt,*.md nnoremap <leader>x :<c-u>normal! k0majlrxddGp`aj<cr>
augroup END "}}}

" Tell VimWiki where to find content, and to use markdown
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]

" Todo list mapping
nnoremap <Leader>tt :VimwikiToggleListItem<CR>

" Configure the gnupg plugin
let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["s@sbrown.io"]

" Jekyll plugin configuration
let g:jekyll_post_extension = '.md'

" Disable match highlighting 
noremap <Leader>h :nohls<CR> 

"====[ Swap : and ; to make colon commands easier to type ]======
nnoremap  ;  : 

"====[ Open any file with a pre-existing swapfile in readonly mode "]=========
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echomsg ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 2
augroup END
" END content from DC.

" Learn Vimscript the Hard Way http://learnvimscriptthehardway.stevelosh.com/
inoremap jk <esc> 

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" cin( changes content inside next set of ()
onoremap in( :<c-u>normal! f(vi(<cr>

iabbrev @@    s@sbrown.io
iabbrev zsig    --<cr>Simon Brown<cr>s@sbrown.io<cr>5A53 7D24 711F 8AA2 6366  242B 1F3F 596C 3CB2 09F0
iabbrev THe     The
