#include <stdio.h>
#include <stdlib.h>
#include <prussdrv.h>
#include <pruss_intc_mapping.h>
#include <pthread.h>
#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <string.h>
using namespace std;

char TM1_file_path [] = "TM1_out.txt";
unsigned char Buffer[10000];
FILE *TM1_file = NULL ;

int  main (void)
{
  if(getuid()!=0)
  {
    printf("You must run this program as root. Exiting.\n");
    exit(EXIT_FAILURE);
  }
 
  
  TM1_file = fopen(TM1_file_path,"r+b");
  if(TM1_file==NULL)
  {
    printf("TM_1 file open error\n");
    return -1;
  }

 
do
{
	fread(Buffer , 1, 10000 , TM1_file);
	usleep(100);

}while(1);

  fclose(TM1_file);

  cout<<"Exiting Program\n";
  return EXIT_SUCCESS;
}
