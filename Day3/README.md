# NOTES
#### Include Files [contd]
Solved Question 4

#### Registers
- Modern (i.e 386 and beyond) x86 processors have eight 32-bit general purpose registers, as depicted in figure.

  ![General Purpose Registers](http://www.cs.virginia.edu/~evans/cs216/guides/x86-registers.png)

#### Things to Remember
- ***db*** data bytes, when used will write subsequent bytes directly to our binary instead of telling CPU to execute it. If we use quote then assembler convert each character into its ASCII byte code
- We use label to to mark the start of our data, otherwise we would have no easy way to reference it later
- Example:
```
my_label:
  db 'Booting OS...', 0
```
- ***dw*** data write, when used writes the data as a word (2 byte) value directly into our binary file. When writing data as a WORD little-endian format is used (i.e least significant byte is written first followed by most significant byte)
- Example:
  ```
  asm
  dw 0xaa55  ;will output to

  bin
  .. ..
  .. ..
  .. ..
  55 AA ; in our binary file
  ```
