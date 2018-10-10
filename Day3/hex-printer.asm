;
; QUESTION 5
; Simple boot sector that prints the 16-bit hex value (in hex format) stored in
; dx register
; REFERENCES
; http://mziccard.me/2015/05/08/modulo-and-division-vs-bitwise-operations/
;
[org 0x7c00]

mov dx, 0x1fb6        ; store the value to print in dx

call print_hex

jmp $

%include "print_string.asm"

; prints the value of DX as hex.
print_hex:
  ; TODO: manipulate chars at HEX_OUT to reflect DX
  mov ax, 3     ; last character from template (after skipping 2 chars)

char_loop:
  mov cx, dx
  cmp cx, 0
  jle print_hex_done
  shr dx, 4           ; strips last character
  and cx, 0xf         ; gives us last character

  mov bx, HEX_OUT     ; our hex template
  add bx, 2           ; skip 0x from our template (bx points to address of third char)
  add bx, ax          ; go to the position (bx points to address of third + axth char)

  cmp cx, 0xa         ; check if our extracted last char is digit or alphabet (dont get confuse here, calculate in binary to understand clearly)
  jl set_character
  add byte [bx], 7    ; if its letter then we need to add 7 coz, ascii letters
                      ; start 7 characters after end of last digit, inital value of [bx] is '0'
  jmp set_character

  ret

; sets the character cl at bx position
set_character:
  add [bx], cl          ; set value we extracted to the position

  dec ax
  jmp char_loop

print_hex_done:
  mov bx, HEX_OUT
  call print_string

; global variables
HEX_OUT: db '0x0000', 0

HEX_VALUES: db '0123456789ABCDEF'

times 510 - ($ - $$) db 0
dw 0xaa55
