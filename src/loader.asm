global start
extern main        ; Allow main() to be called from the assembly code
extern start_ctors, end_ctors, start_dtors, end_dtors

; setting up the Multiboot header - see GRUB docs for details
MODULEALIGN equ  1<<0                   ; align loaded modules on page boundaries
MEMINFO     equ  1<<1                   ; provide memory map
FLAGS       equ  MODULEALIGN | MEMINFO  ; this is the Multiboot 'flag' field
MAGIC       equ    0x1BADB002           ; 'magic number' lets bootloader find the header
CHECKSUM    equ -(MAGIC + FLAGS)        ; checksum required
 
section .text

align 4
	dd MAGIC
	dd FLAGS
	dd CHECKSUM
 
; reserve initial kernel stack space
STACKSIZE equ 0x4000                    ; that's 16k.

static_ctors_loop:
	mov ebx, start_ctors
	jmp .test
.body:
	call [ebx]
	add ebx,4
.test:
	cmp ebx, end_ctors
	jb .body

start:
	mov  esp, stack + STACKSIZE         ; set up the stack
	push eax                            ; Multiboot magic number
	push ebx                            ; Multiboot info structure
 
	; jmp $
	call main                          ; call kernel proper
 
static_dtors_loop:
	mov ebx, start_dtors
	jmp .test
.body:
	call [ebx]
	add ebx,4
.test:
	cmp ebx, end_dtors
	jb .body

    cli
 
cpuhalt:
       hlt
       jmp cpuhalt
 
section .bss
 
align 4
stack:
    resb STACKSIZE                      ; reserve 16k stack on a doubleword boundary