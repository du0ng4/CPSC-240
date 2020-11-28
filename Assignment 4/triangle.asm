; Author Information:
;	Author: Andy Duong
; 	Author email: aqduong@csu.fullerton.edu
; 	Class: CPSC 240-07	MW 10:00am-11:50am
; Program Information:
; 	Assignment #4
; 	Program Name: Area of Triangle
; 	Files in program: Heron.cpp, triangle.asm, get_sides.c, compute_area.asm, show_results.cpp
; This File:
;	triangle.asm    "manager" for program
;	Compile: g++ -c -m64 -Wall -std=c++17 -o triangle.o triangle.asm -no-pie -fno-pie

extern printf
extern scanf
extern get_sides
extern compute_area
extern show_results

global triangle

segment .data
	welcome db "The manager is here to help you find the area of your triangle.", 10, 0
	prompt1 db "Input your 3 floating point numbers representing the sides of a triangle.", 10, 0
	prompt2 db "Separate each number with a white space.", 10, 0
	goodbye db "The area will be returned to Heron.", 10, 0
	floatFormat db "%lf", 10, 0
segment .bss
	side1 resq 1
	side2 resq 1
	side3 resq 1
segment .text
triangle:

    	;====================== Back up Registers ================================================
	push rbp			; Save a copy of the stack base pointer
	mov rbp, rsp 			; We do this in order to be 100% compatible with C and C++.
	push rbx			; Back up rbx
	push rcx			; Back up rcx
	push rdx			; Back up rdx
	push rsi			; Back up rsi
	push rdi			; Back up rdi
	push r8				; Back up r8
	push r9				; Back up r9
	push r10			; Back up r10
	push r11			; Back up r11
	push r12			; Back up r12
	push r13			; Back up r13
	push r14			; Back up r14
	push r15			; Back up r15
	pushf				; Back up rflags


	;====================== Print welcome message ============================================
	mov rax, 0
	mov rdi, welcome		; "The manager is here to help you find the area of your triangle."	
	call printf


	;====================== Prompt user for side input =======================================
	mov rax, 0
	mov rdi, prompt1		; "Input your 3 floating point numbers representing the sides of a triangle."
	call printf
	mov rax, 0
	mov rdi, prompt2		; "Separate each number with a white space."
	call printf


	;====================== Get user input for sides =========================================
	mov rax, 0
	mov rdi, side1
	mov rsi, side2
	mov rdx, side3
	call get_sides
	; Copy to GPRs, only for backup		
	mov r13, [side1]
	mov r14, [side2]
	mov r15, [side3]
	; Save to stable xmm registers
	movsd xmm13, [side1]
	movsd xmm14, [side2]
	movsd xmm15, [side3]


	;====================== Calculate the area of the triangle ===============================
	mov rax, 3
	movsd xmm0, xmm13
	movsd xmm1, xmm14
	movsd xmm2, xmm15
	call compute_area
	movsd xmm12, xmm0		; Save calculated area to stable xmm register


	;====================== Output the results ===============================================
	mov rax, 4
	movsd xmm0, xmm13
	movsd xmm1, xmm14
	movsd xmm2, xmm15
	movsd xmm3, xmm12
	call show_results		; Calls function to print out results

	
	;====================== Print Goodbye message ============================================
	mov rax, 0
	mov rdi, goodbye		; "The area will be returned to Heron."
	call printf


	;====================== Move area to xmm0 to return to driver ============================
	movsd xmm0, xmm12


	;====================== Restore Registers ================================================
	popf				; Restore rflags
	pop r15				; Restore r15
	pop r14				; Restore r14
	pop r13				; Restore r13
	pop r12				; Restore r12
	pop r11				; Restore r11
	pop r10				; Restore r10
	pop r9				; Restore r9
	pop r8				; Restore r8
	pop rdi				; Restore rdi
	pop rsi				; Restore rsi
	pop rdx				; Restore rdx
	pop rcx				; Restore rcx
	pop rbx				; Restore rbx
	pop rbp				; Return rbp to point to the base of the activation record of the caller.

	ret