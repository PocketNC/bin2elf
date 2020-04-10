#!/bin/bash

objcopy -I binary -O elf32-little --rename-section .data=.text --add-section .resource_table=rsct.bin $1 $1.tmp
objcopy -I elf32-little --set-section-flags .text=code,alloc,load $1.tmp

ld -n --accept-unknown-input-arch $1.tmp -T linker.txt -o $2
