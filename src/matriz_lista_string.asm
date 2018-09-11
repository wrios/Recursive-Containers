; FUNCIONES de C
	extern malloc
	extern free
	extern fopen
	extern fclose
	extern fprintf

section .data

%define off_data_type 0
%define off_remove 8
%define off_print 16

%define off_matrix_data_type 0
%define off_matrix_remove 8
%define off_matrix_print 16
%define off_matrix_col 24
%define off_matrix_fil 32
%define off_matrix_data 40

%define off_list_data_type 0
%define off_list_remove 8
%define off_list_print 16
%define off_list_first 24
%define off_nodo_data 0
%define off_nodo_next 8

%define off_string_data_type 0
%define off_string_remove 8
%define off_string_print 16
%define off_string_data 24

%define off_int_data_type 0
%define off_int_remove 8
%define off_int_print 16
%define off_int_data 24

fopen_w: db "w",0;a
fprintf_c: db "%c", 0 
fprintf_d: db "%d", 0 
fprintf_s: db "%s", 0
fprintf_null: db "NULL",0 
fprintf_coma: db ",",0
fprintf_corcheteI: db "[", 0
fprintf_corcheteF: db "]", 0
NULL: dq 0
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

; uint32_t str_len(char* a);7
str_len:
	push rbp
	mov rbp, rsp
	push rdi
	sub rsp, 8
	
	;(rdi puntero a char)
	xor rax, rax ; rax en 0
	jmp ifStreLen
cicloStr_Len:
	add rax, 1
	add rdi, 1
ifStreLen:
	cmp byte [rdi], 0
	jne cicloStr_Len

	add rsp, 8
	pop rdi
	pop rbp
	ret

; char* str_copy(char* a);19
str_copy:
	push rbp
	mov rbp,rsp
	push r12
	push r13
	push rdi
	push rcx
	push rsi
	sub rsp, 8

	call str_len
	mov  rcx, rax ; rcx tamaño del string
	mov r12, rdi ; puntero a char* a
	add rax, 1
	mov rdi, rax ; rdi tamaño de char*
	call malloc ; rax puntero a nueva memoria
	mov r13,rax ; r13 putero a nuevo char*
cicloStr_Copy:
	mov sil, [r12]
	mov [rax], sil
	add rax, 1
	add r12, 1
	cmp byte [r12], 0
	jne cicloStr_Copy
	;loop cicloStr_Copy
	mov rax, r13

	add rsp, 8
	pop rsi
	pop rcx
	pop rdi
	pop r13
	pop r12
	pop rbp
	ret

; int32_t str_cmp(char* a, char* b);25
str_cmp:
	push rbp
	mov rbp,rsp
	push rdi
	push rsi
	push rbx
	sub rsp, 8

	;(rdi puntero a)
	;(rsi puntero b)
	jmp ifNullStrCmp
cicloStrCmp:
	mov bl, [rdi]
	cmp [rsi], bl
	jne distintos
	inc rdi
	inc rsi
ifNullStrCmp:
	cmp byte [rdi], 0
	jne cicloStrCmp
	cmp byte [rsi], 0
	jne distintos
	mov rax, 0
	jmp finStrCmp
distintos:
	mov bl, [rdi]
	cmp [rsi], bl
	jg StrbMayor
	mov rax, -1
	jmp finStrCmp
StrbMayor:
	mov rax, 1
finStrCmp:
	
	add rsp, 8
	pop rbx
	pop rsi
	pop rdi
	pop rbp
	ret
	
; char* str_concat(char* a, char* b);36
str_concat:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rcx
	push rbx
	push r12
	push r13
	push r14
	push r15

	mov r12, rdi
	mov r13, rsi
	xor rcx, rcx
	call str_len
	mov r15, rax ; r15 size char* a
	mov rdi, rsi
	call str_len
	mov r14, rax ; r14 size char* b
	mov rdi, r14
	add rdi, r15
	add rdi, 1
	call malloc
	jmp primerIFConcat
primerCicloConcat:
	mov bl, [r12]
	mov [rax], bl
	inc r12
	inc rax
