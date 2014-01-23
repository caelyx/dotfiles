" Yet another .vimrc, this one by Simon Brown (caelyx) <projects@caelyx.net>

color molokai
let mapleader = ","
set history=1000
set hidden
set guioptions-=rL
set guifont=Menlo\ Regular:h14
set nolist


" Font bigger/smaller adjustment; only works on OS X
nmap <F12>   :macaction fontSizeUp:<CR>
nmap <S-F12> :macaction fontSizeDown:<CR>


" TextMate style parenthesis, etc matching 
" From http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
autocmd Syntax html,vim inoremap < <lt>><Left>
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
function! QuoteDelim(char)
let line = getline('.')
let col = col('.')
if line[col - 2] == "\\"
"Inserting a quoted quotation mark into the string
return a:char
elseif line[col - 1] == a:char
"Escaping out of the string
return "\<Right>"
else
"Starting a string
return a:char.a:char."\<Left>"
endif
endf 
inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>
"vnoremap (  <ESC>`>a)<ESC>`<i(<ESC>
"vnoremap )  <ESC>`>a)<ESC>`<i(<ESC>
"vnoremap {  <ESC>`>a}<ESC>`<i{<ESC>
"vnoremap }  <ESC>`>a}<ESC>`<i{<ESC>
"vnoremap "  <ESC>`>a"<ESC>`<i"<ESC>
"vnoremap '  <ESC>`>a'<ESC>`<i'<ESC>
"vnoremap `  <ESC>`>a`<ESC>`<i`<ESC>
"vnoremap [  <ESC>`>a]<ESC>`<i[<ESC>
"vnoremap ]  <ESC>`>a]<ESC>`<i[<ESC>
function! InAnEmptyPair()
let cur = strpart(getline('.'),getpos('.')[2]-2,2)
for pair in (split(&matchpairs,',') + ['":"',"':'"])
if cur == join(split(pair,':'),'')
return 1
endif
endfor
return 0
endfunc
func! DeleteEmptyPairs()
if InAnEmptyPair()
return "\<Left>\<Del>\<Del>"
else
return "\<BS>"
endif
endfunc
inoremap <expr> <BS> DeleteEmptyPairs()

nnoremap <F3> "=strftime("%FT%T")<CR>P
inoremap <F3> <C-R>=strftime("%FT%T")<CR>
set guioptions-=T

call pathogen#infect()

autocmd BufNewFile,BufRead *.md,*.textile set filetype=octopress

