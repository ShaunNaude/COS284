basicCaesar: basicCaesar.asm
	yasm -f elf64 -g dwarf2 -l basicCaesar.lst -o basicCaesar.o basicCaesar.asm
	mkdir -p bin
	ld -o bin/basicCaesar basicCaesar.o

run: basicCaesar
	./bin/basicCaesar

clean:
	rm -f *.o
	rm -fr bin/
