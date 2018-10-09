[org 0x7c00]
; QUESTION 1
; Above annotation is important because the_secret label will give us an offset
; from the start of memory rather than the start address of our loaded
; code. Since, BIOS loads our boot sector at address 0x7c00, whatever address we
; use in our code will be added to above address before dereferencing
;
; A simple boot sector program that demonstrates addressing.
;
mov ah, 0x0e  ; int 10/ah = 0x0e -> scrolling teletype BIOS routine

; First attempt
mov al, the_secret
int 0x10            ; Does this print an X? Nope

; Second attempt
mov al, [the_secret]
int 0x10            ; Does this print an X? Nope

; Third attempt
mov bx, the_secret
add bx, 0x7c00    ; Start address of boot sector
mov al, [bx]
int 0x10            ; Does this print an X? Yes

; Fourth attempt
mov al, [0x7c1d]  ; Since from our hex dump we know our 'X' was 0x1d (29) bytes from start of our boot sector we can dereferencing it straightly
int 0x10
jmp $

the_secret:
  db "X"

; Padding and magic BIOS number
times 510 - ($ - $$) db 0
dw 0xaa55
