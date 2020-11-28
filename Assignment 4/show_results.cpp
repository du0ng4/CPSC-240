// Author Information:
//      Author: Andy Duong
// 	Author email: aqduong@csu.fullerton.edu
// 	Class: CPSC 240-07	MW 10:00am-11:50am
// Program Information:
// 	Assignment #4
// 	Program Name: Area of Triangle
// 	Files in program: Heron.cpp, triangle.asm, get_sides.c, compute_area.asm, show_results.cpp
// This File:
//	show_results.cpp    function prints out results of program (inputted sides & area)
//	Compile: g++ -c -m64 -Wall -std=c++17 -o show_results.o show_results.cpp -no-pie -fno-pie

#include "stdio.h"

extern "C" void show_results(double, double, double, double);

void show_results(double s1, double s2, double s3, double area) {
	if (area == 0) {
		printf("No such triangle exists\n");
	}    
	else {
		printf("The area of a triangle with sides %.3lf, %.3lf, and %.3lf is %.3lf square units.\n", s1, s2, s3, area);
	}
	return;
}