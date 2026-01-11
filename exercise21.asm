;=============SOJIB HASAN===============
;=============20 December 2025==========
; Template exersise 21 (runs on ADuC832 V3/4 board).
; An ISR shows a running light on the LED’s (changes every second). 
; The main program shows a decimal counter (00->99) on the LCD (0.5s software delay)
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

loop		equ	10h			;geheugenplaats opslaan info looplicht
teller		equ	11h			;geheugenplaats opslaan decimale teller

		org	    0000h		;starting address code

		ljmp	main		;jump to main code

		org	    0053h		;interrupt vector RTC (TIC)
		ljmp	introut		;jump to actual ISR

; This is the main program.

main:	mov	    sp,#7fh	;init stack pointer
		lcall	initrtc		;init RTC (TIC) for interrupts every second (and clock)
		lcall	initcpu		;init CPU for interrupts
		lcall	default		;init variables
		lcall	initdisp	;init LCD
       
        
lus:	lcall   plus        ;adjust decimal counter
        lcall	print		;print clock
		ljmp	lus			;infinite loop

initrtc:	mov	   timecon,#01010111b	;initialize for interrupts every second
	       	mov	   intval,#1		;idem
            mov	    hour,#00h			;starting time hours
	       	mov	    min,#00h			;idem minutes
	       	mov	    sec,#00h			;idem seconds
; You could use hthsec, but it has no meaningful pu
		    ret

initcpu:	setb	ea			;enable all interrupts
		    mov	    ieip2,#00100100b		;enable TIC interrupts
   		    ret

default:	mov	p2,#01111111b			;starting value of the running light
                                ;can this also be stored in p2?--> I think so
            mov teller,#00h
		    ret

initdisp:	lcall	tftinit		;init display
			ret

plus:       mov     a,#10
            lcall   delaya0k05s
            mov	a,teller		;teller in accu
		    cjne a,#99,next     ;adjust a register. The value must be limited to 99
            mov  a,#99
            clr  a
next:
            inc a
	       	mov	teller,a		;store calculated value back in register
		    ret

print:	    mov  tftxpos,#0         ;print teller on the display
            mov  tftypos,#0
            mov  a,teller
            lcall hexbcd8
            lcall tftoutbyte
	       	ret

introut:	push   acc			;push all necessary registers
		                        ;load running light info in a register
		                        ;update running light data
		    mov	a,p2			;store updated value back
            rr  a
		    mov p2,a                     ;write value to LED's
		    pop	  acc			     ;restore pushed registers (remember LIFO system)
		    reti

#include	"c:\aducgd1.inc"
