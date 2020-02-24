# NOTES
#### Using BIOS to Read the Disk [contd...]
- BIOS routine for read the disk requires raising interrupt **0x13** after setting the register **ah** to **0x02**
- BIOS routine also expects us to set up a few other registers with details of which disk device to use, which blocks we wish to read from the disk, and where to store the blocks in memory.
- The most difficult part of using this routine is that we must specify the first block to be read using a **CHS** addressing scheme
