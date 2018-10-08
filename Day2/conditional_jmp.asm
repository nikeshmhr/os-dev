; QUESTION 3
; This boot sector program demonstrates condition
; after cmp instruction cpu uses its special flags to capture the outcome
;
; FLOW
; if(bx <= 4) {}
;   mov al, 'A'
; } else if(bx < 40) {
;   mov al, 'B'
; } else {
;   mov al, 'C'
; }
;

; TRYING CHANGING THIS VALUE....
mov bx, 2

cmp bx, 4
jle print_a
cmp bx, 40
jl print_b
jmp print_c

; label to move character 'A' to al register
print_a:
  mov al, 'A'
  jmp normal_flow

; label to move character 'B' to al register
print_b:
  mov al, 'B'
  jmp normal_flow

; label to move character 'C' to al register
print_c:
  mov al, 'C'
  jmp normal_flow

; normal flow continues
normal_flow:
  mov ah, 0x0e            ; BIOS teletyping routine
  int 0x10                ; Print anything stored in al register

  jmp $

  ; Padding and magic BIOS number
  times 510 - ($ - $$) db 0
  dw 0xaa55
