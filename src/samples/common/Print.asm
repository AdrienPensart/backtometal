PutStr:
    pushad
    mov ah,0x0E
    mov bh,0x00
    mov bl,0x07

nextCharPutString:
    lodsb
    or al,al
    jz returnPutString
    int 0x10
    jmp nextCharPutString
returnPutString:
    popad
    ret
