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
//		inputArray.c    Takes in user input for passed array
//		Compile: gcc -c -m64 -Wall -std=c11 -o inputArray.o inputArray.c -no-pie -fno-pie

#include <stdio.h>

//Prototype: 
long int inputArray(long int [], int);


long int inputArray(long int list[], int max_elements)
{
	printf("Input your integer data with white space separating each number.\n");
	printf("Press <enter> followed by Ctrl+D to terminate.\n");

	long int i = 0;
	while (i < max_elements && scanf("%ld", &(list[i])) != EOF) {
		i++;
	}

	return i;
}

