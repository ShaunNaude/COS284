build: hello.asm
	yasm -f elf64 -g dwarf2 -l hello.lst -o hello.o hello.asm
	mkdir -p bin
	ld -o bin/hello hello.o

run: build
	./bin/hello

clean:
	rm -f *.o
	rm -fr bin/