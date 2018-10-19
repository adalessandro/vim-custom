if exists("g:loaded_customsty")
    finish
endif
let g:loaded_customsty = 1

augroup customsty
    autocmd!
    autocmd FileType javascript call s:js()
    autocmd FileType html call s:js()
    autocmd FileType c call s:c()
    autocmd FileType h call s:h()
    autocmd FileType cpp call s:cpp()
    autocmd BufEnter *.h :setlocal filetype=c
augroup END

function s:js()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal textwidth=120
    setlocal noexpandtab
endfunction

function s:c()
    setlocal colorcolumn=80
    highlight ColorColumn ctermbg=8
endfunction

function s:cpp()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=120
    setlocal noexpandtab

    setlocal cindent
    setlocal cinoptions=:0,l1,t0,g0,(0

    highlight default link LinuxError ErrorMsg

    syn match LinuxError / \+\ze\t/     " spaces before tab
    syn match LinuxError /\%>120v[^()\{\}\[\]<>]\+/ " virtual column 121 and more

    " Highlight trailing whitespace, unless we're in insert mode and the
    " cursor's placed right after the whitespace. This prevents us from having
    " to put up with whitespace being highlighted in the middle of typing
    " something
    autocmd InsertEnter * match LinuxError /\s\+\%#\@<!$/
    autocmd InsertLeave * match LinuxError /\s\+$/
endfunction

" vim: ts=4 et sw=4
