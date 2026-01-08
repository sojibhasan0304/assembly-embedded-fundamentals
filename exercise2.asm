;=============SOJIB HASAN===============
;=============06 December 2025==========
; This is the source code (.asm file) for exercise 2 on ADuC V3/V4 board.
; The program shows flashing LED's without a delay.
; Thomas more university
; Written by Roggemans M. (MGM) v2 on 02-02-2015
; Revisited by MGM 07-2022.

		org	0000h			;starting address code

; Flashing the LED's (blincky) is doen by writing alternatingly "0" and "1" to them.
; The LED's are connected to p2. They are activated by writing a "0", and deactivated
; by writing a "1" to the corresponding p2-pin.
; The port is 8 bits wide, so 00000000b or 00h can be written to activate the LED's.
; To deactivate the LED's 11111111b or ffh must be written.
; Deviating patterns are allowed!

loop:		mov	p2,#00h
        lcall	delaya0k05s
		mov	p2,#ffh

; at this location an additional instruction is required.
       lcall	delaya0k05s
		ljmp	loop		;infinite loop

; Why don't you see the LED's flashing?

#include	"c:\aducgd1.inc"

