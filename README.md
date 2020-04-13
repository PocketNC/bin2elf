Usage
=====

Test program that toggles P8.17 on and off at a 100khz frequency.

    git clone https://github.com/PocketNC/bin2elf.git
    cd bin2elf
    make
    make start # compile test.p, copy it to pru firmware and start running it with remoteproc
    make stop
    ./write2sharedmem 3332 # changes wait time to adjust the frequency of the output signal
