a.out: main.o spiralRead.o
	gcc main.o spiralRead.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

spiralRead.o: spiralRead.asm
	yasm -f elf64 -g dwarf2 spiralRead.asm -o spiralRead.o

