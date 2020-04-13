#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv) {
  if(argc < 2) {
    return 1;
  }
  uint32_t value = atol(argv[1]);
  volatile uint32_t *shared_memory;

  int fd = open("/dev/uio1", O_RDWR | O_SYNC);
  shared_memory = mmap(0, 0x20000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

  shared_memory[0] = value;

  munmap((void*)shared_memory, 0x20000);
  close(fd);
}
