# BASIC DIALECT CONVERSIONS

|       | Dartmouth                  | APPLESOFT                     | ATARI 8-BIT                                   | BBC BASIC                               | COMMODORE BASIC V2                  |
|-------|----------------------------|-------------------------------|-----------------------------------------------|-----------------------------------------|-------------------------------------|
| OPEN  | FILE #_file_, "_filename_" | OPEN _filename_               | OPEN #_fileno_,_mode control code_,_filename_ | _var_ = OPENIN, _var_ = OPENOUT         | OPEN #exp, fileno, mode, "filename" |
| CLOSE |                            | CLOSE "_filename_"            | CLOSE #_fileno_, #_fileno_                    | CLOSE #_fileno_; CLOSE #0 _(all files)_ | CLOSE #_fileno_                     |
| LOAD  |                            | LOAD _filename_               | LOAD "_disk:filename_"                        | LOAD "_filename_"                       | LOAD "_filename_",8,[disk]          |
| PRINT | PRINT #_file_, record, ... | PRINT exp, exp, ...           | PRINT #fileno, record, record, ...            | PRINT #filename, record, record, ...    | PRINT #fileno, record, record, ...  |
| INPUT | INPUT #_file_, record, ... | INPUT [string,] var, var, ... | INPUT #[file,disk] var                        | INPUT #filename, record, record, ...    | INPUT _"string"_ var, var, ...      |

# STEFAN'S BASIC DIALECT KEY STATEMENTS

## OPEN

OPEN "data.txt"

OPEN "data.txt", 0

OPEN "temp.txt", 1

OPEN "append.txt", 2

The first two commands are equivalent, the file "data.txt" is opened
for read. The second line opens "temp.txt" for write. A new file is
created if it doesn't exist. If the file exists writing starts at the
beginning and existing data is overwritten. The third commands opens
the file for append.

## CLOSE

Files that have been written need to be closed not to lose the
data. CLOSE without an argument closes the read file. This is not
really necessary. CLOSE 1 or CLOSE 2 close the write file. Opening a
new file automatically closes an open file.

## LOAD

LOAD "myprog.bas"

## PRINT

Paradigmatic.

## INPUT

INPUT "Input a number", A

INPUT "First number: ", A, "Second number: ", B

Until version 1.4, INPUT cannot read elements of string arrays. Only
not indexed string variables are implemented. This is possible in 2.0
now.

Like PRINT, the & modifier can be used to specify an input stream.

INPUT &2, A

would read data from the keyboard of a Arduino standalone system.

In version 2.0 INPUT can do most of the things MS BASIC INPUT
does. Arrays and string arrays are fully supported. The string
substring notation can also be used in INPUT.

For INPUT the # modifier limits the number of bytes in string
input. This can be used to control I2C code and other low level
functions.

## FILE I/O

Files can be written and read with PRINT and INPUT adding the file
stream modifier. The I/O stream number for files is 16. Example:

PRINT &16, "Hello World"

writes "Hello World" to the open write file.

INPUT &16, A$

reads the string A$ from the file. INPUT can have comma separated
arguments and reads comma separated data from BASIC 2.0 on.

I/O operations usually report no errors on the console and keep the
the program running if an error occurs. The variable @S contains the
error status of the operation. @S has to be reset explicitly before
using it because it remembers and error status of previous operations
and is never reset by the interpreter. Example:

@S=0

INPUT &16, A$

IF @S=-1 THEN PRINT "End of file reached"

@S takes the value -1 for the end of file condition. For general error
it takes the value 1.

Tutorial: fileio.bas

