;=============SOJIB HASAN===============
;=============12 December 2025==========
; Template exersise 13 (runs on ADuC832 V3/4 board).
; Print the names of your team mates on the display.
; Explore the features of the functions (e.g. adjusting background and front colors)
; in the include file. Read instructions in the include file!!
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		  org	  0000h			;starting address code
          
          mov   sp,#7fh         ;initialize stack pointer
		  lcall	tftinit		    ;initialize display
          mov red, #31
          mov green, #31
          mov blue, #10
           lcall tftsetbgcolor
            mov red, #5
          mov green, #19
          mov blue, #24
          lcall tftsetbgcolor
          lcall tftclear


loop:      mov	tftxpos,#0		;cursor routing
		  mov	tftypos,#0		;idem
		  mov	dptr,#name			;store the starting address of the string in the dptr
		  lcall	tftoutmsga		;print the string
loop1: 
          clr a
          movc a, @a+dptr
          inc dptr
          jnz loop1 

        ; print names 
        clr a 
        movc  a, @a+dptr
        cjne a, #0fh, print 
        ljmp    loop
print:
        inc tftypos
        mov tftxpos, #0 
        lcall tftoutmsga
        ljmp loop1

; The string below contains 1 name. Adjust the code so 2 names can be printed
; in different locations on the display.
; Cursor routing is not supported by the tftoutmsga function!

name:		db	"Jan X",00h	;why is there 00h in this table?
            db	"test 1",00h
            db	"test 2",00h
            db	"test 3",00h
            db	"test 4",00h
            db	"test 5",00h
            db	"test 9999999999",00h
            db 0fh

#include	"c:\aducgd1.inc"
