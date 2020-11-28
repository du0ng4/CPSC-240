// Author Information:
// 		Author: Andy Duong
// 		Author email: aqduong@csu.fullerton.edu
// 		Class: CPSC 240-07	MW 10:00am-11:50am
// Program Information:
// 		Assignment #3
// 		Program Name: Largest Number
// 		Files in program: largest.cpp, outputArray.asm, inputArray.c, findLargest.asm, manager.asm
//		Purpose: To practice the usage of passing arrays withing different functions of different languages
// This File:
//		largest.cpp    driver for program
//		Compile: g++ -c -m64 -Wall -std=c++17 -o largest.o largest.cpp -no-pie -fno-pie


#include <stdio.h>
#include <iostream>

extern "C" long int * manager();

int main()
{   
	long int * largestNum;
	std::cout << "Welcome to CPSC 240 Assignment 3 brought to you by Andy Duong." << std::endl;

	largestNum = manager();

	std::cout << "The driver received two numbers: " << largestNum[0] << " and " << largestNum[1] << std::endl;
	std::cout << "Have a nice day. The program will return control to the operating system." << std::endl;

	return 0;
}
