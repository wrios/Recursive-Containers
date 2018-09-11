#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>
#include <math.h>

#include "matriz_lista_string.h"

void test_ejemplo(FILE *pfile){
	
}

int main (void){
	FILE *pfile = fopen("salida.casos.propios.txt","a");
	test_ejemplo(pfile);
	fclose(pfile);
	return 0;    
}


