set rtp+=/Users/jjones/src/go/misc/vim
filetype plugin indent on
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set sts=4
set showmatch
set ruler
set expandtab
set hidden
let Tlist_Ctags_Cmd='/usr/bin/ctags-exuberant'

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

    autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

au BufNewFile,BufRead *.ns set filetype=tcl

call pathogen#infect('~/src/dotfiles/vimplugs')
Helptags




" color torte
" Solarize
set background=dark
colorscheme solarized

