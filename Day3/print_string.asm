print_string:
  pusha
  mov ah, 0x0e
  .1:
    cmp byte [bx], 0
    je exit
    mov al, [bx]
    int 0x10
    add bx, 0x1
    jmp .1
  exit:
    popa
  ret
