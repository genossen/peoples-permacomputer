
# Phase 4

## Recap

Big exploration into BASIC, and Tiny BASIC.

The permacomputer needed some sort of user operating environment--a human-computer interface.

The project is opting for the distribution of the software environment in paradigmatic microcomputer BASIC.

The various utilities and tools will be printed as code listings.

The archival quality of paper is many orders of magnitude better than hard disks, CD-ROMs, or other digital mediums.

https://vidakovich.itch.io/wrdprobas

https://vidakovich.itch.io/editbas

Please see [Phase 3 Results](phase-3.md) for all transcription links.

### _ENDOXA_: HISTORICAL TEXT EDITORS

| Filename       | Year | Platform             | Transcription status | Lines of code | Code size |
|----------------|------|----------------------|----------------------|---------------|-----------|
| `LED.BAS`      | 1981 | CBM PET, APPLE II    | COMPLETE             | < 300         | ~ 7 KB    |
| `WRDPRO.BAS`   | 1977 | GE 635 _(Dartmouth)_ | COMPLETE             | ~ 350         | ~ 17 KB   |
| `EDITYPE.BAS`  | 1983 | VIC-20               | COMPLETE             | ~ 150         | ~ 5 KB    |
| `SCRIPTOR.BAS` | 1983 | ATARI 8-BIT          | STARTED              | NOT FINISHED  |           |
| `EDIT.BAS `    | 1977 | ALTAIR 8K            | COMPLETE             | ~ 100         | ~ 5 KB    |

### Stefan's BASIC

This BASIC implementation targets almost all of the cheap hobbyist micro-controller boards that exist.

However, its file handling routines are, like all BASICs, idiosyncratic.

Below is reproduced the tutorial from the core repository.

The following outputs to text file two columns, the second being squares of the first.

```
10 REM "Simple FILE I/O demo"
20 REM ""
30 N=4
40 DIM A$(80)
100 PRINT "Write squares to file"
110 OPEN "daten.txt",1
120 FOR I=1 TO N
130 PRINT I, I*I
140 PRINT &16, I
150 PRINT &16, I*I
160 NEXT I
170 CLOSE 1
```

The following prints the numbers from file as the integer data type.

```
200 PRINT "Read data as numbers"  
210 OPEN "daten.txt"
220 FOR I=1 TO N
230 INPUT &16, A
240 INPUT &16, B
250 PRINT "Read "; A; "^2="; B
260 NEXT
270 CLOSE 0
```

The following reads the file as strings.
Note the idiosyncratic file error handling compared to the historical BASICs.	
Most similar to Microsoft BASIC.

```
300 PRINT "Read data as strings, use EOF status"
310 @S=0
320 OPEN "daten.txt"
330 IF @S<>0 THEN PRINT "OPEN failed" : END
340 FOR I
350 INPUT &16, A$
360 IF @S=-1 THEN BREAK 
370 PRINT "Line",I,"string '";A$; "' Status = " @S
380 NEXT
390 CLOSE 0
400 PRINT I, "lines read"
410 PRINT "Status =", @S 
```

The above read the file as lines of strings.

The below reads every number digit as a character only.

```
500 PRINT "Read Character by Character use EOF status"
510 @S=0
520 OPEN "daten.txt"
530 IF @S<>0 THEN PRINT "OPEN failed" : END
540 FOR I=1
550 GET &16, A
560 PRINT "Character ";I;" :",A
570 IF A=-1 THEN BREAK
580 NEXT
590 PRINT I, "characters read"
600 PRINT "Status =", @S
610 CLOSE 0
700 END 
```

## Actual new results

Quite a bit to cover here too.

@ ~AUD$25 the Chinese LILYGO TTGO comes completely constructed, fully
supporting Stefan's BASIC, unbeatable in terms of accessiblity.

### Hardware

#### Complete implementation, including support for Stefan's BASIC

|                                                                               |                                                  |
|-------------------------------------------------------------------------------|--------------------------------------------------|
| **LILYGO® TTGO VGA VGA32**                                                    | https://www.aliexpress.com/item/33041602035.html |
| **BASIC on the Raspberry Pi Pico & Pico 2 with VGA/HDMI and PS2/USB support** | https://geoffg.net/picomitevga.html              |
|                                                                               |                                                  |

#### Serial output only. No Video Display Processor.

|                                                                                                                 |                                                                                                                                        |
|-----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Propeller ANSI / VT-100 Terminal                                                                                | https://github.com/maccasoft/propeller-vt100-terminal                                                                                  |
| VGA Serial Terminal for RC2014 OSH Park                                                                         | https://oshpark.com/shared_projects/Utghpucg                                                                                           |
| Legacy Pixels ASCII VT 100 Compatible Terminal Emulator RS232 Serial                                            | https://www.ebay.com.au/itm/225010233671                                                                                               |
| minimalist only Longan Nano RISC-V GD32VF103CBT6 MCU Development Board LITE 0.96 inch TFT HD IPS display 80*160 | https://www.aliexpress.com/item/4000368549335.html                                                                                     |
| piccoloBASIC                                                                                                    | https://github.com/garyexplains/piccoloBASIC                                                                                           |
|                                                                                                                 | https://www.hackster.io/news/gary-sims-piccolobasic-is-a-minimalist-programming-language-for-the-raspberry-pi-pico-rp2040-3a53ec2fc684 |
|                                                                                                                 | https://www.youtube.com/watch?v=4MiT-29I_jI                                                                                            |

### Software

#### Tiny BASIC

New discoveries about Tiny BASIC.

http://www.ittybittycomputers.com/IttyBitty/TinyBasic/TBEK.txt

https://troypress.com/the-tiny-basic-interpretive-language-il-and-onions/

https://github.com/bgolab/JustPicoBasic

#### MINT

From the author's forum post:

> Minimalist languages have been around since the start of the
> electronic computing era. I was delighted to discover that way back
> around 1969, a lightweight character based interpreter called MUSYS
> was written for the PDP-8, by Peter Grogono, in order to simplify
> the task of electronic music composition. He later evolved this into
> MOUSE - a language for microcomputers around 1980. Having recently
> bought a copy of Grogono’s book to obtain the source code, I can see
> that MINT is very close to MOUSE in functionality, but about 20%
> smaller in terms of source code.
>
> MINT is also quite similar in nature to desk calculator (dc).

https://retrocomputingforum.com/t/mint-a-minimal-interpreter-for-resource-limited-cpus/3037

https://github.com/agsb/6502.MINT

https://github.com/trozodejamon/CMINT/

https://github.com/orgMINT/MINT

#### APRICOT

Another minimalistic language.

https://projects.drogon.net/apricot/

### Of note

https://www.altairmini.com/product/vga-serial-terminal-emulator/
