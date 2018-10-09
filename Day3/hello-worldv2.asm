;
; Simple boot sector that prints string using a our function which prints
; null terminated strings
;
[org 0x7c00]                ; Tell the assembler where this code will be loaded

mov bx, HELLO_MSG           ; Use BX as a parameter to our function, so we can
call print_string           ; specify the address of our string.

mov bx, GOODBYE_MSG
call print_string

jmp $                       ; Hang

%include "print_string.asm"

; DATA
HELLO_MSG:
  db 'Hello, World!', 0     ; The zero on the end tells our routine when to stop
                            ; printing

GOODBYE_MSG:
  db 'Goodbye!!!', 0

times 510 - ($ - $$) db 0
dw 0xaa55                   ; dw=> data word (2 byte)
                            ; word is represented as little-endian format
