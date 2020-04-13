#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

objcopy -I binary -O elf32-little --rename-section .data=.text --add-section .resource_table=$DIR/rsct.bin $1 $1.tmp
objcopy -I elf32-little --set-section-flags .text=code,alloc,load $1.tmp

ld -n --accept-unknown-input-arch $1.tmp -T $DIR/linker.txt -o $2
