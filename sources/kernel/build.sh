#!/bin/sh

nasm -f elf loader.asm
gdc -m32 -nostdlib -nodefaultlibs -g kernel.d -o kernel.o
ld -static -melf_i386 -o ../../binary/iso/boot/kernel.bin -T linker.ld *.o

cd ../../binary
grub-mkrescue -o btm.iso iso
