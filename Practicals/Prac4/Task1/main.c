#include <stdio.h>
#include <stdlib.h>


void printChar(char c)
{
    printf("%c", c);
}

extern void spiralRead(char** matrix, int rows, int cols);

#define ROWS 1
#define COLS 1
int global=48;
int main(int argc, char** argv)
{    
    char** matrix = malloc(ROWS*8);
   /* for (int i = 0; i < ROWS; ++i) {
        matrix[i] = malloc(COLS);
    }*/
    printChar('k');
    matrix[0] = malloc(1);
    matrix[0][0]='Z';
  // char c;
    //for(int i = 0; i<ROWS;i++){
      //  for(int j = 0; j<COLS;j++){
            //global++;
            //c = global+'0';
           // matrix[i][j]= c;
      //  }
    //}

    
        printChar(matrix[0][0]);


     spiralRead(matrix, ROWS, COLS);
        
       // free(matrix);
  // for (int i = 0; i < ROWS; ++i) {
   //     free(matrix[i]);
  // }
  
   // free(matrix[0]);
   // free(matrix);

    return 0;
}

/**
 *  Output:
 *
 *      123456789
 *
 **/