primerIFConcat:		
	cmp byte [r12], 0
	jne primerCicloConcat
	jmp segundoIFConcat
segundoCicloConcat:
	mov bl,[r13]
	mov [rax], bl
	inc r13
	inc rax
segundoIFConcat:
	cmp byte [r13], 0
	jne segundoCicloConcat
	mov byte [rax], 0
	sub	rax, r14
	sub	rax, r15

	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rcx
	pop rsi
	pop rdi
	pop rbp
	ret
	
;########### Funciones: Matriz

; matrix_t* matrixAdd(matrix_t* m, uint32_t x, uint32_t y, void* data);22
matrixAdd:
	;(rdi puntero a matriz)
	;(rsi=x cantidad de columnas)
	;(rdx=y cantidad de filas)
	;()
	ret
	
; matrix_t* matrixRemove(matrix_t* m, uint32_t x, uint32_t y);23
matrixRemove:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	push r12
	push r13
	push r14
	;(rdi puntero a matrix)
	;(rsi columnas)
	;(rdx filas)
	mov rax,rdi
	mov r12, [rdi+off_matrix_data]
	mov r13, [r12]
	lea r14, [r13+2]
	cmp r14, NULL
	je fin
	mov r13, [ r14+off_remove]
	mov rdi, r14
	call r13
	mov rdi, rax
	mov r14, NULL

	pop r14
	pop r13
	pop r12
	pop rdx
	pop rsi
	pop rdi
	pop rbp
	ret
	
; void matrixDelete(matrix_t* m);26
matrixDelete:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	push rcx
	push r12
	push r13
	;(rdi puntero a matrix)
	xor rcx, rcx
	mov rax, [rdi+off_matrix_col]
	mov rbx, [rdi+off_matrix_fil]
	mul rcx
	dec rcx
	xor r12, r12
filas:
	inc r12
	xor r13, r13
columnas:
	inc r13
	mov rsi, r13 ; columas
	mov rdx, r12 ; filas
	call matrixRemove
	cmp r13, [rdi+off_matrix_col]
	jbe columnas
loop filas

	pop r13
	pop r12
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop rbp
	ret
	
;########### Funciones: Lista
; list_t* listNew();12
listNew:
	push rbp
	mov rbp, rsp

;reservandoMem
	mov rdi, 32				; solicitando 32 Bytes de memoria
	call malloc				; llamamos a malloc que devuelve en rax
				            ; el puntero a la memoria solicitada
;guardando
	mov qword [rax+off_list_data_type], 3
	mov qword [rax+off_list_remove], listDelete
	mov qword [rax+off_list_print], listPrint
	mov qword [rax+off_list_first], NULL

	pop rbp 	
	ret
	
; list_t* listAddFirst(list_t* l, void* data);16
listAddFirst:
	push rbp
	mov rbp,rsp
	push rsi
	push r12
	push r13
	push rdi

	;(rdi puntero a l)
	;(rsi puntero a data)
	mov r13, rdi
	mov rdi, 16
	call malloc
	mov r12, [r13+off_list_first]
	mov [rax+off_nodo_data], rsi ; 
	mov [rax+off_nodo_next], r12 ; siguiente de data es el primero actual
	mov [r13+off_list_first], rax ; el primero es data

	pop rdi
	mov rax, rdi
	pop r13
	pop r12
	pop rsi
	pop rbp
	ret
	
; list_t* listAddLast(list_t* l, void* data);24
listAddLast:
	push rbp
	mov rbp,rsp
	push r12
	push rdi
	;(rdi puntero a l)
	;(rsi puntero a data)
;ifNULL
	mov r12, [rdi+off_list_first]
	cmp r12, NULL
	je agregarPrimeroLast
	jmp ifTieneSiguiente
avanzarLast:
	mov r12, [r12+off_nodo_next]
ifTieneSiguiente:
	cmp qword [r12+off_nodo_next], NULL
	jne avanzarLast

	mov rdi, 16
	call malloc
	mov qword [rax+off_nodo_next], NULL
	mov [rax+off_nodo_data], rsi
	mov [r12+off_nodo_next], rax
	jmp finAddLast
