// Author Information:
// 	Author: Andy Duong
// 	Author email: aqduong@csu.fullerton.edu
// 	Class: CPSC 240-07	MW 10:00am-11:50am
// Program Information:
// 	Assignment #4
// 	Program Name: Area of Triangle
// 	Files in program: Heron.cpp, triangle.asm, get_sides.c, compute_area.asm, show_results.cpp
// This File:
//	Heron.cpp    driver for program
//	Compile: g++ -c -m64 -Wall -std=c++17 -o Heron.o Heron.cpp -no-pie -fno-pie


#include <stdio.h>
#include <iostream>

extern "C" double triangle();

int main()
{
	double area;

	std::cout << "Welcome to CPSC 240 Assignment 4 brought to you by Andy Duong." << std::endl;

	area = triangle();

	std::cout << "Heron received this number " << area << std::endl;
	std::cout << "Have a nice day. The program will return control to the operating system." << std::endl;

	return 0;
}
