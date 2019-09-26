#include "stdio.h"

extern double calcVATInc(double price, double vat);

int main()
{
    double price = 100.0f;
    double vat = 14.0f;
    printf("%.3f\n", calcVATInc(price, vat));
	
	//Answer should be 114.000

    return 0;
}
