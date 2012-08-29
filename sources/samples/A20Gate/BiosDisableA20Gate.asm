%include "BootloaderHeader.asm"

%include "PrintA20Gate.asm"
%include "A20Gate.asm"
DisablingA20 db 'Disabling A20 Gate by BIOS interrupt...',13,10,0

start:
    cli
    
    call PrintA20State
    
    mov si, DisablingA20
    call PutStr
    
    call a20_bios_disable
    
    call PrintA20State
    
%include "BootloaderFooter.asm"