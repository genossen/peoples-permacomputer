# Project phase one results

Our research was long and laborious. When the results of our
information gathering started to become clearer, we discovered that it
was not appropriate to offer up any one particular token computer
hardware platform.

## A ** Mike Bauer's [DREAM 6800](http://www.mjbauer.biz/DREAM6800.htm).

Please see the [README of this project's previous phase](https://git.sr.ht/~vidak/peoples-permacomputer/tree/master/item/README.old.1.md).

## B ** Permacomputers derived from popular microcontroller kits. See [ulisp](http://ulisp.com).

This particular course of action would require:

- a text editor
- a telnet client
- a gopher browser

All this software will be run over serial at first, and then the
perpetually thorny topic of video out can be tackled later.

(Will video displays of the solarpunk post-apocalypse future even
mostly support composite out?)

See [this fedi
discussion](https://mastodon.sdf.org/@vidak/112547427824046030).

And this [earlier one too](https://mastodon.sdf.org/@vidak/112523739708726479).

## C ** The [EDUC-8 PDP-8 clone](https://en.wikipedia.org/wiki/EDUC-8).

See [here](https://github.com/ibm2030/EDUC8).

Also this [fediverse post](https://mastodon.sdf.org/@vidak/112579608839260322).

## D ** A minimalistic serial-only [6502 homebrew platform](https://github.com/adumont/hb6502)

This proof-of-concept design is perfect for an ultra-simple and
easily-constructed computer.

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

However the following things are removed from the DREAM6800 design:

- Before was planned a simple hex keyboard. this new design must
  communicate through serial only.
- No composite video out. One of the great benefits of the DREAM6800
  design was its relatively simple DMA video out circuitry. A lot of
  extra work is going to have to be done in order to give this design
  composite video out. This _also_ means a serial terminal will be
  needed at all times in order to run this new 6502 design.
- The virtual machine that ran on the DREAM6800, the CHIP-8 will not
  be included in this design.

The new even simpler design is a clear victor in the comparison
between the old and the new.

- People are unlikely to be able to quickly understand the DREAM6800
  design software-wise, due to the 6800 ISA being far less well
  understood in the community. the 6502 guarantees a well understood
  and loved ISA. It makes the design more attractive to others.
- Composite out may not necessarily be the best option for video for a
  permacomputer. The project will actually need to do research in
  order to find out what will work best long-term.
- Although the CHIP-8 virtual machine instruction set is simpler to
  write on paper, higher level languages like FORTH and BASIC are more
  likely to be better preserved in the far future.
  
  See [this fedi reference](https://retro.social/@permacomputer/112469206126820567).
