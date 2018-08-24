; FUNCIONES de C
	extern malloc
	extern free
	extern fopen
	extern fclose
	extern fprintf

section .data


section .text

global str_len
global str_copy
global str_cmp
global str_concat
global matrixAdd
global matrixRemove
global matrixDelete
global listNew
global listAddFirst
global listAddLast
global listAdd
global listRemove
global listRemoveFirst
global listRemoveLast
global listDelete
global listPrint
global strNew
global strSet
global strAddRight
global strAddLeft
global strRemove
global strDelete
global strCmp
global strPrint
global intNew
global intSet
global intRemove
global intDelete
global intCmp
global intPrint

;########### Funciones Auxiliares Recomendadas

; uint32_t str_len(char* a)
str_len:
	ret

; char* str_copy(char* a)
str_copy:
	ret

; int32_t str_cmp(char* a, char* b)
str_cmp:
	ret
	
; char* str_concat(char* a, char* b)
str_concat:
	ret
	
;########### Funciones: Matriz

; matrix_t* matrixAdd(matrix_t* m, uint32_t x, uint32_t y, void* data);
matrixAdd:
	ret
	
; matrix_t* matrixRemove(matrix_t* m, uint32_t x, uint32_t y);
matrixRemove:
	ret
	
; void matrixDelete(matrix_t* m);
matrixDelete:
	ret
	
;########### Funciones: Lista

; list_t* listNew();
listNew:
	ret
	
; list_t* listAddFirst(list_t* l, void* data);
listAddFirst:
	ret
	
; list_t* listAddLast(list_t* l, void* data);
listAddLast:
	ret
	
; list_t* listAdd(list_t* l, void* data, funcCmp_t* f);
listAdd:
	ret
	
; list_t* listRemove(list_t* l, void* data, funcCmp_t* f);
listRemove:
	ret
	
; list_t* listRemoveFirst(list_t* l);
listRemoveFirst:
	ret
	
; list_t* listRemoveLast(list_t* l);
listRemoveLast:
	ret
	
; void listDelete(list_t* l);
listDelete:
	ret
	
; void listPrint(list_t* m, FILE *pFile);
listPrint:
	ret
	
;########### Funciones: String

; string_t* strNew();
strNew:
	ret
	
; string_t* strSet(string_t* s, char* c);
strSet:
	ret
	
; string_t* strAddRight(string_t* s, string_t* d);
strAddRight:
	ret
	
; string_t* strAddLeft(string_t* s, string_t* d);
strAddLeft:
	ret
	
; string_t* strRemove(string_t* s);
strRemove:
	ret
	
; void strDelete(string_t* s);
strDelete:
	ret
	
; int32_t strCmp(string_t* a, string_t* b);
strCmp:
	ret
	
; void strPrint(string_t* m, FILE *pFile);
strPrint:
	ret
	
;########### Funciones: Entero

; integer_t* intNew();
intNew:
	ret
	
; integer_t* intSet(integer_t* i, int d);
intSet:
	ret
	
; integer_t* intRemove(integer_t* i);
intRemove:
	ret
	
; void intDelete(integer_t* i);
intDelete:
	ret
	
; int32_t intCmp(integer_t* a, integer_t* b);
intCmp:
	ret
	
; void intPrint(integer_t* m, FILE *pFile);
intPrint:
	ret
	
