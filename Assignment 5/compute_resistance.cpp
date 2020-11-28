//  Author Information:
//      Author: Andy Duong
//      Author email: aqduong@csu.fullerton.edu
//      Class: CPSC 240-07	MW 10:00am-11:50am
//  Program Information:
//      Assignment #5
//      Program Name: Parallel Circuits
//      Files in program: ohm.cpp, resistance.asm, get_resistance.c, compute_resistance.cpp, show_resistance.cpp
//  This File:
//      compute_resistance.cpp     calculates the total resistance of the circuits
//      Compile: g++ -c -m64 -Wall -std=c++17 -o compute_resistance.o compute_resistance.cpp -no-pie -fno-pie

#include <stdio.h>

extern "C" double compute_resistance(double, double, double, double);

double compute_resistance(double circuit1, double circuit2, double circuit3, double circuit4)
{
    double total;

    circuit1 = 1 / circuit1;
    circuit2 = 1 / circuit2;
    circuit3 = 1 / circuit3;
    circuit4 = 1 / circuit4;

    total = circuit1 + circuit2 + circuit3 + circuit4;

    total = 1 / total;

    return total;
}