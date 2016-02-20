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

let mapleader = ","

set laststatus=2 " Always show status line
set nowrap 
set lbr " Break in sensible places, not mid-word
set nu "Turn on line numbering

" Activate wrapping and spell check for text files
autocmd BufNewFile,BufRead *.txt,*.md set wrap
autocmd BufNewFile,BufRead *.txt,*.md setlocal spell spelllang=en_au

set history=1000
set hidden

set guioptions-=rLT
set guifont=Menlo\ Regular:h14

noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>m :!open -a Marked\ 2 %<CR>

" Font bigger/smaller adjustment; only works on OS X
nmap <F12>   :macaction fontSizeUp:<CR>
nmap <S-F12> :macaction fontSizeDown:<CR>

" Timestamps
nnoremap <F3> "=strftime("%FT%T")<CR>P
inoremap <F3> <C-R>=strftime("%FT%T")<CR>

inoremap ,[ [ ] 

" Tell VimWiki where to find content, and to use markdown
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]

" Configure the gnupg plugin
let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["simon@brown.direct"]

" Jekyll plugin configuration
let g:jekyll_post_extension = '.md'


" Content from Damian Conway http://is.gn/IBV2013
"====[ Improved search behaviour ]====================
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used
set hlsearch        "Highlight all matches

" But match highlighting drives Simon mad
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
