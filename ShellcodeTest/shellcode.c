#include<stdio.h>
#include<string.h>

unsigned char code[] ="\xb8\x04\x00\x00\x00\xbb\x01\x00\x00\x00\xb9\xa0\x90\x04\x08\xba\x1c\x00\x00\x00\xcd\x80\xb8\x01\x00\x00\x00\xcd\x80";

int main(int argc, char *argv[])
{
    printf("Shellcode Length:  %d\n", (int)strlen(code));

    int (*ret)() = (int(*)())code;
    ret();
}