NASM = nasm
AFILES = hello.asm
OBJS = $(AFILES:.asm=.o)
ASM_FLAGS = -f elf64 -g 
LD=gcc
LDFLAGS = -g -no-pie
BINARIES = hello

.SECONDARY:

all: $(BINARIES)

%.o : %.asm
	$(NASM) $(ASM_FLAGS) -o $@ $<

clean:
	rm -f *.o $(BINARIES) *.s
	rm -f *~
