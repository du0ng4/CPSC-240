// Assignment #2
// CPSC 240-07 MW 10:00am-11:50am
// Program Name: Arrays

extern "C" void reverse(long int[], int);

void reverse(long int input[], int size)
{
	long int temp;
    	int start = 0;
    	int end = size - 1;
    	while (start < end) {
        	temp = input[start];
        	input[start] = input[end];
        	input[end] = temp;
        	start++;
        	end--;
    	}
}
