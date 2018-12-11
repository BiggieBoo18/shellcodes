standard: shellcode_i386_standard

short: shellcode_i386_short

tcp_standard: tcp_shellcode_i386_standard

reverse_tcp_standard: reverse_tcp_shellcode_i386_standard

shellcode_i386_standard: shellcode_i386_standard.o
	ld -m elf_i386 shellcode_i386_standard.o -o shellcode_i386_standard

shellcode_i386_standard.o: shellcode_i386_standard.asm
	nasm -f elf shellcode_i386_standard.asm

shellcode_i386_short: shellcode_i386_short.o
	ld -m elf_i386 shellcode_i386_short.o -o shellcode_i386_short

shellcode_i386_short.o: shellcode_i386_short.asm
	nasm -f elf shellcode_i386_short.asm

tcp_shellcode_i386_standard: tcp_shellcode_i386_standard.o
	ld -m elf_i386 tcp_shellcode_i386_standard.o -o tcp_shellcode_i386_standard

tcp_shellcode_i386_standard.o: tcp_shellcode_i386_standard.asm
	nasm -f elf tcp_shellcode_i386_standard.asm

reverse_tcp_shellcode_i386_standard: reverse_tcp_shellcode_i386_standard.o
	ld -m elf_i386 reverse_tcp_shellcode_i386_standard.o -o reverse_tcp_shellcode_i386_standard

reverse_tcp_shellcode_i386_standard.o: reverse_tcp_shellcode_i386_standard.asm
	nasm -f elf reverse_tcp_shellcode_i386_standard.asm

clean:
	rm -f *.o shellcode_i386_standard shellcode_i386_short
