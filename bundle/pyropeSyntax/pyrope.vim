" Syntax file for the Pyrope HDL

" TODO: checking for already loaded syntax files
" TODO: Auto-detect pyrope files?

syn keyword pyropeBlock class stage pipe nextgroup=pyropeIdentifier skipwhite
hi def link pyropeBlock Keyword

syn keyword pyropeLabel when reset warn error
hi def link pyropeLabel Label

syn keyword pyropeConditional if elif else end fi case esac 
hi def link pyropeConditional	Conditional

syn keyword pyropeRepeat each for in do times
hi def link pyropeRepeat	Repeat

syn keyword pyropeDeclaration undef def alias read write trait
hi def link pyropeDeclaration Keyword

syn keyword pyropeStatement return yield assert dead pyrope puts
hi def link pyropeStatement Statement

syn keyword pyropeTest given should require timeline is
hi def link pyropeTest		Statement

syn keyword pyropeDoc doc cod

syn match pyropeIdentifier "\w\+"
syn match pyropeIdentifier "@\w\+"
hi def link pyropeIdentifier Identifier

" Size indication
syn match pyropeSize "\d\+" nextgroup=pyropeType
hi def link pyropeSize Number

syn match pyropeType "\d*[bdh][0-9a-f]\+" contained
syn match pyropeType "bits:[0-9]\+" contained
hi def link pyropeType Type

" Decimal number without and with sign
syn match pyropeNumber "\d\+"
syn match pyropeNumber "[-+]\d\+"
" Hexadecimal number
syn match pyropeNumber "0x[0-9a-f]\+"
" Binary number
syn match pyropeNumber "[01]\+"
hi def link pyropeNumber Number

syn keyword pyropeOperator as nextgroup=pyropeType skipwhite 
syn keyword pyropeOperator ++ -- || "&&"
syn keyword pyropeOperator - = + * / ^ '&' '|' '~' '%'
syn keyword pyropeOperator _+ _- _*
syn keyword pyropeOperator <<< << >>> >>
syn keyword pyropeOperator _<<< _<< _>>> _>>
syn keyword pyropeOperator != <= <> < >= == >
syn keyword pyropeOperator and or assert is ?
syn keyword pyropeOperator <- -> <>
hi def link pyropeOperator Operator

syn keyword pyropeTODO contained TODO FIXME XXX NOTE
syn match pyropeComment "#.*$" contains=pyropeTODO
hi def link pyropeComment Comment
