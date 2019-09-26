#include "stdio.h"

extern int isGeometric(double[], int);
/*int isGeometric(double* k, int T){

    double ratio = k[0]/k[1];
    return 1;

}*/

int main()
{
    double sequence[] = {
        1.0,
        2.0,
        450,
        8.0,
        16.0
    };
    printf("%i\n", isGeometric(sequence, 5));
	
	//Answer must be 1
	
    return 0;
}

