; Video overlay demonstration
; Author: Rog Blake (rogblake2000@yahoo.com)

; Echos characters received over serial port to display
; over live video. Excuse the ugly font - it's from an old TRS-80
; Prototyped using the STK-500

; Fonts 2 and 3 are alternate fonts from a TRS-80

; To do graphics, you can just build images using graphic characters
; or you can modify the code to display the bitmap in RAM rather
; than doing the character look-ups. The Mega16 doesn't have
; enough RAM to support beyond 100x100, which is one of the reasons
; I chose to display characters instead (achieving 192x160)

; If you use a Mega32 or Mega128, you have more RAM to work with
; so you could achieve higher resolution on pure graphics

; Assumes 14.31818 MHz XTAL, though this can be changed to 16 MHz
; External HSYNC to INT0
; External VSYNC to INT1
; PB7 -> 330 ohm resistor -> 75 ohm resistor to ground

	.include "C:\Program Files\Atmel\AVR Tools\include\m16def.inc"

.equ	VIDPORT 		= PORTB
.equ	SYNCPORT		= PORTC
.equ    VIDDDR			= DDRB
.equ	SYNCDDR			= DDRC
.equ	VIDPIN			= PB7
.equ	SYNCPIN			= PC7
.equ	lineTime		= 509
.equ	NORM_SYNC_LINE	= 1
.equ	VSYNC_LINE		= 243
.equ	FIELD_LINE		= 263
.equ	SYNCON			= 0
.equ 	SYNCOFF			= 1
.equ    NORMSYNC		= 0x02
.equ	INVSYNC			= 0x01

.MACRO SHIFTREG2VID		; Shift 6 bits of register out to port
	OUT VIDPORT,@0		; Bit 7
	LSL @0
	NOP
	OUT VIDPORT,@0		; Bit 6
	LSL @0
	NOP
	OUT VIDPORT,@0		; Bit 5
	LSL @0
	NOP
	OUT VIDPORT,@0		; Bit 4
	LSL @0
	NOP
	OUT VIDPORT,@0		; Bit 3
	LSL @0
	NOP
	OUT VIDPORT,@0		; Bit 2
	LSL @0
	NOP
.ENDMACRO

.dseg
	.org 	0x60
RAMBUF:		.byte	1000
RAMPTR:		.byte	2
CURSOR:		.byte	2
TMP_YL:		.byte	1
TMP_YH:		.byte	1
TMP_ZL:		.byte	1
LINE:		.byte   1
LINEH:		.byte   1
SYNCPOL: 	.byte	1

.cseg
	.org 0
	JMP	RESET	;RESET vector
	JMP	HSYNC1	;IRQ0 vector
	JMP	VSYNC	;IRQ1 vector
	JMP	RESET	;T2 COMPARE vector
	JMP	RESET	;T2 OVF vector
	JMP	RESET	;T1 CAPTURE vector
	JMP	HSYNC2	;T1 COMPARE A vector
	JMP	RESET	;T1 COMPARE B vector
	JMP	RESET	;T1 OVF vector
	JMP	RESET	;T0 OVF vector
	JMP	RESET	;SERIAL XFER COMPLETE vector
	JMP	RESET	;USART RX vector
	JMP	RESET	;USART DREG EMPTY vector
	JMP	RESET	;USART TX vector
	JMP	RESET	;ADC vector
	JMP	RESET	;EEPROM vector
	JMP	RESET	;COMPARATOR vector
	JMP	RESET	;2-WIRE vector
	JMP	RESET	;IRQ2 vector
	JMP	RESET	;T0 COMPARE vector
	JMP	RESET	;SPM READY vector

RESET:
	LDI	R16,HIGH(RAMEND)	; Init SP
	OUT	SPH,R16
	LDI	R16,LOW(RAMEND)
	OUT	SPL,R16
	
;	LDI R16, 0xA7
;	OUT OSCCAL, R16

 	LDI R16, 0x03 					;One NTSC line 509
	OUT OCR1AH, R16
	LDI R16, 0xFA
	OUT OCR1AL, R16

  	LDI R16,(1 << WGM12)|(1 << CS10)	;full speed; clear-on-match
 	OUT TCCR1B, R16
    LDI R16, 0x00						;turn off pwm and oc lines
  	OUT TCCR1A, R16
  	LDI R16, (1 << OCIE1A)				;enable interrupt T1A compare
  	OUT TIMSK, R16
	LDI R16, (1<<VIDPIN)
   	OUT VIDDDR, R16
	LDI R16, (1<<SYNCPIN)
	OUT SYNCDDR, R16
	LDI	R16, NORMSYNC
	STS	SYNCPOL, R16

	LDI	R16,1				; Line = 1
	STS	LINE,R16
	LDI	R16, 0x00
	STS	LINEH,R16

	LDI	R16,(1 << INT0) | (1 << INT1)
	OUT	GICR,R16

	CLR R16
	OUT UBRRH,R16
	LDI R16, 103				; 9600 baud
	OUT UBRRL,R16
	LDI R16,(1 << RXEN) | (1 << TXEN)
	OUT UCSRB,R16
	LDI R16,(1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0)	; 8N1
	OUT UCSRC,R16


	LDI	YH,HIGH(RAMBUF)
	STS	RAMPTR,YH
	LDI	YL,LOW(RAMBUF)
	STS	RAMPTR+1,YL

	LDI	R16,(1 << SE) | (1 << ISC11) | (1 << ISC01)
	OUT	MCUCR,R16			; Enable sleep and interrupt on rising edge of ext int
	
	CALL CLRS
	SEI
	
