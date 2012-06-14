let s:save_cpo = &cpo
set cpo&vim

function! unite#filters#conterter_erase_diff_buffer#define()
    return s:converter
endfunction

let s:converter = {
            \ 'name': 'converter_erase_diff_buffer'
            \ 'description' : 'erase diff buffer from vcscommand.vim'
            \}

function! s:converter.filter(candidates, context)
    let index = len(a:candidates) - 1
    while index >= 0
        if match(a:candidates[index], '^\(git\|svn\) diff ') > -1
            remove(a:candidates, index)
        endif
        let index = index - 1
    endwhile

    return a:candidates
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
