all: os-image.bin

bootloader/bootloader.bin: bootloader/bootloader.asm
	nasm -f bin bootloader/bootloader.asm -o bootloader/bootloader.bin

kernel/kernel.o: kernel/kernel.c
	i686-linux-gnu-gcc -ffreestanding -m32 -fno-pie -fno-stack-protector -nostdlib -c kernel/kernel.c -o kernel/kernel.o

kernel/kernel.bin: kernel/kernel.o linker/linker.ld
	i686-linux-gnu-ld -T linker/linker.ld -m elf_i386 kernel/kernel.o -o kernel/kernel.bin

os-image.bin: bootloader/bootloader.bin kernel/kernel.bin
	cat bootloader/bootloader.bin kernel/kernel.bin > os-image.bin

run: os-image.bin
		qemu-system-i386 -drive format=raw,file=os-image.bin

clean:
	rm -f bootloader/bootloader.bin kernel/*.o kernel/kernel.bin os-image.bin
