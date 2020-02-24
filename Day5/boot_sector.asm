; Read some sectors from the boot disk using our disk_load function
[org 0x7c00]

  mov [BOOT_DRIVE], dl        ; BIOS stores our boot drive in DL, so it's best
                              ; to remember this for later.
  mov bp, 0x8000              ; Here we set our stack safely out of the
  mov sp, bp                  ; way, at 0x8000

  mov bx, 0x9000              ; Load 5 sectors to 0x0000(ES):0x9000(BX)
  mov dh, 5                   ; from the boot disk.
  mov dl, [BOOT_DRIVE]
  call disk_load

  mov dx, [0x9000]            ; Print out the first loaded word, which we expect
  call print_hex              ; to be 0xdada, stored at address 0x9000

  mov dx, [0x9000 + 512]      ; Also, print the first word from the 2nd loaded
  call print_hex              ; sector: should be 0xface

  jmp $

%include "./print-string.asm"
%include "../Day3/print_hex.asm"
%include "./disk_load.asm"

; Global Variables
BOOT_DRIVE: db 0

; Bootsector padding
times 510 - ($ - $$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
