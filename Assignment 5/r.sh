# Bash File used to compile/assemble, link, and run program

echo "removing preexisting .o and .out files"
rm *.o
rm *.out

echo "Compiling driver module"
g++ -c -m64 -Wall -std=c++17 -o ohm.o ohm.cpp -no-pie -fno-pie

echo "Compiling x86 source files"
nasm -f elf64 -o resistance.o resistance.asm

echo "Compiling C source files"
gcc -c -m64 -Wall -std=c11 -o get_resistance.o get_resistance.c -no-pie -fno-pie

echo "Compiling C++ source files"
g++ -c -m64 -Wall -std=c++17 -o show_resistance.o show_resistance.cpp -no-pie -fno-pie
g++ -c -m64 -Wall -std=c++17 -o compute_resistance.o compute_resistance.cpp -no-pie -fno-pie

echo "linking object files"
g++ -m64 -no-pie -fno-pie -std=c++17 -o assignment5.out ohm.o resistance.o get_resistance.o show_resistance.o compute_resistance.o 


echo "executing program\n"
./assignment5.out