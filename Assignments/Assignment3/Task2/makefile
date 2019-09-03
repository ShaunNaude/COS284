decoder: decoder.asm
	yasm -f elf64 -g dwarf2 -l decoder.lst -o decoder.o decoder.asm
	mkdir -p bin
	ld -o bin/decoder decoder.o

run: decoder
	./bin/decoder

clean:
	rm -f *.o
	rm -fr bin/
