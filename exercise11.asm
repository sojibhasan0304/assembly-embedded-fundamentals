;=============SOJIB HASAN===============
;=============12 December 2025==========
; Template exersise 11 (runs on ADuC832 V3/4 board).
; Usage of the display functions and arithmetic.
; Show 2 16-bit counters (1 counts up by one, the other counts down by one).
; Print the counter values in BCD and HEX on the display (4 different locations).
;
; Adjust the code so the value of the switches is added or subtracted?
;
; AS OF NOW ALL TEMPLATES WILL HAVE ERRORS. FIND AND CORRECT THEM!!
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

; The EQU directive is used to "declare" names to constants. This allows us to use names
; instead of numbers as addresses for variables.

teller1h	equ	10h			;Address of first variable high byte
teller1l	equ	11h			;Address of first variable low byte
teller0h	equ	12h			;Address of second variable high byte
teller0l	equ	13h			;Address of second variable low byte


		org	  0000h			  ;starting address code
        mov   sp,#7fh         ;initialize stack pointer

		lcall tftinit		  ;initialize LCD display
		mov	  teller1h,#00h	  ;initialize bith variables to their starting value
		mov	  teller1l,#00h	  ;idem
		mov	  teller0h,#00h	  ;idem
		mov	  teller0l,#00h	  ;idem

lus:	mov	  tftypos,#0	  ;cursor routing (first lien first character)
		mov   tftxpos,#0	  ;idem

		mov	  a,teller1h      ;print MSB variable in hex
		lcall tftoutbyte
		mov	  a,teller1l      ;print LSB variable in HEX
		lcall tftoutbyte      
		mov	  tftxpos,#10      ;reposition cursor
		
; Translate the 16 bit hex value in variable into BCD value, and print it on the display.

; hexbcd16    zet een 16 bit hex getal om in een 24 bit bcd getal (translates 16 bit hex into 24 bit BCD)
; input       r1,r0 = 16 bit hex getal (r1=msb) (getal=number)
; output      r2,r1,r0 =24 bit bcd getal (r2=msb)
;
; de routine gebruikt alleen de registers r3,r2,r1,r0 van de huidige bank (register usage by the function)


		mov	  r1,teller1h     ;load input registers function with appropriate values
		mov   r0,teller1l
		lcall hexbcd16        ;translation is done by the function
		mov	  a,r2            ;print MSB result
		lcall tftoutbyte

		;repeat for values in r1 and r0.
        mov a,r1
        lcall tftoutbyte
        mov a,r0
        lcall tftoutbyte
		;idem hex for variable 2 on second line.
		mov tftxpos, #0
        mov tftypos, #2

        mov a, teller0h
        lcall tftoutbyte
        mov a, teller0l
        lcall tftoutbyte
        mov tftxpos, #10
		;idem BCD for variable 2 on second half second line.

        mov r1,teller0h
        mov r0, teller0l
        lcall hexbcd16

        mov a,r2
        lcall tftoutbyte
        mov a, r1
        lcall tftoutbyte
        mov a,r0
        lcall tftoutbyte

		mov	  a,teller1l      ;We need to execute a 16 bit addition to incremnt variable 1
		add	  a,#01h          ;add one
		mov	  teller1l,a      ;write result back
		mov	  a,teller1h      ;use carry flag to adjust MSB variable 1
		addc  a,#00h
		mov	  teller1h,a      ;write result back
		
		;Repeat for the 16 bit subtraction of variable 2 (do not forget to clear the CY flag).
		clr c
        mov a, teller0l
        subb a, #01h
        mov teller0l, a
        mov a, teller0h
        subb a, #00h
        mov teller0h,a
		ljmp  lus             ;infinite loop

#include	"c:\aducgd1.inc"
