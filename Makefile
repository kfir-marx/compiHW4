hw4: hw4.lex hw4_bison.ypp
	bison -d hw4_bison.ypp
	flex hw4.lex
	g++ -Wno-write-strings output.cpp hw4_bison.tab.cpp lex.yy.c -lfl
