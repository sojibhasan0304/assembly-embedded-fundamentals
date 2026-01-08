;=============SOJIB HASAN===============
;=============12 December 2025==========
; Template exersise 12 (runs on ADuC832 V3/4 board).
; Show a real time clock on the LCD that counts in hh:mm:ss.
; Use a software delay for clock timing.
; Have the clock starting from 23:59:56 (for obvious reasons).
;
; WARNING: this is not an accurate clock.
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022


hh		equ	10h			;address for storing the hours
mm      equ	11h			;idem minutes
ss      equ	12h			;idem seconds

		org	0000h			    ;starting address code

        mov     sp,#7fh         ;initialize stack pointer
		lcall	tftinit		    ;initialize LCD display
		mov	    hh,#23		;starting value clock
		mov     mm,#59	;idem
		mov	    ss,#56	;idem

; Cursor routing was explained previously.

lus:	mov	    tftxpos,#0		;cursor routing
		mov	    tftypos,#0		;idem
		mov	    a,hh			;printing hh
		lcall	hexbcd8	    	;in BCD (calculations are preformed on binary numbers)
		lcall	tftoutbyte
		mov	    a,#':'			;load ascii code ":" in a
		lcall	tftoutchar		;print ascii code (not number!)

; similar code for mm and ss
       mov a, mm
        lcall hexbcd8
        lcall tftoutbyte
        mov a, #':'
        lcall tftoutchar
        
        mov a, ss
        lcall hexbcd8
        lcall tftoutbyte

; Adjusting time (calculation)
        lcall	delaya0k05s
		inc	    ss		        ;adjusting ss first
		mov	    a,ss          	;test for maximum value
		cjne	a,#60,next      ;if not 60, continue

; else the ss must be reset to 00h and the mm must be adjusted.

		mov	    ss,#00	        ;ss=00h
        inc mm
; now adjust minutes, and if needed the hours
        
        mov a, mm
        cjne a, #60, next
        mov mm, #00
        inc hh


        mov a, hh
        cjne a, #24,next
        mov hh, #00
next:	;a delay of 1 secon is needed
		
		ljmp	lus			;infinite loop
        

        lcall	delaya0k05s


        outer: mov r1, #200
        middle: mov r2, #250
        inner: djnz r2, inner
                djnz r1, middle
                djnz r0, outer
                ret
#include	"c:\aducgd1.inc"
