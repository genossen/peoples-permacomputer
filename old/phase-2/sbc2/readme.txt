Hi!

Here are my "docs" for this board.  

*****
First and foremost, I offer this board "AS-IS", with no
guarantee that it is without defects or flaws.  So, use it at your own risk!

Having said that, I plan to buy at least two myself, and have worked very hard to ensure
everything is covered.  I will help with whatever "problems" arise, but do not promise
anything!
*****

*****
See the layout.gif file for parts placement and component values.
*****

I am enclosing the schematics and the data file created from ExpressPCB.com's software.
I've also added notes, and board layouts, and board trace images as "GIF" files so all 
you'll need is "GIF" viewing software.  Most web browsers can be used or try IrfanView, it free!

The power busses are at least .030 wide and are rated for 1 amp (according to ExpressPCB), be 
careful not to overload them or you may melt traces.  Be especially careful to avoid 
shorts or excessive loads from your devices plugged into the IO ports.  

If you look closely at the board layout, you'll see several extra pads, especially around
the 65C02.  I have tried to make the board as versatile as possible.  Note especially that
if the 65C02 Pin 1 is to be grounded, you'll need to install the strap to the left of the 
TTL Osc. This allows for use of the W65SC02S, which has a VPB output on pin 1. Also, there
are pads for MLB, RDY, SYNC, BE, & SOB.  Hopefully these will allow for special uses.  You may wish
to connect these to the expansion bus via wire jumpers using the pads provided.

I have made the IO completely strap-selective.  You can select/deselect both 6522s and the 6551.

You can connect their IRQ outputs to NMI, IRQ, or leave them open.  As Garth Wilson requested, I've 
added pads for diodes in the IRQ's of all three IO chips. If you don't need to use a diode, you can 
simply solder a strap across the pads.  The diodes would be needed for totem-pole IRQ's, which 
cannot be wire-OR'ed together (WDC 65C22's are totem pole devices).

For the 6551, you can choose between the DTR/DSR, RTS/CTS, & DCD handshake connections to the 
MAX-232.  You also can select the appropriate pins from the MAX232 to the 10 pin RS-232 connector.
See the "options.gif" file for stapping examples.  Also, Use a 30pF capacitor next to the crystal.

The 4 6522 Ports are wired for power, gnd, 8 bits + 2 handshake.  I was unable to re-wire the
power as to prevent damage by reverse connection, but I did add one pad to the right of the +5
pins, so if you have room, you can use a 16 pin socket and key the hole to prevent reversals.

RP-2 is optional and is only needed if you want to be able to leave a 6522 plugged in but want
to disable it by removing the CS strap.  RP-2 would provide the necessary pull-up for the CS pins.

I've also added straps to support both 28256 EEPROM and 27256 EPROM.  See "options.gif" for 
stapping examples.

I know these instructions a pretty rough, but since this is NON-PROFIT endeavor, they will
have to do.  Please feel free to write me with any problems or questions.  I'll try to help!


Daryl
65c02@softcom.net
http://65c02.tripod.com/

SBC2  V2.5  (C)2003  Daryl Rictor