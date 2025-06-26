# Project phase two results

## A ** Computer module. [GITHUB REPO: USER AUDMONT](https://github.com/adumont/hb6502)

This proof-of-concept design is perfect for an ultra-simple and
easily-constructed computer.

![](https://github.com/adumont/hb6502/blob/main/sbc/imgs/IMG_20210507_202922_616.jpg?raw=true){ width=50% }

This is the memory map:

```
Address - Component
$0000-$3FFF - RAM (16KB)
$4200-$4203 - ACIA
$6000-$600F - VIA
$8000-$FFFF - ROM (32KB)
```

The benefits of this design are many:

- It uses a 6502, not the relatively exotic 6800
- Will easily run FORTH and BASIC
- Much easier and simpler memory addressing logic
- Quite a luxurious amount of ROM, and this presents a good
  opportunity to pack it full of interesting things, such as FORTH
  words, BASIC variants with larger ROM footprints...
- Possesses serial through the ACIA chip

## B ** Video display processor.

The first phase of the project found that it was desirable to include
some form of visual output in the permacomputer. 

It was decided not to include any display into the design of the
permacomputer itself, and instead require the user to provide their
own television. 

Reasons for reaching this decision are that 

1. it is expected that televisions will be possible to salvage in a
   hypothetical societal collapse;
2. given that the video standard chosen by the project is analogue
   composite video, this simple form of signal should have some hope
   of being able to reverse engineered should cultural knowledge
   around computing significantly degenerate.

The second phase builds on the results of the first. The work done in
the second phase concluded that it was prohibitively expensive and
cognitively overwhelming to expect the visual display capabilities of
the permacomputer to conform to video designs contemporary with the
1970s and 1980s.

### MCU Video display.

**The project found a solution to composite video output in small
microcontrollers.** The idea is not to directly integrate video into the
8 bit computer design, but use a cheap microcontroller as a video
terminal, and have the computer use its ACIA chip to communicate with
it via serial.

Using microcontrollers does not contradict the spirit of
permacomputing. It radically reduces the chip count of the design,
allowing the project to proceed faster towards a
proof-of-concept. Using microcontrollers removes the need to sacrifice
system memory for VRAM. it also makes the permacomputer modular--if
one part of the system fails, you can still use the other half.

[READ
MORE](https://git.sr.ht/~vidak/peoples-permacomputer/tree/master/item/log/2024-12-04-mcu-analysis.md)

### MCU Selection. "The Grant Searle".

<img src="https://git.sr.ht/~vidak/peoples-permacomputer/blob/master/static/grant-searle-display-processor/MixedDisplay.jpg">

#### SCHEMATIC FOR BOTH PROJECTS 

*This consists of two modules and when used together produces a generic
ANSI terminal (also supporting graphics) using a TTL compatible serial
interface running at 115200 baud (can be changed in software) so can be
used for any computer project that has a serial I/O and needs a keyboard
and display.*

This uses an ATmega88 (or 168 pr 328) for the keyboard and serial
buffer and an ATmega328 for the display processor.\ Since the display
is independent of the host (eg Z80) processor, the host has no
processing overhead so when connected to some other host.

**The circuit is in two distinct parts, as shown below. If only a
display is needed then only the circuit to the left side of the line is
needed.**

**(NOT SHOWING DEFAULT FONT CONFIGURATION RESISTORS - SEE BELOW)**

<img src="https://git.sr.ht/~vidak/peoples-permacomputer/blob/master/static/grant-searle-display-processor/ATMega328Video%202.2.gif">

**Note 1:** Not all power supply pins are not shown. These must be
connected to the appropriate power rail.\
**Note 2:** Include R3 for NTSC display only, otherwise do not make any
connection between PD7 and ground.\
**Note 3:** Include R6 and also connect PB1 on the interface to ground
for 4-bit data ONLY. Do not connect any green  wires when using the
4-bit interface.\
**Note 4:** Include R7 and also connect PB2 on the interface to ground
for two-wire ONLY. Do not connect any red or green wires.\
**Note 5:** If a specific display start-up configuration is always used,
the code can be altered (see [below](#SourceCode)) and all configuration
resistors omitted.\
**Note 6:** Default font will be 80 char, single-height, bold. To change
it, pull the following display lines low with 10K resistors:\
        Pin 6 (PD4) - 40 chars per line if pulled low via a 10K
resistor\
        Pin 5 (PD3) - Double height if pulled low via a 10K resistor\
        Pin 4 (PD2) - Non-bold if pulled low via a 10K resistor\

#### Monitor and keyboard controllers Controlled by low-cost ATMEL \"Mega\" processors

- Project 1: PAL or NTSC multi-mode text and graphics display with
  I^2^C, 4 or 8 bit interface\
- Project 2: PC keyboard\--\>serial and serial\--\>display interface\
- Use both together to allow any project that uses serial I/O to have
a screen and keyboard***

![](Grant's%20video%20and%20keyboard%20interface_files/MixedDisplay.jpg)

-----------------------------------------------------------------------------------




 


------------------------------------------------------------------------

**[]{#Prototype}PROTOTYPE**

The two parts of the above schematic (8 bit interface, PAL mode) are
constructed as shown here. A resistor links each reset to the power
because I program the chips in-circuit.

![](Grant's%20video%20and%20keyboard%20interface_files/MonitorAndKeyboardPrototype.jpg){border="0"
width="500" height="404"}

*Note: this picture is for the schematic version 2.1. Minor wiring
changes for version 2.2*

------------------------------------------------------------------------

**[]{#ProcessingAndCircuitDescription}PROCESSING AND CIRCUIT
DESCRIPTION**

The serial/keyboard controller runs at 11.0592MHz (to coincide with the
115200 Baud serial interface) and the display processor runs at 16MHz.

The serialisation of the video data is done using a 74HCT166 parallel to
serial converter.

The sync and video signals are merged using a resistor network which
works fine for me and terminates in a standard 75 ohm video input on the
monitor.

The keyboard used is a standard \"PC\" keyboard with a PS/2 connector
(NOT USB). Caps lock and num lock works and it updates the keyboard LEDs
as needed. Non-ASCII keys return codes, but this isn\'t finalised yet
and is easily changed in the code.

Here is a block diagram of the display and keyboard interface being used
together as a serial-driven I/O for a microcomputer system:

                 
![](Grant's%20video%20and%20keyboard%20interface_files/ATmega%20display%20and%20kb%20block.gif){border="0"
width="600" height="394"}

**ATmega88/168/328 processor (Serial and keyboard I/O)\
**This buffers the serial input and stores it in a circular buffer 800
chars in size. The RTS is cleared when less than 32 character spaces
remain in the buffer and is set when there are less than 32 char spaces
used. This is to allow overrun from the sending system without losing
characters.\
When a character or command is to be sent to the display processor, the
code is placed on the output port pins.\
Some ANSI commands are interpreted and converted to the relevant video
processor commands.

**ATmega328 processor (video)\
**This has 2K RAM so can accommodate an 80x25 char display with some
bytes remaining for workspace. The main processing is transferring data
from the memory to the output serial shifter, and producing the HSYNC
and VSYNC signals. During the inactive time of the display, the input
port/status bits can be read and the incoming data interpreted either as
a command or as a character that is inserted into the display. Scrolling
and clearing of the screen is handled within this processor (very
quickly!)\
It is mainly Daryl\'s code in there, but I have adapted it for the
ATmega328 processor which has 2K RAM, added some routines of my own and
altered the row/col cursor positioning commands to take a parameter byte
instead of using a set of character spaces and changed the method to
allow the display of control-code characters. This allowed me to modify
it to produce an 80x25 display. I also changed the code so that only one
timer is needed instead of two. Additionally the handshaking/data read
code was changed to allow me to interface to the keyboard/serial
controller without needing a latch or the other chips that he used. The
dot clock runs at 16MHz to allow an 80 column display to be shown on a
standard video monitor/TV.

An  ATmega328 pin (see schematic) determines whether PAL (50Hz) or NTSC
(60Hz) display is required. Connect via a resistor to ground for NTSC.
