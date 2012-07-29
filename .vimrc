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

" omni complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Find ctags (only checking /usr/bin and /usr/local)
function! FindCtags()
    if filereadable("/usr/local/bin/ctags")
        return "/usr/local/bin/ctags"
    elseif filereadable("/usr/bin/ctags")
        return "/usr/bin/ctags"
    endif
endfunction

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

" TagList
let Tlist_Ctags_Cmd=FindCtags()
map T :TlistToggle<cr>

color torte
" Solarize
"set background=dark
"colorscheme solarized

" powerline
set t_Co=256
set laststatus=2
let g:Powerline_symbols = 'unicode'

" python mode
" Disable pylint checking every save
let g:pymode_lint_write = 1
" Set key 'R' for run python code
let g:pymode_run = 1
let g:pymode_run_key = '<leader>r'

" Load pylint code plugin
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501"
let g:pymode_lint_onfly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_signs = 1

" auto folding
let g:pymode_folding = 0

" fixup for virtualenv
let g:pymode_virtualenv = 1

" Autoremove unused whitespaces (already do this, so disable)
let g:pymode_utils_whitespaces = 0

" get rid of line numbering
let g:pymode_options_other = 0

" GUI Stuff
if has('gui_running')
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Monaco:h12
    set hidden
endif

"  If I forget to sudo use !!
cmap w!! %!sudo tee > /dev/null %
