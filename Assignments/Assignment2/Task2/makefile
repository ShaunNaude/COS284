build: div.asm
	yasm -f elf64 -g dwarf2 -l div.lst -o div.o div.asm
	mkdir -p bin
	ld -o bin/div div.o

run: build
	./bin/div

clean:
	rm -f *.o
	rm -fr bin/
