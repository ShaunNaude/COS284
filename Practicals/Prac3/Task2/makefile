build: task2.asm
	yasm -f elf64 -g dwarf2 -l task2.lst -o task2.o task2.asm
	mkdir -p bin
	ld -o bin/task2 task2.o

run: build
	./bin/task2

clean:
	rm -f *.o
	rm -fr bin/
