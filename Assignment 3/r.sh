echo "removing preexisting .o and .out files"
rm *.o
rm *.out

echo "assembling x86 source files"
nasm -f elf64 -o manager.o manager.asm
nasm -f elf64 -o outputArray.o outputArray.asm
nasm -f elf64 -o findLargest.o findLargest.asm

echo "assembling the driver module"
g++ -c -m64 -Wall -std=c++17 -o largest.o largest.cpp -no-pie -fno-pie

echo "compiling the inputArray function source code"
gcc -c -m64 -Wall -std=c11 -o inputArray.o inputArray.c -no-pie -fno-pie

echo "linking object files"
g++ -m64 -no-pie -fno-pie -std=c++17 -o assignment3.out largest.o manager.o outputArray.o findLargest.o inputArray.o

echo "executing program\n"
./assignment3.out
