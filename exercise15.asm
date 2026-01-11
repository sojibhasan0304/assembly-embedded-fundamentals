;=============SOJIB HASAN===============
;=============18 December 2025==========
; Template exersise 15 (runs on ADuC832 V3/4 board).
; Usage of the "jb" and "jnb" instructions
; Use the function switches to select one out of 4 running light patterns.
; You must be able to alter your choice when code is running.
;
; Try to solve the problem according to the 2 flowcharts shown in the lab.
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

overname equ 30h

		    org	  0000h			;starting address code

			mov	     sp,#7fh			;initialize stack pointer

main:		jnb	     p0.7,main0		;jump if p0.7 is depressed to main1
            jnb      p0.6,main1
            jnb      p0.5,main2
            jnb      p0.4,main3

            mov      a,overname
            cjne     a,#01,main10
            ljmp     main0

main10:     cjne    a,#02,main20
            ljmp    main1
main20:     cjne    a,#03,main30
            ljmp    main2
main30:     cjne    a,#04,main
            ljmp    main3

main0:      mov     overname,#01h
            lcall   print
            mov     dptr,#lpt1
            ljmp    ledf


main1:      mov     overname,#02h
            lcall   print
            mov     dptr,#lpt2
            ljmp    ledf

main2:      mov     overname,#03h
            lcall   print
            mov     dptr,#lpt3
            ljmp    ledf
main3:      mov     overname,#04h
            lcall   print
            mov     dptr,#lpt4
            ljmp    ledf




ledf:       clr     a
            movc    a,@a+dptr
            cjne    a,#10101010b,continue
            ljmp    main

continue:   mov     p2,a
            mov     a,p0
            anl     a,#0fh
            inc     a
            
            lcall   delaya0k05s
            inc     dptr
            ljmp    ledf

lpt1:       db  11110000b
            db  00001111b
            db  11000011b
            db  00111100b
            db  10101010b

lpt2:       db  11000000b
            db  00110000b
            db  00001100b
            db  00000011b
            db  00001100b
            db  00110000b
            db  11000000b

lpt3:       db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  10101010b

lpt4:       db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  11111111b
            db  10101010b


msg         db  "Hell Yeah! ",00h

#include	"c:\aducgd1.inc"
