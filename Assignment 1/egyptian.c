#include "stdio.h"


long int computeArea();

int main() 
{
    long int area;
    printf("Welcome to your friendly area calculator.\n");
    printf("The main function will now call the area function.\n");
    area = computeArea();
    printf("The main recieved this integer: %ld\n", area);
    printf("Have a nice day. Main will now return 0 to the operating system.\n");

    return 0;
}
