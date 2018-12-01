shellcode_i386: shellcode_i386.o
	ld -m elf_i386 shellcode_i386.o -o shellcode_i386

shellcode_i386.o: shellcode_i386.asm
	nasm -f elf shellcode_i386.asm
