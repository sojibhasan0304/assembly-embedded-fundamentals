; Template exersise 6 (runs on ADuC832 V3/4 board).
; Usage of the "djnz" instruction.
; Blink the LED's 3 times fast, then 3 times slowly, rerpeat indefinitely.
;
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		    org	  0000h			;starting address code

; Loops are counted by means of the "djnz" instruction.
; Use the instruction to count the number of times a loop is executed (3 + 3 times)

loop0:		mov	  b,#3			;b register is used as a loop counter
loop:		mov	  p2,#00h		;LED's activated
            mov   a,#10
            lcall delaya0k05s
 
; short delay (e.g. 0,5 seconds)

		    mov   p2,#ffh		;LED's deactivated
            lcall delaya0k05s
; short delay

		    djnz  b,loop		;repeat this part of the code 3 times

		    mov	  b,#3			;b register is used as a loop counter
loop1:		mov	  p2,#00h			;LED's activated
            mov   a,#20
            lcall delaya0k05s
            

; long delay (e.g. 1 second)

		    mov	  p2,#ffh		;LED's deactivated
            lcall delaya0k05s

; long delay

		djnz	b,loop1		    ;repeat part code 

		ljmp	loop0			;restart code from location loop0

#include	"c:\aducgd1.inc"