agregarPrimeroLast:
	call listAddFirst	
finAddLast:
	pop rdi
	mov rax, rdi
	pop r12
	pop rbp
	ret
	
; list_t* listAdd(list_t* l, void* data, funcCmp_t* f);43
listAdd:
	push rbp
	mov rbp,rsp
	push rsi
	push r12
	push r13
	push r14
	push r15
	push rdi

	;(rdi puntero a l)
	;(rsi puntero a data)
	;(rdx puntero a funcion)
	mov r12, rdi
	mov r13, rsi
	mov r14, [rdi+off_list_first]
	cmp r14, NULL
	je agregarAdelanteList
	mov rdi, [r14+off_nodo_data]
	call rdx
	cmp rax, -1
	je agregarAdelanteList
cicloListAdd:
	cmp qword [r14+off_nodo_next], NULL
	je agregarAtrasList
	mov r15, [r14+off_nodo_next]
	mov r15, [r15+off_nodo_data]
	mov rdi, r15
	call rdx
	cmp rax, -1
	je agregarMedioList
	mov r14, [r14+off_nodo_next]
	jmp cicloListAdd

agregarAtrasList:
	mov rdi, r12
	mov rsi, r13
	call listAddLast
	jmp finagregarListFun
agregarMedioList:
;agregar nodo con dato como siguiene a r14
	mov rdi, 16
	call malloc
	mov r15, [r14+off_nodo_next]
	mov [rax+off_nodo_data], r13 ; 
	mov [rax+off_nodo_next], r15 ; siguiente de data es el primero actual
	mov [r14+off_nodo_next], rax ; el primero es data
	jmp finagregarListFun
agregarAdelanteList:
	mov rdi, r12
	mov rsi, r13
	call listAddFirst
finagregarListFun:

	pop rdi
	mov rax, rdi
	pop r15
	pop r14
	pop r13
	pop r12
	pop rsi
	pop rbp
	ret
	
; list_t* listRemove(list_t* l, void* data, funcCmp_t* f);36
listRemove:
	push rbp
	mov rbp,rsp
	push r12
	push r13
	push r14
	push r15
	push rcx
	sub rsp, 8
	mov r15, rdi ;puntero a la lista guardado
	;(rdi puntero a l)
	;(rsi puntero a data)
	;(rdx puntero a fun)
	mov r12,[rdi+off_list_first]
	cmp r12, NULL
	je finRemFun
	mov r14, [r12+off_nodo_data]
	mov r14, [r14+off_list_remove] ;(coinciden los remove de las estructuras, sino cambiar)
cicloRemFun:
	mov r13, r12
	mov r12, [r12+off_nodo_next]
	cmp r12, NULL
	je finRemFun
	mov rdi, [r12+off_nodo_data]
	call rdx
	cmp rax, 0
	jne cicloRemFun
	mov rcx, [r12+off_nodo_next]
	mov [r13+off_nodo_next], rcx
	mov rdi, [r12+off_nodo_data]
	call r14
	jmp cicloRemFun
finRemFun:
	mov rdi, [r13+off_nodo_data]
	call rdx
	cmp rax, 0
	jne RemLast
	mov rdi, r15
	call listRemoveLast
RemLast:
	mov rdi, [r15+off_list_first]
	cmp rdi, NULL
	je RemFirt
	mov rdi, [rdi+off_nodo_data]
	call rdx
	cmp rax, 0
	jne RemFirt
	mov rdi, r15
	call listRemoveFirst
RemFirt:
	add rsp,8
	pop rcx
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbp
	ret
	
; list_t* listRemoveFirst(list_t* l);19
listRemoveFirst:
	push rbp
	mov rbp,rsp
	push r12
	push r13
	push r14
	push rsi
	push rdi
	sub rsp, 8
	;(rdi puntero a l)

	cmp qword [rdi+off_list_first], NULL
	je finlistRemFi
;reencadenamiento
	mov r12, [rdi+off_list_first]
	mov r14, r12
	mov r13, [r12+off_nodo_next]
	mov [rdi+off_list_first], r13 ; lista apunta al siguiente elemento
