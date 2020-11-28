#!/bin/bash

rm *.o
rm *.out

echo "Assemble x86 source file"
nasm -f elf64 -o computeArea.o computeArea.asm

echo "Compile the driver module"
gcc -c -m64 -Wall -std=c11 -o egyptian.o egyptian.c -no-pie -fno-pie

echo "Link the two object files"
gcc -m64 -Wall -std=c11 -o assignment1.out computeArea.o egyptian.o -no-pie -fno-pie

echo "run the program"
./assignment1.out
