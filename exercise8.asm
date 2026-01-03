; Template exersise 8 (runs on ADuC832 V3/4 board).
; Usage of the "djnz" instruction and lookup tables.
; Show a "Star Trek(?) pattern" on the LED's
; This is achieved by sending following patterns to the LED's:
; 01111110b
; 10111101b
; 11011011b
; 11100111b
; 11111111b
;
; Data is stored in a lookup table.
;
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		org	0000h			;starting address code

; Use the "djnz' instruction for counting loops.
            
loop0:		mov   b,#5			    ;b register used as a loop counter
		    mov	  dptr,#tabel		;starting address table stored in the dptr pointer
lus:		mov	  a,#00h		    ;mandatory for the next instruction to operate as expected
	       	movc  a,@a+dptr		    ;read value pointed to by the dptr from the lookup table
		
            mov   p2,a 		; show read value on the LED's
		    mov   a,p0
		    lcall delaya0k05s                 ; add variable delay

            inc dptr       		; increment pointer by 1

            djnz b,lus		; repeat as many times as the number in the b register (djnz)

            ljmp loop0		; Value in b was 0, restart the program.


; This is the lookup table. In the lab alternate ways to create a lookup table will be explained.

tabel:	  db	01111110b
		  db	10111101b
		  db	11011011b
	      db	11100111b
		  db	11111111b
         
#include	"c:\aducgd1.inc"
