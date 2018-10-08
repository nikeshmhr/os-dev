;
; A simple boot sector that prints a message to the screen using a BIOS routine.
;


call print_message

jmp $		; Jump to the current address (i.e. forever).


print_message:
	mov ah, 0x0e	; 0e -> scrolling teletype BIOS routine

	mov al, 'H'	; character to print using 0x10 interrupt

			; above two statements can be written as mov ax register and assigning it decimal value (eg: 0x0e48 => 3656)
	int 0x10	; trigger video interrupt
	mov al, 'E'
	int 0x10
	mov al, 'L'
	int 0x10
	int 0x10
	mov al, 'O'
	int 0x10
	mov al, ' '
	int 0x10
	mov al, 'W'
	int 0x10
	mov al, 'O'
	int 0x10
	mov al, 'R'
	int 0x10
	mov al, 'L'
	int 0x10
	mov al, 'D'
	int 0x10
	mov al, '!'
	int 0x10
	int 0x10
	int 0x10

;
; Padding and magic BIOS number.
;

times 510 - ($-$$) db 0		; Pad the boot sector out with zeros

dw 0xaa55			; Last two bytes form the magic number,
				; so BIOS knows we are a boot sector.
