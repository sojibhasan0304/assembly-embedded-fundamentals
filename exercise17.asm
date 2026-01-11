;=============SOJIB HASAN===============
;=============18 December 2025==========
; Template exersise 16, 17, 18, 19 ans 19bis (runs on ADuC832 V3/4 board).
; Usage of the ADC hardware unit
; This template only shows the basic usage of the ADC.
; Create newe templates for all subsequent tasks with the ADC
; -exercise17: print voltmeter in "volts" (0,000V->4.998V)
; -exercise18: read the LM335 in hex
; -exercise19: read the LM335 in Kelvin.
; -exercise19bis: read the LM335 in degrees Celsius
; The sensor output is 10mV/Kelvin.
; 273Kelvin=0 degrees Celsius.
; potmeter is input p1.7.
; LM335 is input p1.6
; Thomas More University
; Written by Roggemans M. (MGM) v2 on 02-02-2016
; Revisited by MGM gd on 07-2022

		  org   0000h			;starting address code

          mov	  sp,#7fh		;initialize the stack pointer
		  lcall	  inits			;initialize whatever is needed
loop:	  lcall	  measure			;mmeasure the specific analog input (
		  lcall	  print			;druk uitkomst af
		  ljmp	  loop		    ;blijf dit herhalen

; inits 
; -lcd display
; -ADC
; -? (message on the display indicating what the code does?)
inits:    lcall   tftinit

		  mov    adccon1,#11001100b	;settings adc converter
; power up the ADC, use external reference, conversion speed 8 times slower than CPU clock
; maximum sample time, no trigger by t2 or external device.
		  mov    adccon2,#7		    ;channel selection (7=potentiometer)
                                        ;disable DMA, interrupts and do not start a conversion.
	      ret

; starts a measurement, waits untill the conversion is complete. Results are passed on
; via adcdatah and adcdatal (WARNING: the 4 MSB(bits) have an invalid content!
measure:   setb   sconv			        ;start conversion (addressable bit in adccon2 register)
measure1:  jb	  sconv,measure1		;wacht for conversion to complete (returns to 0 when done)
           ret

; this function preforms the necessary calculations and prints the result on the display
; Calculations are explained in the lab, but not implemented in this template.
print:    mov      a,adcdatah
          anl      a,#0fh  ;removes the first 4 high bits


;multiply16    this routine multiplies 2 16-bit numbers
;input;        r1,r0 = first number (r1 msb)
;              r3,r0 = second number (r3 msb)
;output        r3,r2,r1,r0 (r3 msb)

           mov     r1,a
           mov     r0,adcdatal
           ;first multiply  with 5000
           ;5000(dec)   => 1388 hex
           mov     r3,#13h
           mov     r2,#88h
           lcall   mul16
            
;div32     this routine divides 2 32-bit numbers.
;input     r3,r2,r1,r0 = FIRST NUMBER (R3=MSB)
;          ,r7,r6,r5,r4 = SECOND NUMBER (r7=msb)
;output     r3,r2,r1,r0 = qoutient  (R7=MSB)
;          ,r7,r6,r5,r4 = rest (r3=msb)
        
            mov    r7,#00h
            mov    r6,#00h
            mov    r5,#10h
            mov    r4,#00h
            lcall  div32

            ;max result will always be (4095/4096)*5000 = 4998 => hexbcd16
            
            ;mov    r1,05h
            ;mov    r0,04h
            ;rn to rn is not possible
            

            lcall  hexbcd16

            mov     tftxpos,#0
            mov     tftypos,#0
            mov     a,r1
            swap    a
            lcall   tftoutnib
            mov     a,#','
            lcall   tftoutchar
            mov     a,r1
            lcall   tftoutnib
            mov     a,r0
            lcall   tftoutbyte
            mov     a,#'V'
            lcall   tftoutchar
 		    ret

#include	"c:\aducgd1.inc"
