# Bash File used to compile/assemble, link, and run program

echo "removing preexisting .o and .out files"
rm *.o
rm *.out

echo "Compiling driver module"
g++ -c -m64 -Wall -std=c++17 -o Heron.o Heron.cpp -no-pie -fno-pie

echo "Compiling x86 source files"
nasm -f elf64 -o triangle.o triangle.asm
nasm -f elf64 -o compute_area.o compute_area.asm

echo "Compiling C source files"
gcc -c -m64 -Wall -std=c11 -o get_sides.o get_sides.c -no-pie -fno-pie

echo "Compiling C++ source files"
g++ -c -m64 -Wall -std=c++17 -o show_results.o show_results.cpp -no-pie -fno-pie

echo "linking object files"
g++ -m64 -no-pie -fno-pie -std=c++17 -o assignment4.out Heron.o triangle.o get_sides.o compute_area.o show_results.o


echo "executing program\n"
./assignment4.out