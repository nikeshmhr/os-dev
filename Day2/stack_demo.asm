;
; A simple boot sector program that demonstrates the stack.
; Stack grows downwards
; If base address is 0x8000 the next element will be a 0x8000 - 0x2 => 0x7ffe
;

mov ah, 0x0e  ; scrolling teletype BIOS routine

mov bp, 0x8000          ; Set the base(point) of the stack a little(1024 bytes from the point that BIOS loads our bootsector) above where BIOS
mov sp, bp              ; loads our boot sector - so it won't overwrite us.

push 'A'                ; Push some characters on the stack for later
push 'B'                ; retreival. Note, these are pushed on as
push 'C'                ; 16-bit values, so the most significant byte
                        ; will be added by our assembler as 0x00.

; Playing around
mov al, [0x7ffe]
int 0x10

mov al, [0x7ffa]
int 0x10
; END

pop bx                  ; Note, we can only pop 16-bits, so pop to bx
mov al, bl              ; then copy bl (i.e. 8-bit char) to al
int 0x10                ; interrupt for print routine

pop bx                  ; Pop the next value
mov al, bl
int 0x10

mov al, [0x7ffe]        ; To prove our stack grows downwards from bp,
                        ; fetch the char at 0x8000 - 0x2 (i.e 16-bits)
int 0x10                ; print(al)

jmp $                   ; Jump to current instruction (forever)

; Padding and magic BIOS number.
times 510 - ($ - $$) db 0
dw 0xaa55
