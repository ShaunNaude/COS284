_start: *.o
	ld -o _start *.o
	
*.o: *.asm
	yasm -f elf64 -g dwarf2 -l *.lst *.asm
	
run:
	for i in {1..100};do (time for j in {1..1000}; do ./_start;done) 2>>ASM_times.txt;done;

clean: 
	rm *.o
	rm _start
	rm *.lst