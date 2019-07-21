build: listing.asm
	yasm -f elf64 -g dwarf2 -l listing.lst -o listing.o listing.asm
	mkdir -p bin
	ld -o bin/listing listing.o

run: build
	./bin/listing

clean:
	rm -f *.o
	rm -fr bin/