setlocal indentexpr=MintIndent()

function! MintIndent()
    let line = getline(v:lnum)
    let prevNum = prevnonblank(v:lnum - 1)
    let prev = getline(prevNum)

    if prev =~ '[{(]\s*\(//\s*[^)}]*\)\=$' && line !~ '^\s*[)}]'
        return indent(prevNum) + &shiftwidth
    elseif prev !~ '[{(]\s*\(//\s*[^)}]*\)\=$' && line =~ '^\s*[)}]'
        return indent(prevNum) - &shiftwidth
    endif

    return indent(prevNum)
endfunction