;borrar nodo	
	mov rdi,[r12+off_nodo_data]
	mov r12, [rdi+off_remove]
	call r12
	mov rdi, r14
	call free
	mov qword [r14], NULL
finlistRemFi:
	add rsp, 8

	pop rdi
	mov rax, rdi
	pop rsi
	pop r14
	pop r13
	pop r12
	pop rbp
	ret
	
; list_t* listRemoveLast(list_t* l);25
listRemoveLast:
	push rbp
	mov rbp,rsp
	push r12
	push r13
	push r14
	push r15
	mov r15, rdi ;puntero a la lista guardado
	;(rdi puntero a l)

	mov r12, [rdi+off_list_first]
	cmp r12, NULL
	je finListRemLa
cicloListRemLa:
	mov r14, r13
	mov r13, r12
	mov r12, [r12+off_nodo_next]
	cmp r12, NULL
	jne cicloListRemLa
	cmp [r14+off_nodo_next], r13
	je sacarUltimo
	call listRemoveFirst
	jmp finListRemLa
sacarUltimo:
	mov qword [r14+off_nodo_next], NULL
	mov r12,[r13+off_nodo_data]
	mov r12, [r12+off_list_remove];(coinciden los remove de las estructuras, sino cambiar)
	mov rdi, [r13+off_nodo_data]
	call r12
finListRemLa:
	mov rdi, r15
	mov rax, r15
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbp
	ret
	
; void listDelete(list_t* l);20
listDelete:
	push rbp
	mov rbp,rsp
	push rdi
	push rsi
	push r12
	push r13
	push r14
	push r15
	;(rdi puntero a l)
	mov r13, rdi
	mov r12, [rdi+off_list_first]
	cmp r12, NULL
	je finListDelete
	mov r15, [r12+off_nodo_next]
	mov [rdi+off_list_first], r15 ; lista apunta al segundo elemento
	mov rsi, r12
	mov r12, [r12+off_nodo_data]
	mov r14, [r12+off_remove]
	mov rdi, r12
	call r14
	mov rdi, rsi
	call free
	mov rdi,r13
	call listDelete
finListDelete:
	mov qword [rdi], NULL
	pop r15
	pop r14
	pop r13
	pop r12
	pop rsi
	pop rdi
	pop rbp
	ret
	
; void listPrint(list_t* m, FILE *pFile);35
listPrint:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	push rcx
	push r12
	push r13
	push r14
	push r15

	mov r12, rdi
	mov r13, rsi
	mov r14, [rdi+off_list_first]
	mov rdi, r13
	mov rsi, fprintf_s
	mov rdx, fprintf_corcheteI
	call fprintf
	cmp r14, NULL
	je finListPrint
	mov rsi, r13
	jmp ifListPrint
cicloListPrint:
;print elemento
	mov r15, [r14+off_nodo_data]
	mov rcx, [r15+off_print] ; rdi puntero a funcion de la estructura a printear
	mov rdi, r15 ; rdi puntero a estructura a printear
	call rcx
	mov r14, [r14+off_nodo_next]
;print coma
	mov rdi, r13
	mov rsi, fprintf_s
	mov rdx, fprintf_coma
	call fprintf
	mov rsi, r13
ifListPrint:
	cmp qword [r14+off_nodo_next], NULL
	jne cicloListPrint
	mov r15, [r14+off_nodo_data]
	mov rcx, [r15+off_print] ; rdi puntero a funcion de la estructura a printear
	mov rdi, r15 ; rdi puntero a estructura a printear
	call rcx

finListPrint:	
	mov rdi, r13
	mov rsi, fprintf_s
	mov rdx, fprintf_corcheteF
	call fprintf

	pop r15
	pop r14
	pop r13
	pop r12
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop rbp
	ret
	
;########### Funciones: String

; string_t* strNew();11
strNew:
	push rbp
	mov rbp, rsp
	push rdi
	push r12

