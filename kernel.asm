org 0x1000
bits 16


%define ENDL 13, 10


main:
    mov si, msghello
    call puts

    jmp $

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

msghello:               db "Hello World from Kernel!", ENDL, 0