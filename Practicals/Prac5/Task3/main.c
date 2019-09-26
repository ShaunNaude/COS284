#include "stdio.h"
#include "stdlib.h"

extern double parameterSummation(int64_t count, ...);

int main()
{
double summation = parameterSummation(
        12,
        0.0,
        1.0,
        9.0,
        5.5,
        4.0,
        11.1,
        13.8,
        3.0,
        6.1,
        4.3,
        3.9,
        1.9
    );

  

    printf("%.3f", summation);
	
	//Answer must be 421.800
	
    return 0;
}
