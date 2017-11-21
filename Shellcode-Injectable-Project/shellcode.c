#include<stdio.h>
#include<string.h>

char code[] ="\x31\xc0\x31\xdb\x31\xd2\x31\xc9\xb0\x04\xb3\x01\xb9\xa0\x90\x04\x08\xba\x1c\x00\x00\x00\xcd\x80\x31\xc0\xb0\x01\x31\xdb\xcd\x80";

int main(int argc, char *argv[])
{
    printf("Shellcode Length:  %d\n", (int)strlen(code));
	
	int (*func)();
	func = (int (*)()) code;
	(int)(*func)();

    //int (*ret)() = (int(*)())code;
    //ret();
}
