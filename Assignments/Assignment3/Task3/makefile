complexCaesar: complexCaesar.asm
	yasm -f elf64 -g dwarf2 -l complexCaesar.lst -o complexCaesar.o complexCaesar.asm
	mkdir -p bin
	ld -o bin/complexCaesar complexCaesar.o

run: complexCaesar
	./bin/complexCaesar

clean:
	rm -f *.o
	rm -fr bin/
