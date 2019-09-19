a.out: main.o populateMatrix.o encryptChar.o
	gcc main.o populateMatrix.o encryptChar.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

populateMatrix.o: populateMatrix.asm
	yasm -f elf64 -g dwarf2 populateMatrix.asm -o populateMatrix.o

encryptChar.o: encryptChar.asm
	yasm -f elf64 -g dwarf2 encryptChar.asm -o encryptChar.o	
