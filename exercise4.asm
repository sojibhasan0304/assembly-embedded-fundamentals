; This is the source code (.asm file) for exercise 4 on ADuC V3/V4 board.
; The program shows flashing LED's with a variable delay.
;
; Written by Roggemans M. (MGM) v2 on 02-02-2015
; Revisited by MGM 07-2022.

		org	0000h			     ;starting address code

loop:	mov	p2,#00h		         ;LED's activated (choose different value!)
        mov a, p0
        
;add instruction that reads switches (p0) to the accumulator

		lcall	delaya0k05s		 ;dit is een tijdsvertragings-routine
						         ;de waarde in de accu x0,05s is de tijdsvertraging
		mov	p2,#ffh	             ;LED's deactivated (choose different value)
        lcall	delaya0k05s	
; delay needed

		ljmp	loop			 ;infinite loop

; WARNING! If input parameter for delaya0k05s = 0 256 x 0,05s delay is generated

#include	"c:\aducgd1.inc"
