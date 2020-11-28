// Author Information:
// 	Author: Andy Duong
// 	Author email: aqduong@csu.fullerton.edu
// 	Class: CPSC 240-07	MW 10:00am-11:50am
// Program Information:
// 	Assignment #4
// 	Program Name: Area of Triangle
// 	Files in program: Heron.cpp, triangle.asm, get_sides.c, compute_area.asm, show_results.cpp
// This File:
//	get_sides.c    function takes in user input as the lengths of the triangle's sides
//	Compile: g++ -c -m64 -Wall -std=c++17 -o get_sides.o get_sides.c -no-pie -fno-pie

#include <stdio.h>

void get_sides(double *, double *, double *);

void get_sides(double *a, double *b, double *c) {
        scanf("%lf", a);
        scanf("%lf", b);
        scanf("%lf", c);

        return;
}

