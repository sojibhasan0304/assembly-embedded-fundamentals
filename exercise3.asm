; This is the source code (.asm file) for exercise 3 on ADuC V3/V4 board.
; The program shows flashing LED's with a delay.
;
; Written by Roggemans M. (MGM) v2 on 02-02-2015
; Revisited by MGM 07-2022.

		org	0000h			    ;starting address code
		mov a, #10              ; Value a= 10 mens accumulator A = 10. so, delay = value in A × 0.05 seconds.
loop:	mov	p2,#00h		        ;LED's activated

                                ; Add an instruction loading the required parameter for the delaya0k05s function.

		lcall	delaya0k05s		;this function generates a time delay.
                                ;the value in the a register determines the duration
                                ;value in a x 0,05s is the time delay
		mov	p2,#ffh		        ;LED's turned off

       lcall	delaya0k05s	  ; a second time delay is required


		ljmp	loop			;infinite loop

#include	"c:\aducgd1.inc"
