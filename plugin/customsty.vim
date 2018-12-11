if exists("g:loaded_customsty")
    finish
endif
let g:loaded_customsty = 1

augroup customsty
    autocmd!
    if $VIM_ENV == "mofigs"
        autocmd FileType javascript call s:js_mofigs()
    else
        autocmd FileType javascript call s:js()
    endif
    autocmd FileType html call s:js()
    autocmd FileType c call s:c()
    autocmd FileType h call s:h()
    if $VIM_ENV == "bullet"
        autocmd FileType cpp call s:cpp_bullet()
        autocmd BufEnter *.c :setlocal filetype=cpp
        autocmd BufEnter *.h :setlocal filetype=cpp
    elseif $VIM_ENV == "dart"
        autocmd FileType cpp call s:cpp_dart()
        autocmd BufEnter *.hpp :setlocal filetype=cpp
    else
        autocmd FileType cpp call s:cpp()
        autocmd BufEnter *.h :setlocal filetype=c
    endif
    setlocal tabpagemax=100
augroup END

function s:js()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal textwidth=120
    setlocal noexpandtab
endfunction

function s:js_mofigs()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal textwidth=120
    setlocal expandtab
endfunction

function s:c()
    setlocal colorcolumn=80
    highlight ColorColumn ctermbg=8
endfunction

function s:cpp()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    highlight ColorColumn ctermbg=8

    setlocal textwidth=120
    setlocal colorcolumn=120
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

function s:cpp_bullet()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
    highlight ColorColumn ctermbg=8

    setlocal textwidth=120
    setlocal colorcolumn=120
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

function s:cpp_dart()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
    highlight ColorColumn ctermbg=8

    setlocal textwidth=120
    setlocal colorcolumn=120
    setlocal expandtab

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
