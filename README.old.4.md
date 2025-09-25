
<img src="https://git.sr.ht/~vidak/peoples-permacomputer/blob/master/static/logo2-small.jpg">

# The People's Permacomputer Project

The People's Permacomputer (henceforth known as "the people's
computer", or "the permacomputer") is a project dedicated to
resourcing the specification, and then construction of a
'permacomputer'.

1. [Who are the people running this project?](https://sr.ht/~vidak/peoples-permacomputer/#who)
2. [What is a permacomputer?](https://sr.ht/~vidak/peoples-permacomputer/#what-is-a-permacomputer)
3. [What is the point of this project?](https://sr.ht/~vidak/peoples-permacomputer/#what-is-the-point-of-this-project)
4. [What distinguishes this project from the others?](https://sr.ht/~vidak/peoples-permacomputer/#mutual-exclusion)
5. [What previous historical traditions inspire this project?](https://sr.ht/~vidak/peoples-permacomputer/#adventures-in-the-traditions-of-computation)

## Who?

*"The Committee"*

- [50hz](https://cathode.church/@50htz)

- [vidak](https://social.solarpunk.au/users/vidak)
 
- [project social media profile](https://retro.social/@permacomputer) 
 
 Yes you can join the committee.

## What is a permacomputer?

A permacomputer is a computer which attempts to embody the virtues of
permacomputing.

Foundationally, permacomputing _itself_ is set of community practices
and traditions which shares a set of social and ecological values
inspired by the land management and settlement design of
_permaculture_.

## Project results

- [First](results/phase-1.md) phase. `COMPLETE`
    - **Hardware exploration**.
    - CHIP-8 virtual machine.
	- MC6809 CPU platform.
	- [DREAM6800](http://www.mjbauer.biz/DREAM6800.htm) SBC.

- [Second](results/phase-2.md) phase. `COMPLETE`
    - **Settled on hardware**.
	- Basic 6502 setup.
	- Microcontroller-based video.

- [Third](results/phase-3.md) phase. `ACTIVE`
    - **Paradigmatic microcomputer BASIC operating environment**.
	- Distribute operating system as printed code listings.
		- Text editors sourced.
			- [`LED.BAS`](basiclang/text-editors/transcribed/led/) transcribed.
			- [`WRDPRO.BAS`](basiclang/text-editors/transcribed/wrdpro/) transcribed.
			- [`EDIT.BAS`](basiclang/text-editors/transcribed/edit/) transcribed.
			- [`EDITYPE.BAS`](basiclang/text-editors/transcribed/editype/) transcribed.
		- Terminal clients sourced.
		- Gopher client not yet sourced.
	- Begin conversion of software into Stefan's BASIC dialect.
		- `EDIT.BAS` conversion [in progress](basiclang/text-editors/transcribed/edit/edit-conversion-draft-2.bas).
		- [See MORE](basiclang/stefans-basic/conversions.md).

## Project logs

- [2025-06-22](https://git.sr.ht/~vidak/peoples-permacomputer/tree/master/item/log/2025-06-22-project-refresh.md) - Project Refresh.

- [2024-12-04](https://git.sr.ht/~vidak/peoples-permacomputer/tree/master/item/log/2024-12-04-mcu-analysis.md) - Microcontroller Video Out.

- [2024-11-28](https://git.sr.ht/~vidak/peoples-permacomputer/tree/master/item/log/2024-11-28-start-phase-2.md) - Project Start Phase 2.

## What is the point of this project?

The original purpose of this project was to design and then construct
computers that would be able to survive a societal collapse.

After working on the project, it became apparent that the point of the
project should not be to imagine a hypothetical future, but to engage
practically with the problems of the present.

The entire computing stack of the modern era is large, confusing, and
unsafe. People would rather excuse themselves from having to learn
about it. Who can blame them?

The first aim of the project is to be exceedingly cost effective: "if
the oppressed cannot access some technology, then it is not
revolutionary".

The second aim of the project is the promotion of digital
literacy. Digital literacy should promote a joyful user experience
that is non-exploitative. It should also foster a sense of
community--"no-one is an island".

To this end, the scope of the people's permacomputer project was
deliberately limited to programs around or just over 100
lines. Definitely not more than 200.

The project therefore decided to investigate BASIC as the paradigmatic
human-computer interface for the permacomputer.

For the application towards which it was targeted, the investigation
the project has done so far into BASIC has been fruitful, and even
quite surprising--the 70s/80s hobby computing scene was far richer and
more creative than the project previously assumed: not less than five
(5) different text editors in BASIC were unearthed!

[OLD](about/project-purpose.md).

## Mutual exclusion

There are many influential projects which attempt to address the same
set of values driving the people's permacomputer project. Some worthy
of note can be listed in no particular order:

- [Collapse OS](http://collapseos.org/).
- [uxn](https://100r.co/site/uxn.html).
- The [RC2014](https://rc2014.co.uk/) computer kit.
- Ben Eater's [6502 project](https://eater.net/6502) video series.

All of these projects are concerned with some subset of the principles
the permacomputer project holds dear. Collapse OS is software that
aims to be system agnostic, and assumes the previous acquisition of
some supported hardware.

[READ MORE](about/mutual-exclusion.md)

## Adventures in the traditions of computation

We seem to take it for granted that a computer in everyone's hand just
is democratic computing. Indeed, the ubiquity of contemporary
computation has been confused for 'democracy'.

As quickly as we marched towards computing for the masses, we marched
just as swiftly away.

[OUR INSPIRATION](about/inspiration.md)
