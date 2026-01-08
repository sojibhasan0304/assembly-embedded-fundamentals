;=============SOJIB HASAN===============
;=============08 December 2025==========
; Template exersise 7 (runs on ADuC832 V3/4 board).
; Usage of the "djnz" instruction.
; Thomas More University
; The program shows a "knight rider" pattern on the LED's with a variable speed (delay).
; The "rr a" en "rl a" instructions are used to manipulate a variable in the a register.
;
; This pattern is used to activate the LED's:
; 01111111b
; 10111111b
; 11011111b
;...
; 11111110b
; 11111101b
;...
; 10111111b
; 
; The "djnz"  instruction is used to count the number of times data is shifted right or left in a loop.
;
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		    org	  0000h			;starting address code
 
	       	mov	  a,#01111111b  		    ;starting value is loaded in the a register
lus0:		mov	  b,#7			;number of times loop is executed in b register

lus:		mov	  p2,a			;LED's updated with value in a register
            mov   a,p0
            lcall delaya0k05s
            mov   a,p2

; The a register is used for the delay function. The value in the a register can't be lost.

                                ;back up a register
                                ;use switches as parameter for the delay
                                ;call delay function
                                ;restore value in a register

		    rr	   a			;shift the data in the a register (only works with the a register)
		    djnz   b,lus		;repeat as much as needed

; The LED in the leftmost position is activated. Now the data needs to be shifted to the left.
            mov    b,#7

                                ;reload loop counter (b register) 
lus1:		mov	   p2,a			;LED's activated
            mov    a,p0
            lcall delaya0k05s
            mov   a,p2
;delay needed

		    rl     a			;shift data in a register to the left
		    djnz   b,lus1		;Repeat loop as much as needed
		
		    ljmp   lus0			;Restart the program

#include	"c:\aducgd1.inc"

