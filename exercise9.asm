;=============SOJIB HASAN===============
;=============12 December 2025==========
; Template exersise 9 (runs on ADuC832 V3/4 board).
; Usage of the "cjne" instruction.
; Show a running light stored in a lookup table, Use a "forbidden code" to detect
; the ending of the table.
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		    org	  0000h			    ;starting address code

lus0:		mov    dptr,#table		;starting address tabel in dptr
lus:		mov    a,#00h		    ;clear the a register
	       	movc   a,@a+dptr		;read value from the table (pointed to by dptr)

; Verify that the read value is not the forbidden code, else restart the program,
; if not show data on LED's. 		

            cjne    a,#01010101b  ,next      ;test of de gelezen waarde de verboden code is, in het andere geval naar verder gaan
            ljmp    lus0			    ;terug naar begin programma springen

next:	    mov p2, a                         ; show value on LED's
		
		    mov a,p0                              ; add a variable delay
            lcall delaya0k05s

		    inc dptr                              ; increment the dptr by 1

            ljmp lus				;read a new value from the table.

; This is the look up table. The "db" (define byte) directive is used to assign a constant to
; FLASH memory. The address where the first constant is stored is equal to the lable (table)

table:	db	01111110b
		db	10111101b
		db	11011011b
		db	11100111b
		db	11111111b
		db	01010101b		    ;........ must be replaced with the "forbidden" code
						        ;The value is in the range 00000000b en 11111111b.
						        ;The value must be unique!

#include	"c:\aducgd1.inc"
