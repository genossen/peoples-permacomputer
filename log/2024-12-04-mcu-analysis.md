# MCU Analysis

The permacomputer project is anxious to build a machine that is able
to be immediately comprehended by those uninitiated to electronic
computation. Outside the context of mass industrial society, after,
say, a massive ecological and societal collapse, electronic computers
may become an arcane and forgotten knowledge. 

The meanings embedded within the human practice of using computers is
arguably more important than the computers themselves. What good are
computers if society does not consider them a virtue? To this end, the
permacomputer project asserts that it is possible to build a computer
that will not only be durable and long-lasting, but also personally
engaging and culturally enriching.

The concept of the "human-computer interface" encompasses this
criteria. In the context of the people's permacomputer, we are merely
discussing the computer's video output.

The first phase of the project found that it was desirable to include
some form of visual output in the permacomputer. It was decided not to
include any display into the design of the permacomputer itself, and
instead require the user to provide their own television. Reasons for
reaching this decision are that (a) it is expected that televisions
will be possible to salvage in a hypothetical societal collapse; (b)
given that the video standard chosen by the project is analogue
composite video, this simple form of signal should have some hope of
being able to reverse engineered should cultural knowledge around
computing significantly degenerate.

The second phase builds on the results of the first. The work done in
the second phase concluded that it was prohibitively expensive and
cognitively overwhelming to expect the visual display capabilities of
the permacomputer to conform to video designs contemporary with the
1970s and 1980s.

The project found a solution to composite video output in small
microcontrollers. The idea is not to directly integrate video into the
8 bit computer design, but use a cheap microcontroller as a video
terminal, and have the computer use its ACIA chip to communicate with
it via serial.

Using microcontrollers does not contradict the spirit of
permacomputing. It radically reduces the chip count of the design,
allowing the project to proceed faster towards a
proof-of-concept. Using microcontrollers removes the need to sacrifice
system memory for VRAM. it also makes the permacomputer modular--if
one part of the system fails, you can still use the other half.

# Previous Microcontroller Video Terminal Projects

## the 'geoff graham'

### hardware

MCU: PIC32MX250F128B
Resolution: 18 lines x 48 characters
MCU Price: 
     - ebay: prohibitive
	 - aliexpress: AUD8.25

### references

https://geoffg.net/terminal.html

http://retro.hansotten.nl/other-retro-articles/ascii-video-terminal/

hhttps://hackaday.io/project/173216-ascii-video-terminal

https://www.pcbway.com/project/shareproject/ASCII_Video_Terminal_2.html

https://github.com/dhansel/TerminalUSB

## the 'tellymate'

### hardware

MCU: ATMega8
Resolution: 25 lines x 38 characters
MCU Price: AUD3.51

### references

http://www.batsocks.co.uk/products/Other/TellyMate%20Tiny.htm

## the 'videoblaster'

### hardware

MCU: Atmega 1284P
Resolution: 25 lines x 40 chars
MCU Price: AUD2.85

### references

https://www.hackster.io/janost/avr-videoblaster-8026fd

## the 'octapentaveega'

### hardware

MCU: Attiny85
Resolution: 16 lines x 32 chars
MCU Price: AUD4.91

### references

https://github.com/rakettitiede/octapentaveega

## the 'simple video adaptor'

### hardware

MCU: Mega8, Mega16, Mega32, Mega8535, etc.
Resolution: 20 lines x 38 chars
MCU Price: see below ATMega 8

### references

https://www.serasidis.gr/circuits/AVR_VGA/avr_vga.htm

## the 'small tv terminal'

### hardware

MCU: ATMega8
Resolution: 25 lines x 40 chars
MCU Price: AUD3.51

### references

https://www.serasidis.gr/circuits/TV_terminal/Small_TV_terminal.htm

## the 'circuit cellar'

### hardware

MCU: TM4C1233H6PM
Resolution: 20 lines x 75 chars
MCU Price: prohibitive

### references

https://circuitcellar.com/research-design-hub/build-a-composite-video-text-terminal/

## the 'grant searle'

### hardware

MCU: ATmega88 + ATmega328
Resolution: 25 lines x 80 chars
MCU Price: AUD1.53 + AUD2.63

### references

https://web.archive.org/web/20190907195213/http://searle.hostei.com/grant/MonitorKeyboard/index.html
