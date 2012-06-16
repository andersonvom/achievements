# 
# Makefile
# 

all: object
	ld -s -o $(FILE).bin $(FILE).o

object:
	nasm -f elf $(FILE).asm

clean:
	rm $(FILE).bin $(FILE).o

cleanall:
	-rm *.bin *.o

