a.out: main.o calcVATInc.o
	gcc main.o calcVATInc.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

calcVATInc.o: calcVATInc.asm
	yasm -f elf64 -g dwarf2 calcVATInc.asm -o calcVATInc.o

