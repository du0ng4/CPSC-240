rm *.o
rm *.out

echo "Assemble x86 assembly source files"
nasm -f elf64 -o manager.o manager.asm
nasm -f elf64 -o Display_Array.o Display_Array.asm

echo "Compile the driver module"
gcc -c -m64 -Wall -std=c11 -o main.o main.c -no-pie -fno-pie

echo "compile the reverse function source file"
g++ -c -m64 -Wall -std=c++17 -o reverse.o reverse.cpp -no-pie -fno-pie

echo "link object files"
g++ -m64 -no-pie -fno-pie -std=c++17 -o assignment2.out Display_Array.o main.o reverse.o manager.o

echo "run the program"
echo " "
./assignment2.out