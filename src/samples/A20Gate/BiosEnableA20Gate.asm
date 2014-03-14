%include "BootloaderHeader.asm"

%include "PrintA20Gate.asm"
%include "A20Gate.asm"
EnablingA20 db 'Enabling A20 Gate by BIOS interrupt...',13,10,0

start:
    cli
    
    mov si, EnablingA20
    call PutStr
    
    call a20_bios_enable
    
    call PrintA20State
    
%include "BootloaderFooter.asm"