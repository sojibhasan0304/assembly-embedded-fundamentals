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
print:	  
          mov      tftxpos,#0
          mov      tftypos,#0
          mov      a,adcdatah
          anl      a,#00001111b  ;removes the first 4 high bits
          mov      r1,a
          mov      r0,adcdatal
          lcall    hexbcd16     ; convert 16bit adc val to 24bit dec val
          mov      a,r1         ; show 8msb
          lcall    tftoutbyte   ; show 81sb
          mov      a,r0
          lcall    tftoutbyte

		  ret

#include	"c:\aducgd1.inc"
