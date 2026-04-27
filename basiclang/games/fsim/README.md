
# Up, Up and Away

Flight simulators are probably the most entertaining type of
simulation programs. Most of us will never learn to fly, but would
somehow like to enjoy the experience. A flight simulation program
gives you a chance to find out a little of how it feels to fly without
ever leaving the ground.

The main challenge facing a pilot is to keep on top of a number of
different elements that are changing all at once. Ignore any one of
them--like the angle at which the plane is flying, or the amount of
fuel you have left--for too long, and your plane may well drop out of
the sky. Although this program does _not_ occur in real time, so
you'll have a chance to think about the choices facing you before you
act, you'll still find it a fairly challenging and frustrating
simulation to master.

Even getting the plane off the ground is not particularly easy the
first few times you run the program. Get it in the air, and you'll
have to fight every second to keep it there.

And once you try to land...

Crashing during a landing attempt is a trifle inconvenient in a real
plane. The moment you try and land 150 feet above the ground, you'll
give thanks that you are only flying your computer.

## Mastering the Controls

This simulation is the most complex in the book. It will take you a
little longer to learn than the others. This longer learning time
will, however, be amply repaid as you're sure to find this program by
far the most satisfying to run. `FLIGHT SIMULATION` contains another
bonus that makes it very worthwhile to run. Your flight is
automatically recorded, so that at any moment, while you're still in
the air, you can tell the computer you want to see the whole of the
current flight over from the beginning. It is very entertaining to
watch your flight quickly unfolding again. The controls are handed
back to you once you reach the point in the original flight where you
asked the computer for a replay.

Think of the flight as having three parts, each of which requires a
different approach to the controls. Part one is the takeoff, part two
is the actual flight, and part three is the landing. You'll become an
ace pilot fairly quickly if you concentrate on mastering each flight
section in turn.

Whatever you do, don't give up, even after your twentieth attempt at
landing has ended in disaster. The satisfaction you'll feel when you
make your first perfect landing will more than compensate for all the
frustration you've encountered in the learning process.

This is what you'll see when you first run the program:

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:                :  ..@..  :
:                : .. : .. :
: ************** : W--X--E :
:                : .. : .. :
:                :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 0 : TIME .1 : 226
:--------------------------:
:AIRSPEED : 0
:>
:ALTIMETER: 0      0 DEG.
:>
:FUEL     : 750
:------------------->
:--------------------------:
:ELEVATION: 0 : -------
:   > UNDERCARRIAGE DOWN < :
```

The line of asterisks in the top left corner shows the horizon
line. This can tilt rather alarmingly from side to side as you turn
the plane, or go to the bottom of the "windshield" as you climb, or to
the top as you descend. It may take a short while in order for you to
be able to see this line as the horizon, but once you do, you'll find
it conveys a much better impression of being in the air than you might
imagine.

To the right of the horizon is your compass. The "`@`" shows the
direction your plane is heading. You always start a flight facing due
north, and must take off in more or less in this direction. Your exact
heading is shown further down the instrument cluster, on the same line
as `ALTIMETER` where you'll see "`0 DEG.`".

The line of readings underneath the horizon and compass shows the
distance you've covered so far (the "range"), the elapsed time of the
flight, and the direction in which you must be flying in order to
land--assuming that you get this baby up in the air, and keep it there
for more than a few seconds! You need to be within 12 degrees of this
heading for a successful landing. The required heading changes from
run to run, but does not change during a flight.

Shown underneath this is your airspeed, height above the ground
(altimeter), and remaining fuel. The line of dashes ending in a
"greater than" sign (`---->`) indicates the magnitude of each of these
readings. That is, the line gets longer as you go faster or climb
higher.

The elevation is the angle of your plane relative to the ground. When
you enter a command, by touching a single key, a full-word version of
the command appears in the position currently occupied by the series
of dashes you can see after the elevation angle in the sample run
above. Finally, you are told whether or not your undercarriage is
down.

After a few inputs, the screen looks like this:

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:                :  ..@..  :
:                : .. : .. :
: ************** : W--X--E :
:                : .. : .. :
:                :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE .8 : TIME 1.3 : 226
:--------------------------:
:AIRSPEED : 30
:->
:ALTIMETER: 0      0 DEG.
:>
:FUEL     : 692
:------------------->
:--------------------------:
:ELEVATION: 20 : NOSE UP
:   > UNDERCARRIAGE DOWN < :
```

Your fuel has gone down slightly, your airspeed is up to 30, and the
nose of the plane is pointed 20 degrees into the air. You can see,
from the line down near the bottom right-hand corner of the screen,
that `NOSE UP` is the full equivalent of the most recent command you
entered.

