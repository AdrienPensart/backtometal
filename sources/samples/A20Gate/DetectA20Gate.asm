%include "BootloaderHeader.asm"

%include "PrintA20Gate.asm"
%include "A20Gate.asm"

start:
    cli
    
    call PrintA20Support
    call PrintA20State

%include "BootloaderFooter.asm"