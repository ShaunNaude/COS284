main: *.o
	g++ -o main *.o
	
*.o: *.cpp
	g++ -c *.cpp
	
run:
	for i in {1..100};do (time for j in {1..1000};do ./main; done)2>>C++_times.txt;done;

clean: 
	rm *.o main