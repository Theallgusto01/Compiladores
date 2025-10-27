all: anal.l
	clear
	flex -i anal.l
	gcc lex.yy.c -o out -lfl
	./out > out.txt
	python3 generate_symbol_table.py
