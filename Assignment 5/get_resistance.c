//  Author Information:
//      Author: Andy Duong
//      Author email: aqduong@csu.fullerton.edu
//      Class: CPSC 240-07	MW 10:00am-11:50am
//  Program Information:
//      Assignment #5
//      Program Name: Parallel Circuits
//      Files in program: ohm.cpp, resistance.asm, get_resistance.c, compute_resistance.cpp, show_resistance.cpp
//  This File:
//      get_resistance.c    gets user input for each circuit resistance
//      Compile: gcc -c -m64 -Wall -std=c11 -o get_resistance.o get_resistance.c -no-pie -fno-pie

#include "stdio.h"

void get_resistance(double *,double *, double *, double *);

void get_resistance(double *circuit1,double *circuit2, double *circuit3, double *circuit4)
{
    scanf("%lf", circuit1);
    scanf("%lf", circuit2);
    scanf("%lf", circuit3);
    scanf("%lf", circuit4);
    return;
}
