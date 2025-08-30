all: anal.l
	clear
	flex -i anal.l
	gcc lex.yy.c -o out -lfl
	./out 
