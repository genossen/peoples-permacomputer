Thanks for looking at my latest text video display.  

Feel free to use this project for personal use.  I do not give permission for anyone to use
this design or code in any commercial applications without prior written permission.

I offer it for your use as is and without any warranty - expressed or implied.

Having said that, this files contains the command set list and sample 6502 code for your reference.

I have also included the full ATMega88 source code, schematic, and font reference images.

I hope you find this imformation helpful.

Daryl





This is the command set:


ASCII Code	Function
------------------------------------------------------------------------
00 - 07		Null	
     08		backspace (destructive)
     09		TAB (stops are 0, 8, 16, 24, 32)
     0A		Line Feed
     0B		Null
     0C		Form Feed (Clear the screen and move cursor to top left)
     0D		Carrage Return (clears rest of line)
0E - 1F		Null
20 - 7E		Standard printable ASCII characters in 8x8 font
     7F		Delete (clear character @ cursor, does not shift rest of line left)
80 - 9F		print the 32 special purpose characters (from font positions 0-31)
A0 - B8		Move cursor directly to Row 0 - 24 respectively
     B9		Null
     BA		Cursor Home - move cursor to top left without clear
     BB		Turn Cursor off (hide it)
     BC		Turn on Block Cursor 
     BD		Turn on underscore Cursor
     BE		Set Cursor to Blink Mode (blink rate is approx .5 sec on, .5 sec off)
     BF		Set Cursor to Solid Mode (no blink)
C0 - E7		Move cursor directly to Column 0 - 39 respectively
     E8		Move Cursor up one row (no scrolling)
     E9		Move Cursor down one row (no scrolling)
     EA		Move Cursor left one column (no scrolling)
     EB		Move Cursor right one column (no scrolling)
     EC		scroll screen up one row (bottom is filled in with spaces)
     ED		scroll screen down one row (top is filled in with spaces)
     EE		scroll screen left one column (right column is filled in with spaces)
     EF		scroll screen right one column (left column is filled in with spaces)
     F0		Select the lower 128 characters (including supported control characters)
     F1         Select the upper 128 characters (including box drawing set or Inverse Video)
     F2		Set Font to Primary - 256 DOS character set
     F3 	Set Font to Alternate - 128 characters with Inverse Video Support
F4 - FF		Null (reserved for expansion)






This is the suggested 6502 assembly code to provide character output: (No flip-flop used)


;*********************************************************;
;							  ;
;     SBC-2 v2.5 Video Display Driver (c)2003-2004	  ;
;                        v1.0  				  ;
;                  by Daryl Rictor   			  ;
;							  ;
;*********************************************************;
;======================================================================
; Serial Shift Register Routines
; *** assumes Bit 7 of port B is used for Handshake
;======================================================================
;
; 6522 Definitions from SBC-4 - adjust this to your system.
;
Vportb	=  $0280		; VIA1 Port B
Vddrb	=  $0282		; VIA1 Port B DDR
Vsr	=  $028A		; VIA1 Shift Register
Vacr	=  $028B		; VIA1 ACR
Vifr	=  $028D		; Via1 IFR bit 1
Vier	=  $028E		; Via1 IER

V_idle          = $ee       ; Bit 7 holds the next expected idle state


;----------------------------------------------------------------------
; Output contents of A to the Video Display
;  A is preserved, Flags are changed.
;
; ATMega88 handshake works by toggling the HS pin after each character
; Initial power-on state is low - ready for character
;
; We toggle the v_idle byte on each character sent to compare with what
; is received from the PB7.  There is a possibility that this could get
; out of sync if there is an outside write to the VIA Shift Register
;----------------------------------------------------------------------
VOutput         pha
                lda  V_idle             ; toggle to new expected idle state
                eor  #$80  
                sta  V_idle
VOutput1        lda  vportb             ; test handshake bit (pb7)
                eor  V_idle             ; is old idle state (xored bit7=1)?
                bpl  VOutput1           ; if pb7=busy wait for AVR idle
                pla
                sta  vsr                ; send to display via shift register
                rts
 
;----------------------------------------------------------------------
; Call this once to initialize the interface
; it sets up Port B, pin 7 and CB1/CB2 for serial mode
; A is changed and Flags are changed.
;----------------------------------------------------------------------
VInitDisp                                             
                sei                     ; disable interrupts
                lda  vddrb              ; get ddr b
                and  #$7F               ; force bit 7=0
                sta  vddrb              ; set bit 7 to input
                lda  vacr               ; get ACR contents
                and  #$E3               ; mask bits 2,3,4
                ora  #$18               ; set Shift out under control of PHI2 mode
                sta  vacr               ; store to acr
                lda  #$04               ; shift register flag in IER
                sta  vier               ; disable shift register interrupts
                lda  #0                 ; set initial expected idle state
                sta  V_idle
                cli                     ; Enable Interrupts again
                rts                     ; done





This is the suggested 6502 assembly code to provide character output using the D flip-flop:


;*********************************************************;
;							  ;
;     SBC-2 v2.5 Video Display Driver (c)2003-2004	  ;
;                        v1.0  				  ;
;                  by Daryl Rictor   			  ;
;							  ;
;*********************************************************;
;======================================================================
; Serial Shift Register Routines
; *** assumes Bit 7 of port B is used for Handshake
;======================================================================
;
; 6522 Definitions from SBC-4 - adjust this to your system.
;
Vportb	=  $0280		; VIA1 Port B
Vddrb	=  $0282		; VIA1 Port B DDR
Vsr	=  $028A		; VIA1 Shift Register
Vacr	=  $028B		; VIA1 ACR
Vifr	=  $028D		; Via1 IFR bit 1
Vier	=  $028E		; Via1 IER

;----------------------------------------------------------------------
; Output contents of A to the Video Display
;  A is preserved, Flags are changed.
;
; ATMega88 handshake works with D flip-flop (FF).  Outgoing clock pulses
; on the VIA CB1 pin clock the FF high and mark the display busy.  Once
; the ATMega88 is done and ready for the next character, it will pulse
; the FF /CLR pin and reset the FF low.  VIA PB7 monitors the FF output.
;
;----------------------------------------------------------------------
VOutput
		bit  vportb		; 4 read handshake byte
		bmi  Voutput		; 2/3 if 0, wait for AVR to be ready
		sta  vsr		; send to display via serial port
		rts			; return
 
;----------------------------------------------------------------------
; Call this once to initialize the interface
; it sets up Port B, pin 7 and CB1/CB2 for serial mode
; A is changed and Flags are changed.
;----------------------------------------------------------------------
VInitDisp                                             
                sei                     ; disable interrupts
                lda  vddrb              ; get ddr b
                and  #$7F               ; force bit 7=0
                sta  vddrb              ; set bit 7 to input
                lda  vacr               ; get ACR contents
                and  #$E3               ; mask bits 2,3,4
                ora  #$18               ; set Shift out under control of PHI2 mode
                sta  vacr               ; store to acr
                lda  #$04               ; shift register flag in IER
                sta  vier               ; disable shift register interrupts
                cli                     ; Enable Interrupts again
                rts                     ; done

