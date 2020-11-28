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
;		findLargest.asm    finds and prints out the largest number in the passed array
; 		Compile: nasm -f elf64 -o findLargest.o findLargest.asm


extern printf

global findLargest

segment .data
	largest db "The largest value %ld has been found at index %ld", 10, 10, 0
segment .bss
	; no uninitialized arrays in function
segment .text
findLargest:

	; ================ Saves pointer to array and size ================================================
	mov r14, rdi    		; r14 holds pointer to passed array
	mov r13, rsi    		; r13 holds size of passed array


	; ================ Initializes values for loop ====================================================
	mov r12, [r14+0*8]		; r12 holds largest number in array, initialized with number in cell 0
	mov r11, 0      		; r11 holds the index of largest number, initialized with 0
	mov r15, 1      		; used as counter, starts at 1 since cell 0 is already initialized as largest


	; ================ Loops through array to check if greater number is found =========================
	beginLoop:
	cmp r12, [r14+r15*8]
	jl assignLargest
	add r15, 1
	cmp r15, r13
	jl beginLoop
	jmp endLoop


	;================= Assigns current index as largest number ========================================
	assignLargest:			; jumps here to assign new largest number
	mov r12, [r14+r15*8]
	mov r11, r15
	add r15, 1
	jmp beginLoop
    

	endLoop:				; Jump here once looped through entire array
    
	;================= Outputs largest number ========================================================
	mov rax, 0
	mov rdi, largest
	mov rsi, r12
	mov rdx, r11
	call printf


	;================= Moves largest number to rax to be returned ====================================
	mov rax, r12

	ret