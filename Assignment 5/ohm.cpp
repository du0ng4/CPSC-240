//  Author Information:
//      Author: Andy Duong
//      Author email: aqduong@csu.fullerton.edu
//      Class: CPSC 240-07	MW 10:00am-11:50am
//  Program Information:
//      Assignment #5
//      Program Name: Parallel Circuits
//      Files in program: ohm.cpp, resistance.asm, get_resistance.c, compute_resistance.cpp, show_resistance.cpp
//  This File:
//      ohm.cpp    driver for program
//      Compile: g++ -c -m64 -Wall -std=c++17 -o ohm.o ohm.cpp -no-pie -fno-pie


#include <stdio.h>
#include <iostream>

extern "C" double resistance();

int main()
{
	double total;

	std::cout << "Welcome to Parallel Circuits by Andy Duong." << std::endl;

	total = resistance();

	std::cout << "Main received this number: " << total << std::endl;
	std::cout << "Main will now return 0 to the operating system." << std::endl;

	return 0;
}