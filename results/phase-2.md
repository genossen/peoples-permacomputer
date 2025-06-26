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

### MCU Selection.

![](https://git.sr.ht/~vidak/peoples-permacomputer/tree/master/item/static/grant-searle-display-processor/ATMega328Video%202.2.gif)
