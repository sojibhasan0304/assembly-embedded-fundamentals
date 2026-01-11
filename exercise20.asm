;=============SOJIB HASAN===============
;=============18 December 2025==========
; Template exersise 20 (runs on ADuC832 V3/4 board).
; Print a clock in hh:mm:ss using the TIC.
; The clock starts at a predefined time.
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		org	    0000h		;starting address code

        mov     sp,#7fh		;init stackpointer
		lcall	inits		;initialize whatever is needed
lus:	lcall	print		;print clock
		ljmp	lus		    ;infinite loop

; inits:
; -LCD display
; -TIC

inits:	lcall    tftinit			;init LCD
            

; Init RTC (=TIC)
		mov	    timecon,#01000001b	;24 hour system, tic started, continuous operation
	      					        ;no interrupts generated
		mov	    hour,#14h			;starting time hours
		mov	    min,#00h			;idem minutes
		mov	    sec,#00h			;idem seconds
; You could use hthsec, but it has no meaningful purpose.
		ret

; Print clock
print:  mov tftxpos,#0
        mov tftypos,#0
		              ;cursor routing

        mov  a,hour        		;use contents of registers hour, minutes and seconds.
                                      ;they have a hexadecimal content, thus translation to BCD mandatory.
       

		lcall	hexbcd8	        ;convert hex number into BCD
		lcall	tftoutbyte	    ;print byte BCD
		mov	    a,#':'		    ;ASCII code : used
		lcall	tftoutchar	    ;print
		; repeat for minutes and seconds
        mov  a,min        		;use contents of registers hour, minutes and seconds.
                   ;they have a hexadecimal content, thus translation to BCD mandatory.
  

		lcall	hexbcd8	        ;convert hex number into BCD
		lcall	tftoutbyte	    ;print byte BCD
		mov	    a,#':'		    ;ASCII code : used
		lcall	tftoutchar	    ;print
		; repeat for minutes and seconds
        mov  a,sec        		;use contents of registers hour, minutes and seconds.
                        ;they have a hexadecimal content, thus translation to BCD mandatory.
 

		lcall	hexbcd8	        ;convert hex number into BCD
		lcall	tftoutbyte	    ;print byte BCD
		; repeat for minutes and seconds
		ret

#include	"c:\aducgd1.inc"