A little later, and we are in the air:

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:                :  ..@..  :
:                : .. : .. :
: ************** : W--X--E :
:                : .. : .. :
:                :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 1 : TIME 2 : 226
:--------------------------:
:AIRSPEED : 51
:-->
:ALTIMETER: 66     359 DEG.
:>
:FUEL     : 660
:------------------->
:--------------------------:
:ELEVATION: 19 : THROTTLE ON
:   > UNDERCARRIAGE DOWN < :
```

You need an airspeed of between 45 and 60, and an elevation greater
than 10, in order to get off the ground. Let's try turning:

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:                :  .@:..  :
:                : .. : .. :
: ****           : W--X--E :
:    ******      : .. : .. :
:          ***** :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 1.2 : TIME 2.3 : 226
:--------------------------:
:AIRSPEED : 40
:-->
:ALTIMETER: 143    344 DEG.
:>
:FUEL     : 648
:------------------->
:--------------------------:
:ELEVATION: 15 : BANK LEFT
:    > UNDERCARRIAGE UP <  :
```

Note that the undercarriage is now up (which saves on fuel by
decreasing drag on the plane) and the "horizon" is now sloping down to
the right, as the plane banks left. It is now heading at 344 degrees,
and the `@` symbol on the compass has moved to show the approximate
direction in which the plane is flying.

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:            **  :  ..@..  :
:         ***    : .. : .. :
:      ***       : W--X--E :
:   ***          : .. : .. :
: ***            :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 3.1 : TIME 3.7 : 226
:--------------------------:
:AIRSPEED : 59
:-->
:ALTIMETER: 353    3 DEG.
:----------->
:FUEL     : 590
:------------------->
:--------------------------:
:ELEVATION: 7 : BANK RIGHT
:    > UNDERCARRIAGE UP <  :
```

In this "snapshot", taken a few moments later, we have started to bank
to the right. Our airspeed is up to 59, and we've continued to
climb. However, the elevation has fallen, so the raye of climb will
decrease. As we level off, the horizon gradually tilts back to the
horizontal:

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:                :  ..:@.  :
:                : .. : .. :
:          ***** : W--X--E :
:    ******      : .. : .. :
: ****           :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 3.6 : TIME 5.3 : 226
:--------------------------:
:AIRSPEED : 76
:--->
:ALTIMETER: 475    15 DEG.
:--------------->
:FUEL     : 525
:------------------->
:--------------------------:
:ELEVATION: 12 : THROTTLE ON
:    > UNDERCARRIAGE UP <  :
```

As I said, there are an awful lot of things to keep track of. While
concentrating on the direction in which I am flying, I've been
neglecting the plane's elevation--which has been slowly falling:

```
   HORIZON         HEADING
:----------------:---------:
:                :   .N.   :
:                :  ..:@.  :
:          ***** : .. : .. :
:    ******      : W--X--E :
: ****           : .. : .. :
:                :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 7.4 : TIME 6.9 : 226
:--------------------------:
:AIRSPEED : 152
:------->
:ALTIMETER: 593    31 DEG.
:------------------->
:FUEL     : 457
:-------------------->
:--------------------------:
:ELEVATION: 0 : THROTTLE ON
:    > UNDERCARRIAGE UP <  :
```

Suddenly I notice the nose is pointing downward--note how the horizon
is now right at the top. I frantically try to climb:

```
   HORIZON         HEADING
:----------------:---------:
:    ******      :   .N.   :
: ****           :  ..:..  :
:                : .. : @. :
:                : W--X--E :
:                : .. : .. :
:                :  ..:..  :
:                :   .S.   :
:--------------------------:
:RANGE 11.3 : TIME 8.1 : 226
:--------------------------:
:AIRSPEED : 245
:------------>
:ALTIMETER: 250    47 DEG.
:-------->
:FUEL     : 403
:-------------------->
:--------------------------:
:ELEVATION:-11 : CLIMB
:    > UNDERCARRIAGE UP <  :
```

However, too much is happening at once, with the inevitable result:

```
CRASH!
```

The final picture is pretty bleak:

```
   HORIZON         HEADING
:----------------:---------:
: C R**  A ** S* :   .N.   :
: *  A ** S* H*  :  ..:..  :
: R**  A ** S* H : .. : .. :
: R**  A ** S* H : W--X-@E :
:   A ** S* H* I : .. : .. :
: **  A ** S* H* :  ..:..  :
: * *C R**  A ** :   .S.   :
:--------------------------:
:RANGE 14.1 : TIME 9.2 : 226
:--------------------------:
:AIRSPEED : 273
:------------->
:ALTIMETER: 0      84 DEG.
:>
:FUEL     : 366
:-------------------->
:--------------------------:
:ELEVATION:-16 : THROTTLE ON
:    > UNDERCARRIAGE UP <  :
```

The commands you have at your disposal are:

`R`

This allows you to repeat the current flight from the beginning up to
that point.

`Space bar`

This is used for "throttle on", and increases your speed.

`.`

Use this to throttle back,

`Q`

To increase elevation.

`A`

To decrease elevation.

`Z`

To turn left.

`M`

To turn right.

`1`

Remember, to take off your speed must be between 45 and 60, and your
elevation must be greater than 10. To land, your undercarriage must be
down (!), your heading must be within 12 degrees of the setting shown
beneath the compass, you must be at 15 or below on your altimeter, and
your speed must not be greater than 20. You'll find that, as in real
life, landing is even harder than taking off.

The complete `FLIGHT SIMULATION` listing is given in the next chapter.
