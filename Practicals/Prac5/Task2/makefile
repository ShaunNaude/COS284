a.out: main.o isGeometric.o
	gcc main.o isGeometric.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

isGeometric.o: isGeometric.asm
	yasm -f elf64 -g dwarf2 isGeometric.asm -o isGeometric.o