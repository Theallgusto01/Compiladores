all: anal.l sintatico.y
	clear
	flex -i anal.l
	bison -d sintatico.y
	gcc sintatico.tab.c lex.yy.c -o MeuPrimeiroCompilador -lfl -lm
	./MeuPrimeiroCompilador
