[org 0x7c00]
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
mov bx, [0x7c1e]
int 0x10
jmp $

the_secret:
  db "X"

  ; Padding and magic BIOS number
  times 510 - ($ - $$) db 0
  dw 0xaa55
