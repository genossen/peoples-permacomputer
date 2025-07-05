REM Simulate LINE INPUT into variable A$
A$ = ""
DO
  K$ = INKEY$
  IF K$ <> "" THEN
    IF K$ = CHR$(13) THEN EXIT DO   ' Enter key (carriage return)
    A$ = A$ + K$
    PRINT K$;                       ' Echo character
  END IF
LOOP
PRINT

REM RESPONSE FROM slvijero:

Ok, understood.

In my BASIC, INPUT is LINEINPUT if used with a string.
Concretely:

INPUT A$

will always collect all text elements until the next ASCII 10 = LF is found. Default behaviour is
to use LF as an end character.

The difference of LINEINPUT and INPUT in the old times was that

INPUT A$, A, B$

could be used to do

hello 4 world

and you would have A$=“hello”, A=4 and B$=“world” afterwards.

INPUT A$

with

hello 4 world

would only give you “hello” in A$ but not the entire line.

I implemented this differently and therefore there is no LINEINPUT.

This has one side effect:

INPUT A$, A

in my BASIC always reads the entire string into A$ and then prompts for A on a separate line
while

INPUT B, A

can and will accept

2, 3

or even

2 3

as an input and correctly set the variables.

Another thing, if you use old ALTAIR Basic or other legacy MS code, look in the manual
for the compatibility and language personality settings.

So,

SET 22, “Microsoft"

would be a good idea as first line of the program. Individual settings can be changed like this:

SET number, value

Best look in the manual for the settings 12-24.
