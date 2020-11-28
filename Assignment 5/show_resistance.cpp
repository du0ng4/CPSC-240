//  Author Information:
//      Author: Andy Duong
//      Author email: aqduong@csu.fullerton.edu
//      Class: CPSC 240-07	MW 10:00am-11:50am
//  Program Information:
//      Assignment #5
//      Program Name: Parallel Circuits
//      Files in program: ohm.cpp, resistance.asm, get_resistance.c, compute_resistance.cpp, show_resistance.cpp
//  This File:
//      show_resistance.cpp     outputs the calculated resistance and time to compute
//      Compile: g++ -c -m64 -Wall -std=c++17 -o show_resistance.o show_resistance.cpp -no-pie -fno-pie

#include <stdio.h>

extern "C" void show_resistance(double, double);

void show_resistance(double total, double time) {

    printf("The total resistance of the system is %.2lf ohms, which required %.2lf ns to compute.\n", total, time);

	return;
}