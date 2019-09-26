a.out: main.o parameterSummation.o
	gcc main.o parameterSummation.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

parameterSummation.o: parameterSummation.asm
	yasm -f elf64 -g dwarf2 parameterSummation.asm -o parameterSummation.o

