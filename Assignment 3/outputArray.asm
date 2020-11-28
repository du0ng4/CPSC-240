; Author Information:
; 		Author: Andy Duong
; 		Author email: aqduong@csu.fullerton.edu
; 		Class: CPSC 240-07	MW 10:00am-11:50am
; Program Information:
; 		Assignment #3
; 		Program Name: Largest Number
; 		Files in program: largest.cpp, outputArray.asm, inputArray.c, findLargest.asm, manager.asm
;		Purpose: To practice the usage of passing arrays withing different functions of different languages
; This File:
;		outputArray.asm    outputs array that is passed to this function
; 		Compile: nasm -f elf64 -o outputArray.o outputArray.asm

extern printf

global outputArray

segment .data
	integerFormat db "%ld", 0
	blankspace db " ", 0
	newline db "",10, 0
segment .bss
	; no uninitialized arrays in function
segment .text
outputArray:

	; ============= Saves pointer to array and size =============================
	mov r14, rdi    		; r14 holds pointer to passed array
	mov r13, rsi    		; r13 holds size of passed array


	; ============= Initializes counter for loop ================================
	mov r15, 0  			; r15 is counter


	; ============= Loops through array and prints out each cell ================
	beginloop:
	mov rax, 0
	mov rdi, integerFormat
	mov rsi, [r14+r15*8]
	call printf
	mov rax, 0
	mov rdi, blankspace     ; display a blank space between each number
	call printf
	add r15, 1
	cdqe
	cmp r15, r13
	jl beginloop


	; ============= Prints a newline after done looping ===========================
	mov rax, 0
	mov rdi, newline        ; newline
	call printf

	ret
