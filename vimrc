" To use as-is, you will need:
" NERDtree file explorer - https://github.com/scrooloose/nerdtree
" Vividchalk colour theme - https://github.com/tpope/vim-vividchalk
" VimWiki - https://github.com/vimwiki/vimwiki.git 

execute pathogen#infect()

colo vividchalk

syntax on 
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

" TextMate style parenthesis, etc matching 
" From http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
autocmd Syntax html,vim inoremap < <lt>><Left>

" Tell VimWiki where to find content, and to use markdown
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]
