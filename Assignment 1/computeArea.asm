; computeArea function for Assignment 1
; Author: Andy Duong

extern printf
extern scanf

global computeArea
	p1_numerator equ 22
	p2_denominator equ 7
	max_str_length equ 100
	
segment .data
    welcome db "This area function is fondly brought to you by Andy Duong.", 10, 0
    promptUserRadius db "Please enter the radius of a circle in whole number of meters: ", 0
    confirmation db "The number %ld was recieved.", 10, 0
    answer db "The area of a circle with this radius is %ld and %ld/7 square meters.", 10, 0
    goodbye db "The integer part of the area will be returned to the main program. Please enjoy your circles.", 10, 0
    integerFormat db "%ld", 0
segment .bss

segment .text
computeArea:
	
	; Back up registers
	push rbp
	mov rbp, rsp
	push rbx
	push rcx
	push rdx
	push rdi
	push rsi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf
	; Makes number of pushes even
	push qword -1

    ; Print welcome text
    mov rax, 0	
    mov rdi, welcome
    call printf
    
    ; Prompt for radius
    mov rax, 0
    mov rdi, promptUserRadius
    call printf

    ; Input the radius
    push -1
    mov rdi, integerFormat
    mov rsi, rsp
    mov rax, 0
    call scanf
    pop r14

    ; Print confirmation
    mov rax, 0
    mov rdi, confirmation
    mov rsi, r14
    call printf

    ; Move inputed value into rax register and square
    mov rax, r14
    mul rax

    ; Multiply by 22
    mov r11, p1_numerator
    imul r11

    ; Divide by 7
    mov r15, p2_denominator
    idiv r15
   	; move quotient to r12
   	mov r12, rax
    ; move remainder to r13	
    mov r13, rdx   
 	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
 	; Print answer
 	mov rax, 0
 	mov rdi, answer
 	mov rsi, r12
 	; remainder already in rdx so no need to move
 	call printf

 	; Print goodbye
 	mov rax, 0
 	mov rdi, goodbye
 	call printf


 	; Remove -1 from stack
 	pop rax

 	; moves quotient to rax to be returned
 	mov rax, r12

 	; Pops remaining backups
 	popf
 	pop r15
 	pop r14
 	pop r13
 	pop r12
 	pop r11
 	pop r10
 	pop r9
 	pop r8
 	pop rsi
 	pop rdi
 	pop rdx
 	pop rcx
 	pop rbx
 	pop rbp


 	; return whole number answer to egyptian.c
    ret
