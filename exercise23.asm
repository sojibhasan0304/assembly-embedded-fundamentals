;=============SOJIB HASAN===============
;=============20 December 2025==========
; Template exersise 23 (runs on ADuC832 V3/4 board).
; Main program shows a running light without a delay.
; The ISR prints the clock (TIC based) every ½ second on the display
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022




		    org	  0000h			;starting address code; Dit programma (oef23) laat in het hoofdprogramma knipperlicht zien zonder delay.
            ljmp  main
            org	    0053h		;interrupt vector RTC (TIC)
            push    acc         ;push acc saves register A
            push    psw         ;saves status register (includes flags + register bank selection)
	       	lcall	introut		;jump to actual ISR
            pop     psw
            pop     acc
            reti

main:       mov     sp,#7fh     ;Set stack pointer
            lcall   initdisp    ;Initialize LCD display
  	        lcall	default		;init variables
		    lcall	initrtc		;init RTC (TIC) for interrupts every second (and clock)
		    lcall	initcpu		;init CPU for interrupts
	
	
       
        
lus:	    mov    a,p2
            rr     a
            mov    p2,a
            ljmp   lus

initrtc:	mov	   timecon,#01000111b	;initialize for interrupts every second
	       	mov	   intval,#64		;interrupt period
            mov	    hour,#00			;starting time hours
	       	mov	    min,#00			;idem minutes
	       	mov	    sec,#00			;idem seconds
; You could use hthsec, but it has no meaningful pu
		    ret

initcpu:	setb	ea			;enable all interrupts, enables global interrupts
		    mov	    ieip2,#00000100b		;enable TIC interrupts
   		    ret

default:	mov	p2,#01111111b			;starting value of the running light, Initial LED state
                                ;can this also be stored in p2?--> I think so
		    ret

initdisp:	lcall	tftinit		;Initializes LCD
			ret


introut:	mov tftxpos,#0     ;at top-left
            mov tftypos,#0

            mov  a,hour        		; ptint time

	        lcall	hexbcd8	        
       	    lcall	tftoutbyte	   
		    mov	    a,#':'		    
	        lcall	tftoutchar	    
		
            mov  a,min        		
  

       	    lcall	hexbcd8	        
		    lcall	tftoutbyte	    
		    mov	    a,#':'		    
	        lcall	tftoutchar	    
		
            mov  a,sec        		
		    lcall	hexbcd8	        
		    lcall	tftoutbyte	    
            ret









#include	"c:\aducgd1.inc"
