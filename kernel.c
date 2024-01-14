
void kernel_main()
{
    char* vMem = (char*)0xb8000;
    vMem[0] = 'A';
    vMem[1] = 0x07;
}