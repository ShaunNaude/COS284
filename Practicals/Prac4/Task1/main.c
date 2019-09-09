#include <stdio.h>
#include <stdlib.h>


void printChar(char c)
{
    printf("%c", c);
}

extern void spiralRead(char** matrix, int rows, int cols);

#define ROWS 3
#define COLS 3
int main(int argc, char** argv)
{    
    char** matrix = malloc(ROWS*8);
    for (int i = 0; i < ROWS; ++i) {
        matrix[i] = malloc(COLS);
    }

    matrix[0][0] = '1';
    matrix[0][1] = '2';
    matrix[0][2] = '3';

    matrix[1][0] = '8';
    matrix[1][1] = '9';
    matrix[1][2] = '4';

    matrix[2][0] = '7';
    matrix[2][1] = '6';
    matrix[2][2] = '5';
    

     spiralRead(matrix, ROWS, COLS);

   //for (int i = 0; i < ROWS; ++i) {
     //   free(matrix[i]);
   // }
   // free(matrix);

    return 0;
}

/**
 *  Output:
 *
 *      123456789
 *
 **/
