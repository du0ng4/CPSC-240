; Assignment #2
; CPSC 240-07 MW 10:00am-11:50am
; Program Name: Arrays

extern printf
extern scanf
extern displayArray
extern reverse

global manager

segment .data
    	welcome db "This program will reverse your array of integers.", 10, 0
    	prompt db "Enter a sequence of long integers separated by a white space. After the last input press enter followed by Control+D: ", 10, 0
    	outputNumbers db "These numbers were received and placed in the array: ", 10, 0
    	outputReverse db "After the reverse function these are the numbers of the array in the new order:", 10, 0
    	result db "The number of numbers entered is %ld and the mean is %ld", 10, 0
    	exit db "The mean will now be returned to the main function.", 10, 0
    	integerFormat db "%ld", 0
    	testArray dd 12, 3, 464
segment .bss
    	arr resq 300 ; reserve array

segment .text
manager:
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

	mov rax, 0
	mov rdi, welcome    ; "This program will reverse your array of integers."
	call printf

	; prompt user for input
	mov rax, 0
	mov rdi, prompt     ; "Enter a sequence of long integers separated by a white space. After the last input press enter followed by Control+D: "
	call printf

	mov r15, 0          ; used as a counter
    
    	beginloop:
    	push qword -3
    	mov rdi, integerFormat
    	mov rsi, rsp
    	mov rax, 0
    	call scanf
   	pop r14
    	cdqe
    	cmp rax, -1
    	je outofloop
    	mov qword [arr+r15*8], r14
    	add r15, 1
    	jmp beginloop
    	outofloop:

    	mov r13, r15                    ; r13 holds size of array

    	; output contents of array
    	mov rax, 0
    	mov rdi, outputNumbers          ; "These numbers were received and placed in the array: "
    	call printf
    	mov rax, 0
    	mov rdi, arr
    	mov rsi, r13
    	call displayArray

    	; Reverse the array
    	mov rax, 0
    	mov rdi, outputReverse      ; "After the reverse function these are the numbers of the array in the new order:"
    	call printf
    	mov rax, 0
    	mov rdi, arr
    	mov rsi, r15
    	call reverse                ; reverses content of array
    	mov rax, 0
    	mov rdi, arr
    	mov rsi, r13
    	call displayArray           ; outputs the array

    	; calculate the mean
    	mov r15, 0
    	mov rax, 0
    	sumLoop:
    	add rax, [arr+r15*8]
    	add r15, 1
    	cmp r15, r13
    	jl sumLoop
    	cqo
    	idiv r13
    	mov r12, rax

    	mov rax, 0
    	mov rdi, result         ; "The number of numbers entered is %ld and the mean is %ld"
    	mov rsi, r13
    	mov rdx, r12
   	call printf

    	mov rax, 0
    	mov rdi, exit           ; "The mean will now be returned to the main function."
    	call printf

    	pop rax                 ; remove -1 from stack

    
    	mov rax, r12            ; moves the mean into rax
    	
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
    
    	ret
