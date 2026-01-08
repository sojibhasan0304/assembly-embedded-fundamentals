;=============SOJIB HASAN===============
;=============12 December 2025==========
; Template exersise 10 (runs on ADuC832 V3/4 board).
; Usage of the display functions and arithmetic.
; Show 2 8-bit counters (1 counts up by one, the other counts down by one).
; Print the counter values in BCD and HEX on the display (4 different locations).
;
; This program will show wrong results. Why?
; Avoid this by limiting the counters (see limitations of HEXBCD8).
;
; Remedy this by using HEXBCD16
;
; This template is used for the 3 tasks.
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		org	  0000h			;starting address code

		lcall tftinit		;initialization of the TFT display
		mov	  r0,#000h		;Used for counting up
		mov	  r1,#000h		;used for counting down

; The LCD display is used as a 7 lines by 20 characters alphanumerical display. (see slide in PPT) 
; The x position mustbe written in the tftxpos register (0=utmost left, 19= utmost right position).
; The y position mustbe written in the tftypos register (0=utmost top, 6= utmost bottom line).
; Values exceeding the limits may result in unpredictable results.
; tftxpos and tftypos are updated automatically during writing operations.
; The cursor (location where data is written on the display) is not visible.

lus:	mov	  tftxpos,#0		;cursor routing (horizontal)
		mov	  tftypos,#0		;cursor routing (vertical)
		mov	  a,r0			    ;Printing contents of r0 can only be done by storing them in a
		lcall tftoutbyte		;number in a register is printed in hex representation
		mov	  tftxpos,#10		;cursor routing
		
; In order to print the contents of r0 in BCD representation, the binary (=hex) value must
; be translated into the BCD representation. This can be done with the HEXBCD8 function that
; is present in the *.inc file.
; PRIOR TO USING A FUNCTION, CONSULT THE DETAILED INFORMATION ON HOW TO USE THE FUNCTION!!!!!
; That information is shown in the following comment:


; hexbcd8     zet een 8 bit hex getal om in een 8 bit bcd getal (translates 8 bit HEX into 8 bit BCD)
; input       a (maximale waarde = 63h) (will not work if input is larger than 63h)
; output      a

		mov	  a,r0			     ;value stored in r0 will be translated into BCD
		lcall hexbcd8            ;translate from hex into BCD
		lcall tftoutbyte         ; print result on display

		;idem hex for r1 on second line
		
		;idem decimal r1 on second line, second half of the line

		inc	  r0			;r0 +1
		dec	  r1			;r1 -1
		ljmp  lus			;infinite loop

#include	"c:\aducgd1.inc"
