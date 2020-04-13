all: test.elf write2sharedmem

test.elf: test.p
	pasm -b -L -d test.p
	$(PWD)/bin2elf.sh test.bin test.elf

start: test.elf
	cp test.elf /lib/firmware/am57xx-pru2_0-fw 
	echo start > /sys/class/remoteproc/remoteproc2/state

stop:
	echo stop > /sys/class/remoteproc/remoteproc2/state

write2sharedmem: write2sharedmem.c
	gcc write2sharedmem.c -o write2sharedmem
