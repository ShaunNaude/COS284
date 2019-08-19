build: bit.asm
	yasm -f elf64 -g dwarf2 -l bit.lst -o bit.o bit.asm
	mkdir -p bin
	ld -o bin/bit bit.o

run: build
	./bin/bit

clean:
	rm -f *.o
	rm -fr bin/
