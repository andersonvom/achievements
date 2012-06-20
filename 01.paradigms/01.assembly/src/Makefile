# simple cat makefile
# andersonvom
# 2012

all: cat.o
	ld -s -o cat.bin cat.o

cat.o:
	nasm -f elf cat.asm

clean:
	-rm *.bin *.o

