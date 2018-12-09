standard: shellcode_i386_standard

short: shellcode_i386_short

shellcode_i386_standard: shellcode_i386_standard.o
	ld -m elf_i386 shellcode_i386_standard.o -o shellcode_i386_standard

shellcode_i386_standard.o: shellcode_i386_standard.asm
	nasm -f elf shellcode_i386_standard.asm

shellcode_i386_short: shellcode_i386_short.o
	ld -m elf_i386 shellcode_i386_short.o -o shellcode_i386_short

shellcode_i386_short.o: shellcode_i386_short.asm
	nasm -f elf shellcode_i386_short.asm

clean:
	rm -f *.o shellcode_i386_standard shellcode_i386_short
