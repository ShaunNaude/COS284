#include <stdio.h>
#include <stdlib.h>

extern char** populateMatrix();
extern char encryptChar(char**,char, char);

#define ROWS 26
#define COLS 26
int main(int argc, char** argv)
{    
    char** matrix = populateMatrix();


          
   

     /*char** matrix = malloc(26*8);
     
    for (int i = 0; i < 26; ++i) {
        matrix[i] = malloc(26);
    }
       
        char c;
       for(int i =0 ; i<26 ;i++)
            {
                for (int k =0 ; k<26 ; k++)
                {
                  matrix[0][0] = 'A';
                   
                }
                    
            }*/

    char awe = encryptChar(matrix,'k' , 'L');
    printf("%c",awe);

    

           


    
  

    return 0;
}

/**
 *  Output:
 *
 *      123456789
 *
 **/
