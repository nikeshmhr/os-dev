# NOTES
#### ***ip*** register
- Pointer to current instruction
- This register cannot be accessed directly
- But CPU provides a pair of instructions, **call** and **ret**
- **call** behaves lim **jmp** but before actually jumping it pushes the return address on the stack
- **ret** then pops the return address off the stack and jumps to it
* Example
      ...
      ...
      mov al, 'H'             ; Character to print
      call my_print_function
      ...
      ...

      my_print_function:
        mov ah, 0x0e          ; scrolling teletyping BIOS routine
        int 0x10              ; Video print interrupt
        ret
- Problem with ***call*** and ***ret***
  * After using ***call*** followed by function name, the function might alter the values of several registers (as we have limited resources), so when our program returns from function call it may not be safe to assume that the value we stored on **ax** will still be there.
  * One sensible and polite solution would be to push register values stack first thing in the function and pop it right before returning
  * CPU provides two instruction: **pusha** and **popa** that pushes and pops all registers to and from the stack respectively.
  * Example
        ...
        ...
        some_function:
          pusha                 ; Push all register values to the stack
          mov bx, 10
          add bx, 20
          mov ah, 0x0e
          int 0x10
          popa
          ret

#### Include Files
* nasm allows us to include external files as follows:
      %include "my_print_function.asm"  ; this will simply get replaced by the contents of the file

      ...
      mov al, 'H'
      call my_print_function
