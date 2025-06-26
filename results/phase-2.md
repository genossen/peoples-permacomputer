# Project phase two results

## A ** Computer module. [GITHUB REPO: USER AUDMONT](https://github.com/adumont/hb6502)

This proof-of-concept design is perfect for an ultra-simple and
easily-constructed computer.

![](https://github.com/adumont/hb6502/blob/main/sbc/imgs/IMG_20210507_202922_616.jpg?raw=true)

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



## B ** asdf

asdf.

## C ** asdf

