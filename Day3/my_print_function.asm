my_print_function:
  pusha
  mov ah, 0x0e        ; scrolling teletyping
  int 0x10            ; video interrupt
  popa
  ret
