org 0x7c00
bits 16

%define ENDL 13, 10

; A very simple 16 bit bootloader that loads the kernel

main:
    mov si, msgbooting
    call puts

    xor ax, ax
    mov ds, ax
    cld

    mov ah, 0x02        ; Read sectors
    mov al, 2           ; Read 2 sectors
    mov cl, 2           ; Sector 2
    mov ch, 0           ; Cylinder 0
    mov dh, 0           ; Head 0

    xor bx, bx
    mov es, bx
    mov bx, 0x1000

    int 0x13

    jmp 0x0000:0x1000   ; Jump to kernel

puts:
    jmp .loop

.loop:
    lodsb

    cmp al, 0
    je .done

    mov ah, 0x0E
    int 0x10

    jmp .loop

.done:
    ret

msgbooting:             db "booting to kernel...", ENDL, 0

times 510 - ($ - $$) db 0
dw 0xAA55