;reservandoMem
	mov rdi, 32				; solicitando 32 Bytes de memoria
	call malloc				; llamamos a malloc que devuelve en rax
				            ; el puntero a la memoria solicitada
	mov r12, rax				            
;guardando
	mov qword [rax+off_string_data_type], 2
	mov qword [rax+off_string_remove], strDelete
	mov qword [rax+off_string_print], strPrint
	mov qword [rax+off_string_data], NULL
	mov rax, r12
	
	pop r12
	pop rdi
	pop rbp
	ret
	
; string_t* strSet(string_t* s, char* c);14
strSet:
	push rbp
	mov rbp, rsp
	push r12
	push rdi
	push rsi
	sub rsp, 8

	;rdi(puntero a la estructura s)
	;rsi(puntero a la estructura c)
	mov r12, rdi ; r12 puntero a estructura
	call strRemove ; estructura no tiene data
	mov rdi, rsi
	call str_copy ; puntero de copia de C en rax, rdi puntero a char c
	mov qword [r12+off_string_data], rax ; registro a memoria 
	mov rax, r12 ; rax puntero a estructura

	add rsp, 8
	pop rdi
	pop rsi
	pop r12
	pop rbp
	ret
	
; string_t* strAddRight(string_t* s, string_t* d);21
strAddRight:
;aridad de char* str_concat(char* a, char* b)
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push r12
	push r13

	;(rdi puntero a struct s)
	;(rsi puntero a struct d)
;concat
	mov r12, rdi
	mov r13, rsi
	mov rdi, [r12+off_string_data]
	mov rsi, [r13+off_string_data]
	call str_concat ; puntero a concat
	mov [r12+off_string_data], rax; puntero a concat
	call free
	cmp r12, r13
	je finStrRight
;delete d
	mov rdi, r13 ; rdi apunta a d
	call strDelete
finStrRight:
	mov rax, r12

	pop r13
	pop r12
	pop rsi
	pop rdi
	pop rbp
	ret
	
; string_t* strAddLeft(string_t* s, string_t* d);21
strAddLeft:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push r12
	push r13

	;(rdi puntero a struct s)
	;(rsi puntero a struct d)
;concat
	mov r12, rdi
	mov r13, rsi
	mov rdi, [r13+off_string_data]
	mov rsi, [r12+off_string_data]
	call str_concat ; puntero a concat
	mov rdi, [r12+off_string_data] ; puntero a liberar
	mov [r12+off_string_data], rax; puntero a concat
	call free
	cmp r12, r13
	je finStrLeft
;delete d
	mov rdi, r13 ; rdi apunta a d
	call strDelete
finStrLeft:
	mov rax, r12

	pop r13
	pop r12
	pop rsi
	pop rdi
	pop rbp
	ret
	
; string_t* strRemove(string_t* s);11
strRemove:
	push rbp
	mov rbp, rsp
	push r12
	push rdi
	push rsi
	sub rsp, 8

	;rdi(puntero)
	mov r12, rdi ; r12 puntero a estructura
	cmp qword [rdi+off_string_data], NULL
	je finstrRemove
;liberarMemoria
	mov rdi, [rdi+off_string_data] 	; llendo a la locacion donde va la data
	call free 				; liberando memoria del dato
	mov qword [r12+off_string_data], NULL
	jmp finstrRemove
finstrRemove:
	mov rax, r12 ; regresando el puntero al inicio

	add rsp, 8
	pop rsi
	pop rdi
	pop r12
	pop rbp	
	ret
	
; void strDelete(string_t* s);6
strDelete:
	push rbp
	mov rbp, rsp
	call strRemove
	call free
	pop rbp
	ret
	
; int32_t strCmp(string_t* a, string_t* b);3
strCmp:
	mov rdi, [rdi+off_string_data]
	mov rsi, [rsi+off_string_data]
	call str_cmp
	ret
	
; void strPrint(string_t* m, FILE *pFile);13
strPrint:
	push rbp
	mov rbp, rsp
	push rdx
	push rdi
	push rsi
	sub rsp,8
	;(integer_t * en rdi) 
	;(FILE* en rsi)
	mov rdx,[rdi+off_int_data] ; rdx puntero a data
