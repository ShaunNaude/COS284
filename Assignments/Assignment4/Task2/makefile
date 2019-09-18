a.out: main.o populateMatrix.o encryptString.o
	gcc main.o populateMatrix.o encryptString.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

populateMatrix.o: populateMatrix.asm
	yasm -f elf64 -g dwarf2 populateMatrix.asm -o populateMatrix.o

encryptString.o: encryptString.asm
	yasm -f elf64 -g dwarf2 encryptString.asm -o encryptString.o	

