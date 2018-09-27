#include "matriz_lista_string.h"

//extern void matrixDelete(void* m);
//extern void matrixPrint(void* m, FILE *pFile);

/*
void matrixPrint(matrix_t* m, FILE *pFile) {
	void mostrarLista(struct lista *unaLista){
	struct nodo * unNodo = unaLista->primero;
	while(unNodo){
		printf("[%d] -> ", unNodo->dato);
		unNodo= unNodo->prox;
	}
	printf("-|\n");
	bgra_t (*src_matrix)[(src_row_size+3)/4] = (bgra_t (*)[(src_row_size+3)/4]) src;
	void **iterador = m->data;
	void (*ptr_fun)(void* , void*);
	//void matrixPrint(matrix_t* m, FILE *pFile);
	uint32_t columnas = m->m;
	uint32_t filas = m->n;
	for (uint32_t i = 0; i < filas; ++i)
	{
		for (uint32_t j = 0; j < columnas; ++j)
		{
			fprintf(pFile, "%c", '|');
			if (iterador != NULL)
			{	
				fprintf(pFile, "%c", '|');
				
				//ptr_fun = (*(iterador)+2);
				//(*ptr_fun)(iterador, pFile);
			}else{
				fprintf(pFile, "%s", "matriznull");
			}
			iterador++;
		}
		fprintf(pFile, "\n%c", '|');
	}
}
*/