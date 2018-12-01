shellcode_amd64: shellcode_amd64.o
	ld -m elf_x86_64 shellcode_amd64.o -o shellcode_amd64

shellcode_amd64.o: shellcode_amd64.asm
	nasm -f elf64 shellcode_amd64.asm
