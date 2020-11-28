;  Author Information:
;      Author: Andy Duong
;      Author email: aqduong@csu.fullerton.edu
;      Class: CPSC 240-07	MW 10:00am-11:50am
;  Program Information:
;      Assignment #5
;      Program Name: Parallel Circuits
;      Files in program: ohm.cpp, resistance.asm, get_resistance.c, compute_resistance.cpp, show_resistance.cpp
;  This File:
;      resistance.asm	"manager" of program
;      Compile: nasm -f elf64 -o resistance.o resistance.asm

extern printf
extern scanf
extern get_resistance
extern compute_resistance
extern show_resistance

global resistance

segment .data
    welcome db "This program will automate finding the resistance in a large circuit.", 10, 0
    prompt1 db "Please enter the resistance for each of the four circuits.", 10, 0
    prompt2 db "Separate the inputs by white spaces and press enter after the last value: ", 0
segment .bss
    circuit1 resq 1
    circuit2 resq 1
    circuit3 resq 1
    circuit4 resq 1
segment .text
resistance:
    ;====================== Back up Registers ================================================
	push rbp			; Save a copy of the stack base pointer
	mov rbp, rsp 		; We do this in order to be 100% compatible with C and C++.
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
    mov rdi, welcome    ; "This program will automate finding the resistance in a large circuit."
    call printf


	;====================== Prompt user for side input =======================================
	mov rax, 0
	mov rdi, prompt1		; "Please enter the resistance for each of the four circuits."
	call printf
	mov rax, 0
	mov rdi, prompt2		; "Separate the inputs by white spaces and press enter after the last value: "
	call printf


    ;====================== Get resistance of each circuit ===================================
	mov rax, 0
	mov rdi, circuit1
	mov rsi, circuit2
	mov rdx, circuit3
    mov rcx, circuit4
	call get_resistance
	; Copy to GPRs, only for backup		
    mov r12, [circuit1]
	mov r13, [circuit2]
	mov r14, [circuit3]
	mov r15, [circuit4]
	; Save to stable xmm registers
	movsd xmm12, [circuit1]
	movsd xmm13, [circuit2]
	movsd xmm14, [circuit3]
    movsd xmm15, [circuit4]


    ;====================== Calculate the total resistance and time ==========================
	; Get start time stamp
	cpuid
	rdtsc
	shl rdx, 32
	or rdx, rax
	mov r10, rdx

	; Calculate total resistance
    mov rax, 4
    movsd xmm0, xmm12
    movsd xmm1, xmm13
    movsd xmm2, xmm14
    movsd xmm3, xmm15
    call compute_resistance
	movsd xmm11, xmm0	

	; Get end time stamp
	cpuid
	rdtsc
	shl rdx, 32
	or rdx, rax
	mov r11, rdx

	; Calculate time to perform calculation of total resistance
	sub r11, r10
	mov rax, r11
	mov r9, 10
	imul r9
	mov r9, 36
	cqo
	idiv r9
	cvtsi2sd xmm10, rax


	;====================== Output results ===================================================
	mov rax, 2
	movsd xmm0, xmm11
	movsd xmm1, xmm10
	call show_resistance

	
	;====================== Copy total to xmm0 to be returned to main ========================
	movsd xmm0, xmm11


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