
if exists("b:current_syntax")
    finish
endif

syn clear

syn keyword mintTodos TODO XXX FIXME NOTE

syn keyword mintKeyword connect record store with where state exposing 
syn keyword mintKeyword when use if else catch finally return new as 
syn keyword mintKeyword component includes property style get fun

syn match mintName "\v<[A-Z][A-Za-z0-9]*(\.[A-Z][A-Za-z0-9]*)*>"
syn region mintComment start="\/\*" end="\*\/"
syn region mintString start=/\v"/ skip=/\v\\./ end=/\v"/

syn match mintNumber "\v<\d+>"
syn match mintNumber "\v<\d+\.\d+>"

syn region mintStyle start="\(\<style\s\)\@<=\w\+\s{" end="}" contains=mintStylePropName,mintStylePropValue
syn match mintStylePropName contained "[A-Za-z0-9-]*\(:\)\@="
syn match mintStylePropValue contained "\(:\)\@<=\s*.*;"

syn keyword mintOperator next

syn region mintEndTag start="</[A-Za-z0-9:{]" end=">" contains=mintTagN
syn region mintTag start="<[A-Za-z0-9:{]" end=">" fold contains=mintTagN,mintTagArg,mintKeyword,mintString,mintNumber,mintOperator,mintName
syn match mintTagN contained "<\s*[:a-zA-Z0-9]\+"hs=s+1 contains=mintTagName,htmlSpecialTagName,@mintTagNameCluster
syn match mintTagN contained "</\s*[:a-zA-Z0-9]\+"hs=s+2 contains=mintTagName,htmlSpecialTagName,@mintTagNameCluster

syn match mintTagArg contained "\w*\(=\)\@="
syn match mintTagName contained "\(<[/]\?\)\@<=[A-Za-z0-9:]\+"

hi def link mintTodos Todo
hi def link mintComment Comment
hi def link mintKeyword Keyword
hi def link mintName Type
hi def link mintNumber Number
hi def link mintOperator Operator
hi def link mintStatement Statement
hi def link mintString String
hi def link mintStyleNumber Number
hi def link mintTagArg Type
hi def link mintTagName Function
hi def link mintStylePropName Type
hi def link mintStylePropValue Constant

let b:current_syntax = "mint-lang"
