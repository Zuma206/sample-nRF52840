/* nRF52840.ld from github.com/zuma206/nRF52840 */

MEMORY {
  /* RAM AHB slaves 0 to 7 are connected to two 4 kB RAM sections each,
   * while RAM AHB slave 8 is connected to six 32 kB sections */
  DATA_RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 256K
  /* Flash memory is divided into 256 pages of 4 kB each */
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 1024K
}

SECTIONS {
  /* Merge .text, .rodata, and .isr_vector sections of all objects into
   * a new .text section located in the flash memory region */
  .text : {
    *(.text)
    *(.rodata)
    *(.isr_vector)
  } > FLASH

  /* Merge .data sections of all objects into a new .data section loaded
   * from flash memory region into data ram region */
  .data : {
    *(.data)
  } > DATA_RAM AT > FLASH

  /* Merge .bss sections of all objects into a new .bss section, not
   * stored anywhere but initialised in data ram region */
  .bss : {
    *(.bss)
  } > DATA_RAM
}
