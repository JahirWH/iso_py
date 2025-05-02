.PHONY: all clean run

all: os.iso

kernel.bin: kernel.c
	i686-elf-gcc -ffreestanding -c kernel.c -o kernel.o
	i686-elf-gcc -ffreestanding -nostdlib -T linker.ld kernel.o -o kernel.bin

os.iso: kernel.bin grub.cfg
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/
	cp /home/ahir/Documentos/GitHub/iso_py/grub.cfg iso/boot/grub/
	grub-mkrescue -o os.iso iso

clean:
	rm -rf *.o *.bin os.iso iso

run: os.iso
	qemu-system-i386 -cdrom os.iso

