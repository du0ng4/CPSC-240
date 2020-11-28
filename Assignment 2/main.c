// Assignment #2
// Author: Andy Duong
// Author email: aqduong@csu.fullerton.edu
// Class: CPSC 240-07	MW 10:00am-11:50am
// Program Name: Arrays
// Files in program: main.c, manager.asm, Display_Array.asm, reverse.cpp, r.sh 
// Program discription: This program demonstrates my knowledge of how to use arrays and how to use implement iteration.
// Program takes in user input to fill an array, outputs the array, reverses the content of the array, outputs it again, and calculates and returns the mean.


#include "stdio.h"

long int manager();

int main()
{   
	long int mean;
    	printf("Welcome to Array of Integers\n");
    	printf("Brought to you by Andy Duong\n");

    	mean = manager();

    	printf("Main received this number: %ld", mean);
    	putchar('\n');
    	printf("Main will return 0 to the operating system. Bye.\n");

    	return 0;
}
