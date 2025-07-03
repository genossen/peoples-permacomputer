
# VIC EDITYPE

## A Text Editing And Storage Program

## Paul Bishop

## Compute! Magazine, April 1983, page 50.

> This mini word processor for the VIC lets you cuter, edit, and save
> text to tape. It works with the VIC 1515 printer and 3K memory
> expansion.

If you are at all like me, the minute you saw the
VIC-20 sitting there on the showroom table flash
ing its upper-lowercase mode, you smiled to your
self and said what a wonderful text storage and
manipulation device it would make. Wonderful in
this context means inexpensive, and Commodore
promised us no less in its literature.

This program is a miniature word processor.
It will allow the user to input text, edit it (with
certain limitations), and save it to tape. The text
may be printed on any line length specified,
though it will not right justify. The program uses
a word wrapping scheme to minimize the VIC's
limited display size and is meant to be used with
the VIC 1515 printer and a 3K memory expansion.

# Entering Text

The program is menu driven, and we will discuss
the options in detail. New mode is used for en
tering text. It is also the mode in which the for
matting features are selected. Centering is done
by pressing the up-arrow (next to the restore key)
at the beginning of the line that is to be centered.
Remember to use the carriage return at the end of
the line, and note that the line may not exceed the
line length you intend to print.

The second function is an inset line length.
This is selected by pressing the first bracket
(shifted colon) at the start of the text to be inset.
All text before the next return character will be
printed on the alternate line length, which will be
specified during printing. Line numbering is
something that I use frequently. It is selected with
the second bracket, and the line will be printed
with a number (numbered sequentially by the
computer) before and after the line. Examples of
all the formatting options are represented in the
demo text.

Backspacing in the New mode may only be
done with the DEL key, and may only continue to
the first character of the line on which the cursor
rests. Any further DELeting will result in an Illegal
Quantity error. If a boo-boo is in an earlier line, it
must be corrected in the edit mode. All keys re
peat, and the pound symbol (next to CLR HOME)
is used to return to the menu. Once the menu is
chosen, no further text mav be entered in the New
mode. (This is something the user could change.)

A final note: text entry becomes progressively
slower as memory fills, and subsequent printing
is also adversely affected by large quantities (rela
tively speaking) of text. So, although the low mem
ory warning should keep you from overtyping
the machine's capacity, it is best to save the text
and then continue when the word-wrap starts to
slow down.

Text entered in the New mode can be reviewed and modified in the Edit mode. The mode
has three options: Forward, Correct, and Return
to Main Menu. The Forward option scrolls through
the text one VIC screen line at a time. To make
changes in entered text, use the Correct option.
You will be given the prompt "error:", at which
point you enter the characters you wish to change
as they appear in the text. End your entry with the
up-arrow (t) key, not the RETURN key. The next
prompt is "correction:". Enter the text as you
wish it to appear in the corrected version. Again
follow your input with the up-arrow key rather
than RETURN. The computer will then search the
text for the "error" and replace it with the
"correction." If the search characters are not found
in the text, the program will provide an error
message.

# Saving And Printing

The save mode is straightforward in operation:
simply press the S key and RETURN and the text
will be stored under the title you entered in the
New mode. Load is just like it. If you include a
file name, the cassette drive will search for that
file; otherwise it will load the first file it comes to.
The Load and Print mode is for files too long to be
contained in memory and is fairly automatic. You simply set the formatting in the print mode, and
let the computer do the rest.

The Print mode is also straightforward. First
it asks for the normal line length. This may be
any value up to 80, but between 40 and 70 are
recommended. Next you are asked for the inset
line length. Again, this should be between 40 and
70. Next you are asked for s for single or d for
double spacing. Finally, the computer asks for
the number at which it will begin the sequential
line numbering. This may be set at any value, but usually will be one.


ables and DIMing the text string array.
Lines 51-67 are the menu.
Lines 100-280 are the text entry and word
wrapping routine, including the delete routine in
line 200.
Lines 3000-3350 are the string search and
replace, the "Edit Mode."
Lines 3800-4710 are the print routine. Lines
4060-4095 are for getting a string of printing
length. Lines 4200-4240 are used in the centering
function. 4300-4710 are for tidying up the print
strings and sending them to the printer.
Lines 5000-5080 are the load routine.
Lines 6000-6080 are for saving text.
Lines 7000-7009 are for the page numbering
function.

Variable List

A$is the actual text string (1 to 200).
C$is the get character string in the new mode.
C4S is the error string in the edit mode.
C5S is the correction string in the edit mode.
C6S

DE$ is the string of the variable SL.
J$ is the get character string for the correction string in
the error in the edit mode.

edit mode.

M$ is the string for the mode selection in the menu.

P$ is the print string.

T1$ is the leftover from P$ after searching for a space at the end of the line.

W$ is the get string in the edit mode.

T2S is the working string of AS in the print mode.

x$is the working character in getting an 80-character line
for PS.

z$ is the get string for the load mode.

LBis the normal line length.
is the inset line length.
LA



Obviously, this program will not meet every
one's writing needs. I am looking forward to
further memory expansion which will allow me
to implement further editing functions, as well as
longer text entry. And you may wish to delete
functions which you will not use and add others.
That is the beauty of a word processor written in BASIC.

Before we consider the program in detail, a
few comments about operation will be in order
here. First, the cursor does not function as well as
it should. I am searching for a cure. In the mean
time, if you find it more distracting than helpful,
you may get rid of it by deleting POKE 204,0 from
line 120. Also, from time to time, errors will hap
pen which will cause the machine to default to
BASIC. This is no cause for alarm. A few moments
studying the program listing and a GOTO in the
immediate mode will get you out of all but the
worst spots. If in doubt, GOTO 51 (the menu).

Program Structure

Since I have included no documentation in the

of it here. You will want to keep this handy for

body of the program, I will list the various parts
is the right remainder of the string being searched for
reference, since every REM you add will cost youLCis the line count.
PCis the page count.
valuable memory space.SLis the line numbering counter.
