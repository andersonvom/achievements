# simple cat makefile
# andersonvom
# 2012

all: cat.o
	ld -s -o cat.bin cat.o

cat.o: cat.asm utils.asm
	nasm -f elf cat.asm

clean:
	-rm *.bin *.o

