things i wanna do:

# permacomputer $0Ci4L M3D14Z

- fully update the @permacomputer@retro.social project social media, which means: 
    - updating the [hackaday profile](https://hackaday.io/project/191174-the-peoples-permacomputer);
    - updating the master [project page](https://sr.ht/~vidak/peoples-permacomputer); 
    - releasing a new statement on the mastodon profile.
    - (i think that covers it)

# the permacomputer hardware itself
 
- build the first MC6847 video display 'warmup' computer. 
    - i have found three projects based on 6502 which make use of the MC6847 and have published their schematics. so far so good. when the parts arrive i have to trust my breadboards and little wires are of a sufficient quality as not to bounce and ring, we're dealing with sub-1 MHz TTL-level digital signals so.... maybe my dodgy tools and components will be good enough.

- build the first permacomputer prototype
    - the next step after i have honed my practicals skills on a simpler task is this: construct a custom video display for the permacomputer, based on the information contained in don lancaster's [cheap video cookbook](https://www.tinaja.com/ebooks/cvcb1.pdf) or [here](https://archive.org/details/donlancaster_cvcb1) if you wanna support the internet archive?
    - the reason for using custom logic for the display is the limited number of columns the MC6847--it is my hope to have 40 columns, not a mere 32. i wish i could say more, but the short story is this: using EEPROMs in place of discrete logic is the ticket to having a simple design.

# the permacomputer software

- it is still my plan to get lisp running on the permacomputer (much thanks @50htz@cathode.church 🙏 🙏)
    - to this end see [this disassembly](https://github.com/stardot/AcornsoftLisp) of [Acornsoft LISP](https://en.wikipedia.org/wiki/Acornsoft_LISP) for the BBC Micro. the beeb is a 6502 machine. it is my hope it can be easily ported to the permacomputer and enable a suitable operating system environment. 
    - the problem is, this will make the permacomputer more like the beeb. it may not be a simple matter of reproducing the memory map of the beeb--it could require reproducing large parts of the beeb data pathways inside the permacomputer. watch this space. 
    - i do not want to get too involved in writing a lisp for the permacomputer, so i am postponing this possibility until the very last moment. if i have to do everything myself, sigh, i will. 

# the overall 'permacomputing' approach

## what is a permacomputer? what does a permacomputer do? 

the ultimate goal of the project is to construct computers which will last a _really_ long time, and still stay operational. 

## are you serious? 

i largely regard this project to be a piece of art. if someone finds some practical use for what i am building, however, that would also make me overjoyed.

## is this a kit project? 

it is my pipe-dream to end up manufacturing permacomputer units at a kind of cottage-industry level, perhaps something for my worker's co-operative to do--friendly computers. i want to make these babies really, really cheap--if it's not cheap, it's not accessible to the poor.

## why 80s TTL micro-electronics?

it should be taken as given that 80s micros are one of the last generations of computers that people could have a hope of comprehending and mastering every element of its specification, from hardware to the top of the software stack.
