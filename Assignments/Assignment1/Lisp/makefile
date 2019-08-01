Default:
	clisp -c hello_world.lsp
	chmod +x hello_world.fas
run:
	for i in {1..100}; do (time for j in {1..1000};do clisp hello_world;done;)2>>Lisp_times.txt;done;
clean:
	rm hello_world.fas hello_world.lib