build: sub.asm
	yasm -f elf64 -g dwarf2 -l sub.lst -o sub.o sub.asm
	mkdir -p bin
	ld -o bin/sub sub.o

run: build
	./bin/sub

clean:
	rm -f *.o
	rm -fr bin/
