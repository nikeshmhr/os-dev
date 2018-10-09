;
; A simple boot sector that makes use of external file to print to the video
; output
;
mov al, 'H'
call my_print_function
mov al, 'E'
call my_print_function
mov al, 'L'
times 2 call my_print_function
mov al, 'O'
call my_print_function
mov al, ' '
call my_print_function
mov al, 'W'
call my_print_function
mov al, 'O'
call my_print_function
mov al, 'R'
call my_print_function
mov al, 'L'
call my_print_function
mov al, 'D'
call my_print_function
mov al, '!'
times 3 call my_print_function

jmp $

%include "my_print_function.asm"

times 510 - ($ - $$) db 0
dw 0xaa55
