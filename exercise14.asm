;=============SOJIB HASAN===============
;=============12 December 2025==========
; Template exersise 14 (runs on ADuC832 V3/4 board).
; Show an 8-bit counter on the display that keeps count of the nuber of times p0.7
; is depressed.
;
; WARNING: the corresponding switch on the "dipswith" must be in the off position.
; WARNING: contact bounce can cause unsuspected counting errors. Solve this!
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022


counter	equ	10h			;variable used for counting

		org	      0000h			;starting address code

 	    mov	      sp,#7fh		;load stack pointer (mandatory in every program written)
		lcall	  inits			;we use a self written function for initializations
wait:	jb	      p0.7,wait		;wait for switch to be activate

;add debouncing delay (try without delay first)

wait1:	jnb	      p0.7,wait1	;wait till switch is released
		lcall	  inccounter	;use function to adjust the counter
		lcall	  printcounter	;use function to print counter
		ljmp	  wacht			;infinite loop

; intits	initializes lcd and variables used in the code		
inits:	lcall	  tftinit		;initialize LCD
		mov	      tellerl,#00h	;load counter with starting value
		ret				        ;return to main program

; incteller	adjusts the counter by adding 1
inccounter:
		ret

; printteller takes care of cursor routing and printing the ecounter
printcounter:
		ret

#include	"c:\aducgd1.inc"
