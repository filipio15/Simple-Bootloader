all:
	nasm -fbin boot.asm
	nasm -fbin kernel.asm
	dd if=/dev/zero of=floppy.img bs=512 count=2880
	dd if=boot of=floppy.img bs=512 count=1 conv=notrunc
	dd if=kernel of=floppy.img bs=512 seek=1 conv=notrunc
	qemu-system-x86_64 -drive format=raw,file=floppy.img