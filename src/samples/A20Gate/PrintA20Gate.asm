%include "Print.asm"

A20Enabled  db 'A20 Gate is enabled.',13,10,0
A20Disabled db 'A20 Gate is disabled.',13,10,0

TestingA20State db 'Testing A20 Gate state...',13,10,0
TestingA20Support db 'Testing A20 Gate support...',13,10,0

A20SupportedByKeyboardController  db 'A20 Gate is supported by keyboard controller.',13,10,0
A20NotSupportedByKeyboardController db 'A20 Gate is not supported by keyboard controller.',13,10,0

A20SupportedByBios db 'A20 Gate is supported by BIOS.',13,10,0
A20NotSupportedByBios db 'A20 Gate is not supported by BIOS.',13,10,0

PrintA20State:
    mov si, TestingA20State
    call PutStr
    
    call a20_check
    
    cmp ax, 0
    je PrintA20State__disabled
    jnz PrintA20State__enabled
    
PrintA20State__enabled:
    mov si, A20Enabled
    jmp PrintA20State__result    

PrintA20State__disabled:
    mov si, A20Disabled

PrintA20State__result:    
    call PutStr
    ret

PrintA20Support:
    call a20_bios_check_support
    
    mov si, A20NotSupportedByKeyboardController
    bt bx, 1
    
    jnc PrintA20Support__result
    
    mov si, A20SupportedByKeyboardController
    
PrintA20Support__result:
    call PutStr
    ret