MAIN:
	SLEEP					; Wait for sync

	LDS	 R16,LINE			; Read line counter
	CPI	 R16,40 			; Ignore first 40 lines
	BRCS MAIN
	CPI	 R16,200			; And everything beyond line 200
	BRCC MAIN

	CLR	 R17
	LDI	 ZH,HIGH(CHRTAB*2)	; ZH = Table offset
	MOV	 ZL,R16				; + line number
	ANDI ZL,7
	ADD	 ZH,ZL

	SUBI R16,$28
	LDI	 YH,HIGH(RAMBUF)	; Point to current character line in RAM
	LDI	 YL,LOW(RAMBUF)
	ANDI R16,0xF8
	LSL	 R16				; Add line offset (line*32)
	ROL	 R17
	LSL	 R16
	ROL	 R17
	ADD	 YL,R16
	ADC	 YH,R17

	LD	 ZL,Y+
	LPM	 R16,Z
	LD	 ZL,Y+				; Read next character from RAM buffer into LSB
	LPM	 R0,Z				; Look it up
	LD	 ZL,Y+				; Fill all 32 registers
	LPM	 R1,Z
	LD	 ZL,Y+
	LPM	 R2,Z
	LD	 ZL,Y+
	LPM	 R3,Z
	LD	 ZL,Y+
	LPM	 R4,Z
	LD	 ZL,Y+
	LPM	 R5,Z
	LD	 ZL,Y+
	LPM	 R6,Z
	LD	 ZL,Y+
	LPM	 R7,Z
	LD	 ZL,Y+
	LPM	 R8,Z
	LD	 ZL,Y+
	LPM	 R9,Z
	LD	 ZL,Y+
	LPM	 R10,Z
	LD	 ZL,Y+
	LPM	 R11,Z
	LD	 ZL,Y+
	LPM	 R12,Z
	LD	 ZL,Y+
	LPM	 R13,Z
	LD	 ZL,Y+
	LPM	 R14,Z
	LD	 ZL,Y+
	LPM	 R15,Z
	LD	 ZL,Y+
	LPM	 R17,Z
	LD	 ZL,Y+
	LPM	 R18,Z
	LD	 ZL,Y+
	LPM	 R19,Z
	LD	 ZL,Y+
	LPM	 R20,Z
	LD	 ZL,Y+
	LPM	 R21,Z
	LD	 ZL,Y+
	LPM	 R22,Z
	LD	 ZL,Y+
	LPM	 R23,Z
	LD	 ZL,Y+
	LPM	 R24,Z
	LD	 ZL,Y+
	LPM	 R25,Z
	LD	 ZL,Y+
	LPM	 R26,Z
	LD	 ZL,Y+
	LPM	 R27,Z
	LD	 ZL,Y+				; Want to preserve YH & YL for now
	LPM	 ZL,Z
	STS	 TMP_YL,ZL
	LD	 ZL,Y+
	LPM	 ZL,Z
	STS	 TMP_YH,ZL
	LD	 ZL,Y+
	LPM	 ZL,Z
	STS	 TMP_ZL,ZL			; Also want to preserve ZL
	LD	 ZL,Y+
	LPM	 ZH,Z
	LDS	 ZL,TMP_ZL			; Load up YH, YL, and ZL
	LDS	 YL,TMP_YL
	LDS	 YH,TMP_YH	