;preparandoFPRINTF
	mov rdi, rsi
	mov rsi, fprintf_s
;ifNull
	cmp rdx, NULL
	je printStrNULL
printValor:
	mov rsi, rdx
	jmp finPrintStr
printStrNULL:
	mov rdx, fprintf_null
finPrintStr:
	call fprintf

	add rsp, 8
	pop rsi
	pop rdi
	pop rdx
	pop rbp
	ret
	
;########### Funciones: Entero

; integer_t* intNew();11
intNew:
	push rbp
	mov rbp, rsp

;reservandoMem
	mov rdi, 32				; solicitando 32 Bytes de memoria
	call malloc				; llamamos a malloc que devuelve en rax
				            ; el puntero a la memoria solicitada
;guardando
	mov qword [rax+off_int_data_type], 1
	mov qword [rax+off_int_remove], intDelete
	mov qword [rax+off_int_print], intPrint
	mov qword [rax+off_int_data], NULL	

	pop rbp
	ret
	
; integer_t* intSet(integer_t* i, int d);15
intSet:
	push rbp
	mov rbp, rsp
	push rdi
	push r12

	;rdi(puntero)
	;rsi(entero)
	call strRemove
	mov r12, rdi ; r12 puntero a estructura
;ifNotNULL
	;cmp qword [rdi+off_int_data], NULL
	;jne asignar
;pedirMemoria:
	mov rdi, 8
	call malloc		; llamamos a malloc que devuelve en rax
				    ; el puntero a la memoria solicitada
;asignar:	
	mov [RAX], rsi 					 ; asignando data  
	mov [r12+off_int_data], RAX  					 ; asignando puntero
;el puntero quedo guardado en la posicion correspondiente y en rax(para retorno)
;reestableciendoAlineado

	mov rax, r12
	pop r12
	pop rdi
	pop rbp
	ret
	
; integer_t* intRemove(integer_t* i);11
intRemove:
	push rbp
	mov rbp, rsp
	push r12
	push rdi

	;rdi(puntero a estructura)
;ifNULL
	mov r12, rdi
	cmp qword [rdi+off_int_data], NULL
	je finIntRemove
;liberarMemoria
	mov rdi, [r12+off_int_data] ; rdi tiene el puntero a data
	call free 				; liberando memoria del dato
	mov qword [r12+off_int_data], NULL
finIntRemove:

	pop rdi
	mov rax, rdi
	pop r12
	pop rbp
	ret
	
; void intDelete(integer_t* i);6
intDelete:
	push rbp
	mov rbp, rsp
	call intRemove
	call free
	pop rbp
	ret
	
; int32_t intCmp(integer_t* a, integer_t* b);10
intCmp:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi

	mov rdi, [rdi+off_int_data]
	mov rsi, [rsi+off_int_data]
	cmp rdi, rsi
	jg bMayor
	jl aMayor
	xor rax, rax ;son iguales
	jmp fin
bMayor:
	mov rax, 0x1
	jmp fin
aMayor:
	mov rax, 0x-1
fin:
	pop rsi
	pop rdi
	pop rbp
	ret
	
; void intPrint(integer_t* m, FILE *pFile);14
intPrint:
;int fprintf (FILE *stream, const char *format)(d or i) : Signed decimal integer
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	push r12
	push r13
	push r14
	;(integer_t * en rdi) 
	;(FILE* en rsi)
	mov r12, rdi ; r12 tiene puntero al int
	;mov r13, rsi ; r13 tiene puntero a file
;preparandoFPRINTF
	mov rdi, rsi
;ifNull
	mov rdx,[r12+off_int_data]
	cmp rdx, NULL
	je printIntNULL
;printValor
	mov rsi, fprintf_d
	mov rdx, [rdx]
	jmp printINT
printIntNULL:
	mov rsi, fprintf_s
	mov rdx, fprintf_null 
printINT:
	call fprintf

	pop r14
	pop r13
	pop r12
	pop rdx
	pop rsi
	pop rdi
	pop rbp
	ret
	