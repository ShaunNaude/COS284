#include <stdio.h>
#include <stdlib.h>

extern char** populateMatrix();

#define ROWS 3
#define COLS 3
int main(int argc, char** argv)
{    
    char** matrix = populateMatrix();


    

            for(int i =0 ; i<26 ;i++)
            {
                for (int k =0 ; k<26 ; k++)
                {
                     printf("%c",matrix[i][k]);
                }
                putchar('\n');
            }


    
  

    return 0;
}

/**
 *  Output:
 *
 *      123456789
 *
 **/
