bits 16
org 0x7C00

jmp 0x0000:start

%include "Print.asm"

LongModeSupported db 'Long mode (x86-64) is supported.',13,10,0
LongModeNotSupported db 'Long mode (x86-64) not supported, aborting.',13,10,0

DetectLongMode:
    pushad
    
    mov si, LongModeNotSupported
    
    mov eax, 0x80000000
    cpuid
    cmp eax, 0x80000001
    jb EndDetect
    
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz EndDetect
    
    mov si, LongModeSupported
EndDetect:
    call PutStr
    popad
    ret

start:
    cli
    cld
    
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax
    mov ss, ax
    mov sp, ax
    
    call DetectLongMode
    
hang:
    jmp $

times 510-($-$$) db 0
dw 0xAA55