default:
	javac *.java
run:
	for i in {1..100}; do (time for j in {1..1000}; do java hello_world; done) 2>>Java_times.txt;done;
clean:
	rm *.class