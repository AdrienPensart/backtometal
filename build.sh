#!/bin/sh

cd src/

nasm -f elf loader.asm
gdc -m32 -nostdlib -nodefaultlibs -g kernel.d -o kernel.o
ld -static -melf_i386 -o ../binary/iso/boot/kernel.bin -T linker.ld *.o

cd ..
cat binary/iso/boot/kernel.bin /dev/zero | dd of=binary/btm.img bs=512 count=2880

grub-mkrescue -o binary/btm.iso binary/iso
