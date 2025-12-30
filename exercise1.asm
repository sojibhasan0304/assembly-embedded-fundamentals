; This is the source code (.asm file) for exercise 1 on ADuC V3/V4 board.
; This is a template, allowing for quick take off.
; Make adjustments in order to get it working.
; ";" is used as a comment delimiter
;
; Written by Roggemans M. (MGM) v2 on 02-02-2015
; Revisited by MGM 07-2022.

		org	0000h			;starting address of code in memory

; "org" is not an instruction executed by the CPU, but a directive for the IDE
; It dictates the address where the code must be subsequently stored in memory
		
; Read the value of the switches (connected to p0) and write the data to the LED's (p2)

loop:       mov P2, P0


		ljmp	loop			;jump to label loop (a label = address in memory)

; The code uses names of registers (e.g. p0 and p2). These are not known to the IDE.
; The included file below contains register declarations (definitions of register
; names)
; The file can be opened with this IDE.
; DO NOT CHANGE THE CONTENTS OF THE *.inc FILE!!
; The "#include" directive tells the IDE to include the file "aducgd1.inc" 
; in this program.
; This is only possible when the file resides in the correct directory on the C 
; drive of your computer.

#include	"c:\aducgd1.inc"
