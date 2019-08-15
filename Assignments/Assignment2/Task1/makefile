build: mul.asm
	yasm -f elf64 -g dwarf2 -l mul.lst -o mul.o mul.asm
	mkdir -p bin
	ld -o bin/mul mul.o

run: build
	./bin/mul

clean:
	rm -f *.o
	rm -fr bin/
