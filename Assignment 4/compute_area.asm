; Author Information:
; 	Author: Andy Duong
; 	Author email: aqduong@csu.fullerton.edu
; 	Class: CPSC 240-07	MW 10:00am-11:50am
; Program Information:
; 	Assignment #4
; 	Program Name: Area of Triangle
; 	Files in program: Heron.cpp, triangle.asm, get_sides.c, compute_area.asm, show_results.cpp
; This File:
;	compute_area.asm    function computes the area of a triangle given 3 sides using Heron's formula
;	Compile: g++ -c -m64 -Wall -std=c++17 -o compute_area.o compute_area.asm -no-pie -fno-pie

extern printf

global compute_area

segment .data
    	floatFormat db "%lf", 10, 0
    	define2 dq 2
segment .bss
	
segment .text
compute_area:

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


	;====================== Store arguments in stable xmm register ===========================
	movsd xmm13, xmm0
	movsd xmm14, xmm1
	movsd xmm15, xmm2


	;====================== Calcuate the area using Heron's formula ==========================
	; Calculate S, which will be stored in xmm8   
	movsd xmm8, xmm13
	addsd xmm8, xmm14
	addsd xmm8, xmm15
	cvtsi2sd xmm9, [define2]	; converts long integer of 2 to double for use in division
	divsd xmm8, xmm9

	; Calculate S(S-a)(S-b)(S-c)
	movsd xmm9, xmm8
	subsd xmm9, xmm13
	mulsd xmm9, xmm8
	movsd xmm10, xmm8
	subsd xmm10, xmm14
	mulsd xmm9, xmm10
	movsd xmm10, xmm8
	subsd xmm10, xmm15
	mulsd xmm9, xmm10

	; Calculate the square root of product
	sqrtsd xmm9, xmm9


	;====================== Move calculated area to xmm0 to be returned ======================
	movsd xmm0, xmm9


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