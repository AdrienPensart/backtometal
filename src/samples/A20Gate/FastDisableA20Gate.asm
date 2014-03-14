%include "BootloaderHeader.asm"

%include "PrintA20Gate.asm"
%include "A20Gate.asm"
DisablingA20 db 'Disabling A20 Gate...',13,10,0

start:
    cli
    
    call PrintA20State
    
    mov si, DisablingA20
    call PutStr
    
    call a20_fast_disable
    
    call PrintA20State
    
%include "BootloaderFooter.asm"