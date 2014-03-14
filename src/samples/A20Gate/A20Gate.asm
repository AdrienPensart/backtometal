a20_check:
    pushf
    push ds
    push es
    push di
    push si

    cli
 
    xor ax, ax ; ax = 0
    mov es, ax
 
    not ax ; ax = 0xFFFF
    mov ds, ax
 
    mov di, 0x0500
    mov si, 0x0510
 
    mov al, byte [es:di]
    push ax
 
    mov al, byte [ds:si]
    push ax
 
    mov byte [es:di], 0x00
    mov byte [ds:si], 0xFF
 
    cmp byte [es:di], 0xFF
 
    pop ax
    mov byte [ds:si], al
 
    pop ax
    mov byte [es:di], al
 
    mov ax, 0
    je a20_check__exit
 
    mov ax, 1
a20_check__exit:
    pop si
    pop di
    pop es
    pop ds
    popf
    ret

a20_fast_enable:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

a20_fast_disable:
    in al, 0x92
    xor al, 2
    out 0x92, al
    ret
    
a20_bios_enable:
    mov ax, 0x2401
    int 0x15
    ret

a20_bios_disable:
    mov ax, 0x2400
    int 0x15
    ret

a20_bios_check_status:
    mov ax, 0x2402
    int 0x15
    ret

a20_bios_check_support:
    mov ax, 0x2403
    int 0x15
    ret
