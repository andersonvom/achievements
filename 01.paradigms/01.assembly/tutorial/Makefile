# 
# Makefile
# 

all: object
	ld -s -o $(FILE) $(FILE).o

object:
	nasm -f elf $(FILE).asm

clean:
	rm $(FILE) $(FILE).o

