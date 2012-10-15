let s:save_cpo = &cpo
set cpo&vim

function! unite#filters#converter_erase_diff_buffer#define()
    return s:converter
endfunction

let s:converter = {
            \ 'name': 'converter_erase_diff_buffer',
            \ 'description' : 'erase diff buffer from vcscommand.vim',
            \}

function! s:converter.filter(candidates, context)
    let index = len(a:candidates) - 1
    while index >= 0
        let abbr = a:candidates[index].abbr
        if match(abbr, '\v^(\[nofile\])? (git|svn|cvs) (diff|review) ') > -1
            call remove(a:candidates, index)
        endif
        if match(abbr, '^gist:') > -1
            call remove(a:candidates, index)
        endif
        let index = index - 1
    endwhile

    return a:candidates
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
