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
set wrap " Wrap unless told not to - I mostly write text now
set lbr " Break in sensible places, not mid-word
set nu "Turn on line numbering

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
