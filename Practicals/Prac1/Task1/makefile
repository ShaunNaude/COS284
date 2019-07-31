build: exit.asm
	yasm -f elf64 -g dwarf2 -l exit.lst -o exit.o exit.asm
	mkdir -p bin
	ld -o bin/exit exit.o

run: build
	./bin/exit

clean:
	rm -f *.o
	rm -fr bin/
