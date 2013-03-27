
" ======= compile && run ======= "

" compile c
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc -Wall -pedantic -std=c99 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunc

" compile cpp
func! CompileCpp()
    exec "w"
    let compilecmd="!g++ -Wall -pedantic -std=c++98 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunc

" compile java
func! CompileJava()
	exec "w"
    exec "!javac %"
endfunc

" compile haskell
func! CompileHaskell()
	exec "w"
	let compilecmd="!ghc --make "
	let compileflag="-o %<"
	exec compilecmd." % ".compileflag
endfunc

" select
func! CompileCode()
        exec "w"
        if &filetype == "c"
			exec "call CompileGcc()"
        elseif &filetype == "cpp"
			exec "call CompileCpp()"
		elseif &filetype == "java"
			exec "call CompileJava()"
		elseif &filetype == "haskell"
			exec "call CompileHaskell()"
		elseif &filetype == "lua"
			exec "!lua %<.lua"
		elseif &filetype == "perl"
			exec "!perl %<.pl"
        elseif &filetype == "python"
			exec "!python %<.py"
		elseif &filetype == "ruby"
			exec "!ruby %<.rb"
        endif
endfunc

" select
func! RunResult()
        exec "w"
        if &filetype == "c"
			exec "! %<"
        elseif &filetype == "cpp"
			exec "! %<"
		elseif &filetype == "java"
			exec "!java %<"
		elseif &filetype == "haskell"
			exec "! %<"
		elseif &filetype == "lua"
			exec "!lua %<.lua"
		elseif &filetype == "perl"
			exec "!perl %<.pl"
        elseif &filetype == "python"
			exec "!python %<.py"
		elseif &filetype == "ruby"
			exec "!ruby %<.rb"
        endif
endfunc

" Shift + c
map <s-C> :call CompileCode()<CR>
imap <s-C> <ESC>:call CompileCode()<CR>
vmap <s-C> <ESC>:call CompileCode()<CR>

" Shift + R
map <s-R> :call RunResult()<CR>
imap <s-R> <ESC>:call RunResult()<CR>
vmap <s-R> <ESC>:call RunResult()<CR>
