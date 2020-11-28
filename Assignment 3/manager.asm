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
;		manager.asm    "main" of the program
; 		Compile: nasm -f elf64 -o manager.o manager.asm


extern outputArray
extern inputArray
extern findLargest
extern scanf	
extern printf

global manager

segment .data
	weclome db "The manager is here to assist you.", 10, 10, 0
	output db "These values were received: ", 0
	received db "There is a total of %ld received.", 10, 0
	goodbye db "The manager will now return the count and the largest number to the driver.", 10, 0
	integerFormat db "%ld", 10, 0
segment .bss
	myArray resq 25			; Holds user input of long ints
	returnArray resq 2		; Holds return values
segment .text
manager:

	;====================== Back up Registers =============================================
	push rbp		;Save a copy of the stack base pointer
	mov rbp, rsp 	;We do this in order to be 100% compatible with C and C++.
	push rbx		;Back up rbx
	push rcx		;Back up rcx
	push rdx		;Back up rdx
	push rsi		;Back up rsi
	push rdi		;Back up rdi
	push r8			;Back up r8
	push r9			;Back up r9
	push r10		;Back up r10
	push r11		;Back up r11
	push r12		;Back up r12
	push r13		;Back up r13
	push r14		;Back up r14
	push r15		;Back up r15
	pushf			;Back up rflags


	;====================== Show welcome message =============================================
	mov rax, 0
	mov rdi, weclome        ; "The manager is here to assist you."
	call printf
    

	;====================== Call function to add user input to array ========================
	mov rax, 0
	mov rdi, myArray
	mov rsi, 25             ; 25 = maximum size of myArray
	call inputArray         ; Calls function to fill array with user input
	mov r13, rax            ; r13 now holds number of numbers in myArray


	;===================== Print output message ==============================================
	mov rax, 0
	mov rdi, output
	call printf


	;====================== Call function to output array contents ============================
	mov rax, 0
	mov rdi, myArray        ; argument 1: pointer to myArray
	mov rsi, r13            ; argument 2: number of numbers in array
	call outputArray        ; Calls function to display contents of array


	;====================== Print out number of numbers received in input =====================
	mov rax, 0
	mov rdi, received       ; "There is a total of %ld received."
	mov rsi, r13            ; argument 2: numbers in array
	call printf


	;====================== Call function to find and print largest number in array ===========
	mov rax, 0
	mov rdi, myArray        ; argument 1: pointer to myArray
	mov rsi, r13            ; argument 2: numbers in array
	call findLargest        ; Calls function to find largest number in array
	mov r15, rax


	;====================== Print out goodbye message ==========================================
	mov rax, 0
	mov rdi, goodbye        ; "The manager will now return the count and the largest number to the driver."
	call printf

	;===================== Moves size of array and largest number to array to be returned to driver ========
	mov [returnArray+0*8], r13
	mov [returnArray+1*8], r15
	mov rax, returnArray    

	;===================== Restore Registers ==========================================================
	popf			;Restore rflags
	pop r15			;Restore r15
	pop r14			;Restore r14
	pop r13			;Restore r13
	pop r12			;Restore r12
	pop r11			;Restore r11
	pop r10			;Restore r10
	pop r9			;Restore r9
	pop r8			;Restore r8
	pop rdi			;Restore rdi
	pop rsi			;Restore rsi
	pop rdx			;Restore rdx
	pop rcx			;Restore rcx
	pop rbx			;Restore rbx
	pop rbp			;Return rbp to point to the base of the activation record of the caller.

	ret


