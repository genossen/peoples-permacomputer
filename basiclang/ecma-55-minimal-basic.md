---
title: Standard ECMA-55
subtitle: Minimal BASIC
date: January 1978
...

\newpage

# Brief History

The first version of the language BASIC, acronym for Beginner's
All-purpose Symbolic Instruction Code, was produced in 1964 at the
Dartmouth College in the USA. This version of the language was
oriented towards interactive use. Subsequently, a number of
implementations of the language were prepared, that differed in part
from the original one.

In 1974, the ECMA General assembly recognised the need for a
standardised version of the language, and in September 1974 the first
meeting of the ECMA Committee TC 21, BASIC, took place. In January
1974, a corresponding committee, X3J2, had been founded in the USA.

Through a strict co-operation it was possible to maintain full
compatibility between the ANSI and the ECMA draft standards. The ANSI
one was distributed for public comments in January 1976, and a number
of comments were presented by ECMA.

A final version of the ECMA Standard was prepared at the meeting of
June 1977 and adopted by the General Assembly of ECMA on Dec. 14, 1977
as Standrd ECMA-55.

\newpage

# Scope

This Standard ECMA-55 is designed to promote the interchangeability of
BASIC programs among a variety of automatic data processing
systems. Subsequent Standrds for the same prpose will describe
extensions and enhancements to this Standard. Programs conforming to
this Standard, as opposed to extensions or enhancements of this
Standard, will be said to be written in "Minimal BASIC".

This standard establishes:

- the syntax of a program written in Minimal BASIC.
- The formats of data and the precision and range of numeric
  representations which are acceptable as input to a automatic data
  processing system being controlled by a program written in Minimal
  BASIC.
- The formats of data and the precision and range of numeric
  representations which are acceptable as output to a automatic data
  processing system being controlled by a program written in Minimal
  BASIC.
- The semantic rules for interpreting the meaning of a program written
  in Minimal BASIC.
- The errors and exceptional circumstances which shall be detected and
  also the manner in which such errors and exceptional circumstances
  shall be handled.
  
Although the BASIC language was originally designed primarily for
interactive use, the Standard describes a language that is not so
restricted.

The organisation of the Standard is outlines in Appendix 1. Thet
method of syntax specification is explained in Appendix 2.

\newpage

# References

ECMA-6 : 7-Bit Input/Output Coded Character Set, 4th Edition

ECMA-53 : Representation of Source Programs

\newpage

# Definitions

For the purposes of this Standard, the following terms have the
meanings indicated.

## BASIC

A term applied as a name to members of a special class of languages
which possess similar syntaxes and semantic meanings; acronym for
Beginner's All-purpose Symbolic Instruction Code.

## Batch-mode

The processing of programs in an environment where no provision is
made for user interaction.

## End-of-line

The characters or indicator which identifies the termination of a
line. Lines of three kinds may be identified in Minimal BASIC: program
lines, print lines and input reply lines. End-of-line may vary between
the three cases and may also vary depending upon context. Thus, for
example, an end of input line may vary on a given system depending on
the terminal being used in interactive or batch mode.

Typical examples of end-of-line are carriage-return, carriage-return
line-feed, and end of record (such as end of card).

## Error

A flaw in the syntax of a program which causes the program to be
incorrect.

## Exception

A circumstance arising in the course of executing a program which
results from faulty data or computations or from exceeding some
resource constraint. Where indicated certain exceptions (non-fatal
exceptions) may be handled by the specified procedures; if no
procedure is given (fatal exceptions) or if restrictions imposed by
the hardware or operating environment make it impossible to follow the
given procedure, then the exception shall be handled by terminating
the program.

## Identifier

A character string used to name a variable or a function.

## Interactive mode

The processing of programs in an environment which permits the user to
respond directly to the actions of individual programs and to control
the commencement and termination of these programs.

## Keyword

A character string, usually with the spelling of a commonly used or
mnemonic word, which provides a distinctive identification of a
statement or a component of a statement of a programming language.

The keywords in Minimal BASIC are: BASE, DATA, DEF, DIM, END, FOR, GO,
GOSUB, GOTO, IF, INPUT, LET, NEXT, ON, OPTION, PRINT, RANDOMIZE, READ,
REM, RESTORE, RETURN, STEP, STOP, SUB, THEN, and TO.

## Line

A single transmission of characters which terminates with an
end-of-line.

## Nesting

A set of statements is nested within another set of statements when:

- the nested set is physically contiguous, and
- the nesting set (divided by the nested set) is non-null.

## Print zone

A contiguous set of character positions in a printed output line which
may contain an evaluated print statement element.

## Rounding

The process by which the presentations of a value with lower precision
is generated froma  representation of higher precision taking into
account the value of that portion of the original number which is to
be omitted.

## Significant digits

The contiguous sequence of digits ...

> NOTE: The Standard requires that the ability of a conforming
> implementation to accept numeric representations be measured in
> terms of significant digits rather than the actual number of digits
> (that is including leading or trailing zeroes) in the
> representation.

## Truncation 

The process by which the representation of a value with lower
precision is generated from a representation of higher precision by
merely deleting the unwanted low order digits of the original
representation.

\newpage

# Characters and Strings

## General Description

The character set for BASIC is contained in the ECMA 7-bit coded
character set. Strings are sequences of characters and are used in
BASIC programs as comments (see 19), as string constants (see 6), or
as data (see 15).

## Syntax

### letter

A/B/C/D/E/F/G/H/J/K/L/M/N/O/P/Q/R/S/T/U/V/W/X/Y/Z 

### digit

0/1/2/3/4/5/6/7/8/9 

### string-character

quotation-mark / quoted-string-character                                                                                                                            

### quoted-string-character 

exclamation-mark / number-sign / dollar-sign / percent-sign /
ampersand / apostrophe / left-parenthesis / right-parenthesis /
asterisk / comma / solidus / colon / semi-colon / less-than-sign /
equals-sign / greater-than-sgn / question-mark / circumflex-accent /
underline / unquoted-string-character

### unquoted-string-character

space / plain-string-character

### plain-string-character

plus-sign / minus-sign / full-stop / digit / letter

### remark-string

string-character*

### quoted-string

quotation-mark quoted-string-character* quotation-mark

### unquoted-string

plain-string character / plain-string-character
unquoted-string-character* plain-string-character

## Examples

```
ANY CHARACTERS AT ALL (?!*!!) CAN BE USED IN A "REMARK".

"SPACES AND COMMAS CAN OCCUR IN QUOTED STRINGS."

COMMAS CANNOT OCCUR IN UNQUOTED STRINGS.

## Semantics

The letters shall be the set of upper-case Roman letters contained in
the ECMA 7-bit coded character set in positions 4/1 to 5/10.

The digits shall be the set of arabic digits contained in the ECMA
7-bit code...

...

THe names of characters are specified in Table 1.

The coding of characters is specified in Table 2; however this coding
applies only when programs and/or input/output data are exchanged by
means of coded media.

## Exceptions

None.

## Remarks

...

\newpage

# Programs

## General Description

