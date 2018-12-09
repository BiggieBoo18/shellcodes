standard: shellcode_amd64_standard

short: shellcode_amd64_short

shellcode_amd64_standard: shellcode_amd64_standard.o
	ld -m elf_x86_64 shellcode_amd64_standard.o -o shellcode_amd64_standard

shellcode_amd64_standard.o: shellcode_amd64_standard.asm
	nasm -f elf64 shellcode_amd64_standard.asm

shellcode_amd64_short: shellcode_amd64_short.o
	ld -m elf_x86_64 shellcode_amd64_short.o -o shellcode_amd64_short

shellcode_amd64_short.o: shellcode_amd64_short.asm
	nasm -f elf64 shellcode_amd64_short.asm

clean:
	rm -f *.o shellcode_amd64_standard shellcode_amd64_short
