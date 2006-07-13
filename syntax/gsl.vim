" Vim syntax file
" Language:	gsl templates
" Maintainer:	Ronald
" Version: 	0.1
" Last Change:	2006 Jul 12

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match gslInitialDot "^\s*\." contained

syn match  gslNumber "\<[0-9][0-9]*\(\.[0-9][0-9]*\)\?\>" contained
syn region gslString  start=+"+ skip=+\\\\\|\\"+ end=+"+ contained
syn region gslString  start=+'+ skip=+\\\\\|\\'+ end=+'+ contained

syn match gslIdentifier "\<[a-zA-Z_][a-zA-Z_\-0-9]*\." contained
syn match gslIdentifier "\.\?[a-zA-Z_][a-zA-Z_\-0-9]*" contained
syn match gslIdentifier "\<[a-zA-Z_][a-zA-Z_\-0-9]*\.[a-zA-Z_][a-zA-Z_\-0-9]*" contained
syn match gslIdentifier "\[[^\]]*\]" contained contains=gslIdentifier

syn match gslName       "\<[a-zA-Z_][a-zA-Z_\-0-9]*" contained

syn match gslOperator "\*\|/\|+\|-\|?\|=\|<>\|<\|>\|<=\|>=\|?=\|?<>\|?<\|?>\|?<=\|?>=\||\|&\|!" contained

syn match  gslFullLineComment  "^\s*\.-.*$" contained
syn match  gslHashLineComment  "#.*$" contained
syn region gslMultilineComment start="/\*" end="\*/" contained

syn keyword gslPredefIdent contained script filename outfile line me version date time

syn keyword gslKeyWord contained output append close literal scope endscope define new endnew delete copy move sort load xml save include gsl template endtemplate macro endmacro function endfunction return invoke echo abort
syn keyword gslConditional contained if elsif else endif
syn keyword gslRepeat contained for endfor while endwhile next last

syn match gslBuiltInFunc contained "\<\(math.rand\|math.pi\|dir.cwd\|mail.error\)\>"
syn match gslBuiltInFunc contained "\<\(count\|index\|item\|total\|name\|alias\|defined\|deleted\|macro\|scope\|conv.number\|conv.string\|conv.chr\|conv.ord\|file.exists\|file.timestamp\|file.error\|file.locate\|file.rename\|file.delete\|file.open\|file.read\|file.write\|file.tell\|file.seek\|file.close\|file.copy\|file.basename\|env.get\|env.set\|string.length\|string.locate\|string.substr\|string.trim\|string.justify\|string.certify\|string.replace\|string.match\|string.prefixed\|string.prefix\|string.defix\|string.hash\|string.convch\|string.lexcmp\|string.lexncmp\|string.lexwcmp\|string.matchpat\|string.soundex\|string.cntch\|string.xml\|string.html_encode\|string.html_decode\|math.abs\|math.ceil\|math.floor\|math.mod\|math.rand\|math.sqrt\|math.exp\|math.log\|math.log10\|math.pow\|math.pi\|math.sin\|math.cos\|math.tan\|math.asin\|math.acos\|math.atan\|math.atan2\|math.sinh\|math.cosh\|math.tanh\|math.asinh\|math.acosh\|math.atanh\|dir.load\|dir.create\|dir.delete\|dir.cwd\|dir.setcwd\|dir.files\|zip.extract\|zip.load\|zip.create\|zip.new\|zip.add\|zip.close\|date.picture\|date.number\|time.picture\|time.number\|regexp.match\|sock.passive\|sock.accept\|sock.close\|sock.connect\|sock.error\|sock.read\|sock.write\|mail.send\|mail.error\|thread.create\)\s*(\@="
syn region gslFuncCall contained start="\<[a-z][a-zA-Z_\-0-9]*\s*(" end=")"

syn match  gslFuncDef contained "\.\s*\(macro\|function\)\s\+\(global\s\+\.\s\+\)\?[a-zA-Z_\-0-9]\+\s*\(([^)]*)\)\?" contains=gslKeyWord,gslName

syn region gslReference start=/\$(/ end=/)/ contains=gslString,gslNumber,gslOperator,gslPredefIdent,gslBuiltInFunc

syn match gslDirective "^\s*\..*" contains=gslInitialDot,gslNumber,gslString,gslOperator,gslPredefIdent,gslReference,gslKeyWord,gslRepeat,gslConditional,gslFuncDef,gslBuiltInFunc,gslFullLineComment,gslHashLineComment,gslMultilineComment

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gsl_syntax_inits")
  if version < 508
    let did_gsl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gslFullLineComment         Comment
  HiLink gslHashLineComment         Comment
  HiLink gslMultilineComment        Comment
  HiLink gslKeyWord                 KeyWord
  HiLink gslConditional             Conditional
  HiLink gslRepeat                  Repeat
  HiLink gslReference               Special 
  HiLink gslIdentifier              Identifier
  HiLink gslPredefIdent             Identifier
  HiLink gslName                    Identifier
  HiLink gslNumber                  Number
  HiLink gslString                  String
  HiLink gslInitialDot              KeyWord
  HiLink gslBuiltInFunc             Special
  HiLink gslFuncCall                Function
  HiLink gslFuncDef                 Function
  HiLink gslOperator                Operator

  delcommand HiLink
endif

let b:current_syntax = "gsl"

" vim: ts=8 sw=2