; Start shifting out to the screen
	SHIFTREG2VID R16

	MOV  R16,R0
	SHIFTREG2VID R16

	MOV  R16,R1
	SHIFTREG2VID R16

	MOV  R16,R2
	SHIFTREG2VID R16

	MOV R16,R3
	SHIFTREG2VID R16

	MOV R16,R4
	SHIFTREG2VID R16

	MOV R16,R5
	SHIFTREG2VID R16

	MOV R16,R6
	SHIFTREG2VID R16

	MOV R16,R7
	SHIFTREG2VID R16

	MOV R16,R8
	SHIFTREG2VID R16

	MOV R16,R9
	SHIFTREG2VID R16

	MOV R16,R10
	SHIFTREG2VID R16

	MOV R16,R11
	SHIFTREG2VID R16

	MOV R16,R12
	SHIFTREG2VID R16

	MOV R16,R13
	SHIFTREG2VID R16

	MOV R16,R14
	SHIFTREG2VID R16

	MOV R16,R15
	SHIFTREG2VID R16

	SHIFTREG2VID R17
	SHIFTREG2VID R18
	SHIFTREG2VID R19
	SHIFTREG2VID R20
	SHIFTREG2VID R21
	SHIFTREG2VID R22
	SHIFTREG2VID R23
	SHIFTREG2VID R24
	SHIFTREG2VID R25
	SHIFTREG2VID R26
	SHIFTREG2VID R27
	SHIFTREG2VID R28
	SHIFTREG2VID R29
	SHIFTREG2VID R30
	SHIFTREG2VID R31
	CBI	VIDPORT, VIDPIN

	SBIS UCSRA,RXC			; Character received?
	RJMP MAIN				; No -> Keep looping
	LDS	 YL,CURSOR+1		; Otherwise, add to screen buffer
	LDS	 YH,CURSOR
	IN	 R16,UDR
	ST	 Y+,R16
	STS	 CURSOR+1,YL		; Save new cursor position
	STS	 CURSOR,YH
	OUT  UDR,R16			; Echo back to terminal
	RJMP MAIN

CLRS:
	LDI	 YH,HIGH(RAMBUF)	; Reset cursor position
	STS	 CURSOR,YH
	LDI	 YL,LOW(RAMBUF)
	STS	 CURSOR+1,YL
	CLR	 R16
	CLR	 R17
	LDI	 R18,3				; Clear screen memory
CLSLOOP:
	ST   Y+,R16
	DEC	 R17
	BRNE CLSLOOP
	DEC	 R18
	BRNE CLSLOOP
	RET

HSYNC1:
	LDS	 YL,LINE			; Increment line counter
	LDS	 YH,LINEH
	ADIW YL,1
	STS	 LINE,YL
	STS	 LINEH,YH
	RETI

HSYNC2:
	PUSH	XL
	PUSH	XH
	PUSH	YL
	PUSH	YH
	PUSH	ZL
	PUSH	ZH
	IN		ZL, SREG
	LDS 	YL, SYNCPOL
	SBRC	YL, SYNCON
	SBI		SYNCPORT, SYNCPIN
	SBRS	YL, SYNCON
	CBI		SYNCPORT, SYNCPIN
	LDI		ZH, 0x0E
DELAY:
	DEC		ZH
	BRNE	DELAY
; LineCount++
	LDS     YL, LINE
	LDS     YH, LINEH
	ADIW    YL, 0x01
	STS     LINE, YL
	STS     LINEH, YH
LINE248:
	LDI		XH, high(248)
	CPI     YL, low(248)
	CPC     YH, XH
	BRNE    LINE251
;inverted sync
	LDI		XL, INVSYNC
	STS		SYNCPOL, XL
LINE251:
	LDI		XH, high(251)
	CPI     YL, low(251)
	CPC     YH, XH
	BRNE    LINE263
;normal sync;
	LDI		XL, NORMSYNC
	STS		SYNCPOL, XL
LINE263:
	LDI		XH, high(263)
	CPI     YL, low(263)
	CPC     YH, XH
	BRNE    SYNC_OFF
;LineCount = 0;
	CLR  	XL
	STS  	LINE, XL
	STS  	LINEH, XL			; Reset line counter
	LDI	 	XH,HIGH(RAMBUF)	; Reset RAM pointer during vsync
	STS	 	RAMPTR,XH
	LDI	 	XL,LOW(RAMBUF)
	STS	 	RAMPTR+1,XL
SYNC_OFF:
	LDS 	YL, SYNCPOL
	SBRC	YL, SYNCOFF
	SBI		SYNCPORT, SYNCPIN
	SBRS	YL, SYNCOFF
	CBI		SYNCPORT, SYNCPIN
	OUT		SREG, ZL
	POP		ZH
	POP		ZL
	POP		YH
	POP		YL
	POP		XH
	POP		XL
	RETI

VSYNC:
	CLR  R16
	STS  LINE,R16
	STS  LINEH,R16			; Reset line counter
	LDI	 XH,HIGH(RAMBUF)	; Reset RAM pointer during vsync
	STS	 RAMPTR,XH
	LDI	 XL,LOW(RAMBUF)
	STS	 RAMPTR+1,XL
	POP YH
	POP YL
	POP XH
	POP XL
	RETI

	.org 0x1000

.include "C:\Download\osd\font.inc"


