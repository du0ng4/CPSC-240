; Assignment #2
; CPSC 240-07 MW 10:00am-11:50am
; Program Name: Arrays

extern printf

global displayArray

segment .data
    integerFormat db "%ld", 0
    passed db "passed", 10, 0
    blankspace db " ", 0
    newline db "",10, 0
segment .bss

segment .text
displayArray:

    mov r14, rdi    ; r14 holds pointer to passed array
    mov r13, rsi    ; r13 holds size of passed array

    mov r15, 0  ; counter

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

    mov rax, 0
    mov rdi, newline        ; adds a newline
    call printf

    ret
