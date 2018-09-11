#include "matriz_lista_string.h"

//extern void matrixDelete(void* m);
//extern void matrixPrint(void* m, FILE *pFile);

matrix_t* matrixNew(uint32_t m, uint32_t n){
	matrix_t* nueva = (matrix_t*) malloc (48);
	nueva->dataType = 4;
	nueva->remove = &matrixDelete;
	void (*ptr_fun)(void* , void*);
	ptr_fun = &matrixPrint;
	nueva->print = ptr_fun;
	nueva->m = m;//(columna)
	nueva->n = n;//(fila)
	void **data = (void**) malloc(sizeof(void*)*m*n);
    return nueva;
}

void matrixPrint(matrix_t* m, FILE *pFile) {
	void *iterador = *(m->data);
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

