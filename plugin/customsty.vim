if exists("g:loaded_customsty")
    finish
endif
let g:loaded_customsty = 1

augroup customsty
    autocmd!
    autocmd FileType javascript call s:js()
augroup END

function s:js()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal textwidth=120
    setlocal noexpandtab
endfunction

" vim: ts=4 et sw=4
