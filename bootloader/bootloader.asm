BITS 16
ORG 0x7C00

start:
    ; Leer 10 sectores desde el segundo sector
    mov ah, 0x02
    mov al, 10
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    mov ax, 0x0000
    mov es, ax
    mov bx, 0x1000
    int 0x13

    ; Mostrar mensaje
    mov si, bootmsg
    call print

    ; Configurar pila
    mov ax, 0x0000
    mov ss, ax
    mov sp, 0x9000

    ; Saltar al kernel
    jmp 0x0000:1000

print:
    mov ah, 0x0E
.next:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next
.done:
    ret

bootmsg db "BOOT OK", 0

times 510 - ($ - $$) db 0
dw 0xAA55
