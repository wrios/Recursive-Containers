#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>
#include <math.h>

#include "matriz_lista_string.h"


void test_ejemplo(FILE *pfile){
	list_t* l;
	integer_t* i;
	l = listNew();
	l = listAdd(l,intSet(intNew(),34),(funcCmp_t*)&intCmp); 
	l = listAdd(l,intSet(intNew(),42),(funcCmp_t*)&intCmp); 
	l = listAdd(l,intSet(intNew(),13),(funcCmp_t*)&intCmp); 
	l = listAdd(l,intSet(intNew(),44),(funcCmp_t*)&intCmp); 
	l = listAdd(l,intSet(intNew(),58),(funcCmp_t*)&intCmp); 
	l = listAdd(l,intSet(intNew(),11),(funcCmp_t*)&intCmp); 
	l = listAdd(l,intSet(intNew(),92),(funcCmp_t*)&intCmp); listPrint(l,pfile); fprintf(pfile,"\n");
	i = intSet(intNew(),13); listRemove(l,(void*)i,(funcCmp_t*)&intCmp); intDelete(i);
	i = intSet(intNew(),58); listRemove(l,(void*)i,(funcCmp_t*)&intCmp); intDelete(i);
	listPrint(l,pfile); fprintf(pfile,"\n");
	listDelete(l);
	matrix_t* m;
	fprintf(pfile,"MATRIX:Creo, 1x1, int y borro\n");
	list_t* l1;list_t* l2;list_t* l3;list_t* l4;list_t* l5;list_t* l6;list_t* l7;list_t* l8;
	l1 = listNew();l2 = listNew();l3 = listNew();l4 = listNew();
	l5 = listNew();	l6 = listNew();l7 = listNew();l8 = listNew();
	l1 = listAdd(l1,intSet(intNew(),1),(funcCmp_t*)&intCmp);
	l1 = listAdd(l1,intSet(intNew(),2),(funcCmp_t*)&intCmp);
	l1 = listAdd(l1,intSet(intNew(),3),(funcCmp_t*)&intCmp);
	l2 = listAdd(l2,intSet(intNew(),3),(funcCmp_t*)&intCmp);
	l2 = listAdd(l2,intSet(intNew(),2),(funcCmp_t*)&intCmp);
	l2 = listAddFirst(l2,listNew());
	l3 = listAdd(l3,intSet(intNew(),3),(funcCmp_t*)&intCmp);
	l3 = listAddFirst(l3,listNew());
	l3 = listAddFirst(l3,listNew());
	l4 = listAddFirst(l4,listAddFirst(listNew(),strSet(strNew(),"SA")));
	l4 = listAddFirst(l4,listAddFirst(listNew(),strSet(strNew(),"RA")));
	l4 = listAddFirst(l4,listAddFirst(listNew(),strSet(strNew(),"SA")));
	l5 = listAddFirst(l5,intSet(intNew(),3));
	l5 = listAddFirst(l5,listAddFirst(listNew(),intSet(intNew(),2)));
	l5 = listAddFirst(l5,intSet(intNew(),1));
	l6 = listAddFirst(l6,intSet(intNew(),33));
	l6 = listAddFirst(l6,strSet(strNew(),"ra"));
	l6 = listAddFirst(l6,strSet(strNew(),"ra"));
	l7 = listAddFirst(l7,intSet(intNew(),35));
	l7 = listAddFirst(l7,strSet(strNew(),"ro"));
	l7 = listAddFirst(l7,strSet(strNew(),"ro"));
	l8 = listAddFirst(listAddFirst(l8,l7),l6);
	m = matrixNew(4,5);
	m = matrixAdd(m,1,0,l1);
	m = matrixAdd(m,2,0,listAddFirst(listAddFirst(listAddFirst(listNew(),strSet(strNew(),"SA")),strSet(strNew(),"RA")),strSet(strNew(),"SA")));
	m = matrixAdd(m,1,1,l2);
	m = matrixAdd(m,2,1,listAddFirst(listAddFirst(listAddFirst(listNew(),strSet(strNew(),"SA")),strSet(strNew(),"RA")),strSet(strNew(),"SA")));
	m = matrixAdd(m,1,2,l3);
	m = matrixAdd(m,2,2,l4);
	m = matrixAdd(m,3,2,intSet(intNew(),35));
	m = matrixAdd(m,1,3,l4);
	m = matrixAdd(m,2,3,l5);
	m = matrixAdd(m,3,3,intSet(intNew(),32));
	m = matrixAdd(m,1,4,l8);
	m = matrixAdd(m,2,4,intSet(intNew(),8));
	m = matrixAdd(m,3,4,intSet(intNew(),31));
	matrixPrint(m,pfile);
	matrixDelete(m);

}

int main (void){
	FILE *pfile = fopen("salida.casos.propios.txt","a");
	test_ejemplo(pfile);
	fclose(pfile);
	return 0;    
}


