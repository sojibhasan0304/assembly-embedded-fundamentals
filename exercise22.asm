;=============SOJIB HASAN===============
;=============20 December 2025==========
; Template exersise 22 (runs on ADuC832 V3/4 board).
; Main program shows a clock in hh:mm:ss (based on the TIC) on the display.
; The ISR toggles the LED’s @ variable speed (adjust with potmeter)
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

meter       equ   10h

		    org	  0000h			;starting address code
            ljmp  main
            mov   sp,#7fh

            org	    0053h		;interrupt vector RTC (TIC)
		    ljmp	retarded

           
main:	mov	    sp,#7fh	;init stack pointer
		lcall	initrtc		;init RTC (TIC) for interrupts every second (and clock)
		lcall	initcpu		;init CPU for interrupts
		lcall	default		;init variables
		lcall	initdisp	;init LCD

loop:   mov     a,#7
        lcall   getadc      
        mov     meter,a
        lcall   print
        ljmp    loop
        
        
       
            

initrtc:	mov	   timecon,#01010111b	;initialize for interrupts every second
	       	mov	   intval,#1		;idem
            mov	    hour,#00h			;starting time hours
	       	mov	    min,#00h			;idem minutes
	       	mov	    sec,#00h			;idem seconds
            ret

initcpu:	setb	ea			
		    mov	    ieip2,#00100100b		
   		    ret

            
default:	mov	p2,#01111111b
            ret

initdisp:	lcall	tftinit		;init display
            mov    adccon1,#11001100b	;settings adc converter
		    mov    adccon2,#7		    ;channel selection (7=potentiometer)
			ret




print:        mov tftxpos,#0
              mov tftypos,#0

              mov  a,hour        		

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

retarded:     push  acc
              clr   a
              cjne  a,meter,next
              inc   meter


next:         mov   intval,meter
              mov   a,p2
              rr    a
              mov   p2,a
              pop   acc
              reti


#include	"c:\aducgd1.inc"
