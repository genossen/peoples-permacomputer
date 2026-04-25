10 REM ***********
20 REM *         *
30 REM * Sketch  *
40 REM *         *
50 REM ***********
   
55 REM *** Instructions ***
   
60 CLS:PRINT:PRINT
70 PRINT TAB(12)"Instructions?"
80 PRINT:PRINT TAB(16)"(Y/N)"
90 A$=INKEY$:IF A$="" GOTO 90
100 IF A$="Y" OR A$="y" GOTO 110 ELSE GOTO 270
110 CLS:PRINT:PRINT
120 PRINT TAB(2)"You may use either Sketch or Draft"
130 PRINT TAB(2)"modes. Sketch uses a moving line to"
140 PRINT TAB(2)"draw, while Draft draws lines between"
150 PRINT TAB(2)"two points you specify by hitting";CHR$(34);"S";CHR(34);"."
160 PRINT:PRINT TAB(1)"= Hit any key for Sketch instructions =";
170 A$=INKEY$:IF A$="" GOTO 170
180 CLS:PRINT
190 PRINT TAB(12)"==  Sketch =="
200 PRINT TAB(13)"[Controls:]"
210 PRINT TAB(2)"Arrow Keys -- Change direction"
220 PRINT TAB(2)"Number keys -- Slow down cursor"
230 PRINT TAB(2)CHR$(34);"F";CHR$(34);" -- Return to top speed"
240 PRINT TAB(2)"Space Bar -- Toggle cursor (ON)-(OFF)"
250 PRINT:PRINT TAB(11)"== Hit any key =="
260 A$=INKEY$:IF A$="" GOTO 260
    
265 REM *** Set Delay ***
    
270 CLS:PRINT:PRINT
    
