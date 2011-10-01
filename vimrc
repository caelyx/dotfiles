" Yet another .vimrc, this one by Simon Brown (caelyx) <projects@caelyx.net>

" Syntax highlighint a must
syn on
" A nice readable non-default color scheme
colo evening

" SET commands
" Turn off the task menu
set guioptions-=T
" Turn off the menu bar
set guioptions-=m
" Turn of highlighting of searches
set nohls
" Use a semi-standard tab stop of 8 spaces
set ts=8
" Use a 4 character shift-width for indenting code
set sw=4
" Semi-intelligent smart indenting a must
set smartindent
" Default GUI font of Courier for when using GVIM
set gfn=Courier:h14    
" Wrapping sucks, turn it on specifically if you need it
set nowrap
" Show where I'm at at all times
set ruler

" AUTOCMD commands
" Get vim to play nicely with mutt
autocmd BufNewFile,BufRead mutt* set expandtab tw=72 sts=8 ts=8 shiftwidth=8
" Create a skeleton html file when opening a new one.
autocmd BufNewFile *.html | execute "normal :\<kEnter>i\<html>\<kEnter><head>\<kEnter><title>title</title>\<kEnter><script>\<kEnter></script>\<kEnter></head>\<kEnter><body>\<kEnter></body>\<kEnter></html>\<ESC>gg"

" MAP commands
" Use ,b to wordwrap lines to 78 characters
map ,b :s/\v^(.{,78} )/\1\r/<CR>:nohlsearch<CR> 

" Font Commands for GViM
:map <f9> :set guifont=Courier:h9:<Cr> 
:map <f11> :set guifont=Courier:h11<Cr> 
:map <S-f9> :set guifont=Courier_New:h9<Cr> 
:map <S-f11> :set guifont=Courier_New:h11<Cr> 
" Font bigger/smaller adjustment
nmap <F12>   :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<cr> 
nmap <S-F12> :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<cr>

" Comment adding commands for various languages
" 0. Clearing Comments
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR> 
" 1. LHS-only comment
map ,# :s/^/#/<CR>:nohlsearch<CR> 
map ,/ :s/^/\/\//<CR>:nohlsearch<CR> 
map ,> :s/^/> /<CR>:nohlsearch<CR> 
map ," :s/^/\"/<CR>:nohlsearch<CR> 
map ,% :s/^/%/<CR>:nohlsearch<CR> 
map ,! :s/^/!/<CR>:nohlsearch<CR> 
map ,; :s/^/;/<CR>:nohlsearch<CR> 
map ,- :s/^/--/<CR>:nohlsearch<CR> 
" 2. Wrapping Comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR> 
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR> 
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR> 
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>
