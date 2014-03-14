#!/bin/sh

#$EMULATOR -s -S -net none -boot a -fda $2.img
#qemu-system-x86_64 -net none -boot a -fda btm.img
#qemu-system-x86_64 -net none -boot d -cdrom binary/btm.iso
qemu -net none -boot a -fda binary/btm.img
