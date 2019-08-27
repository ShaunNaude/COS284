build: task1.asm
	yasm -f elf64 -g dwarf2 -l task1.lst -o task1.o task1.asm
	mkdir -p bin
	ld -o bin/task1 task1.o

run: build
	./bin/task1

clean:
	rm -f *.o
	rm -fr bin/
