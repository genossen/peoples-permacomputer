10 REM                 == WRITTEN BY D. L. FITCHHORN ==
15 REM                =   *****  ****   *****  *****   =
20 REM               =    *      *   *    *      *      =
25 REM              =     ***    *   *    *      *       =
30 REM               =    *      *   *    *      *      =
35 REM                =   *****  ****     *      *     =
40 REM                 ==   PROGRAMMER - MITS, INC   ==
45 REM
50 REM DEFINT A-Z
55 REM CLEAR 15000
60 DIM L1$(101):DIM L2(14):DIM M1(100,2):FOR I=1 TO 14:READ L2(I):NEXT I
65 DATA "ADVANCE","BEGINNING","CHANGE","DELETE","END","GET","INSERT","JUMP","KILL","LIST","NEXT","READ","VERIFY","EXIT"
70 PRINT "EDIT -- VERSION 1.0":PRINT
75 INPUT "INPUT FILE NAME?"; N1$
80 OPEN N1$,0
85 N2$="EDIT.TMP"
90 OPEN N2$,1:PRINT &16,""
95 I=1:J=1:H=1
100 REM---------------------------------------------------------INPUT COMMAND
105 K=0
110 IF A$="" THEN FOR Q9=1 TO 5:PRINT "BELL!";:NEXT:INPUT ">"; A$
115 A=0:J1=1:U=0:T=1
120 IF A$="" THEN 105 ELSE I9=INSTR(A$,"*"):IF I9<>0 THEN S$=LEFT$(A$,I9-1):A$=MID$(A$,I9+1) ELSE S$=A$:A$=""
125 SS=ASC(S$)
130 IF 64<SS THEN IF 96<SS THEN SS=SS-32:GOTO 170 ELSE GOTO 170
135 T=VAL(S$)
140 S=LEN(STR$(T))
145 IF T=0 THEN IF LEFT$(S$,1)="/" THEN T=400
150 S$=MID$(S$,S)
155 IF T<0 THEN S$=MID$(S$,2)
160 GOTO 125
165 REM             .A  .B  .C  .D  .E  <F> .G  <H> .I  .J  .K  .L  <M>
170 ON SS-64 GOTO 195,235,245,265,280,180,290,180,320,360,385,425,180,445,180,180,180,465,180,180,180,515,180,525,180,180
175 REM             .N  <O> <P> <Q> .R  <S> <T> <U> .V  <W> .X  <Y> <Z>
180 FOR N=1 TO 13:PRINT L2$(N):NEXT:GOTO 105
185 REM
190 REM-----------------------------------------------------------A COMMAND
195 H=1:IF T=0 THEN GOTO 105 ELSE IF T<0 THEN J1=-1
200 FOR I3=0 TO T-J1 STEP J1
205     IF M1(J,1)=0 AND J1=-1 THEN GOTO 105
210     IF M1(J,2)=-1 AND J1=1 THEN J=M1(J,1):GOTO 105
215     IF J1=1 THEN J=M1(J,2) ELSE J=M1(J,1)
220 NEXT
225 GOTO 105
230 REM-----------------------------------------------------------B COMMAND
235 J=LN:H=1:GOTO 105
240 REM-----------------------------------------------------------C COMMAND
245 S$=MID$(S$,2):IF K=0 THEN S=LEN(S$):K=H
250 IF K=1 THEN L1$(J)=S$+MID$(L1$(J),K+S) ELSE L1$(J)=LEFT$(L1$(J),K-1)+S$+MID$(L1$(J),K+S)
255 PRINT L1$(J):H=K+LEN(S$):GOTO 105
260 REM-----------------------------------------------------------D COMMAND
265 IF H=1 THEN L1$(J)=MID$(L1$(J),H+T):ELSE L1$(J)=LEFT$(L1$(J),H-1)+MID$(L1$(J),H+T)
270 GOTO 105
275 REM-----------------------------------------------------------E COMMAND
280 IF M1(J,2)=-1 THEN H=1:GOTO 105 ELSE J=M1(J,2):GOTO 280
285 REM-----------------------------------------------------------G COMMAND
290 S$=MID$(S$,2):S=LEN(S$):IF S=0 THEN GOTO 105
295 K=INSTR(H,L1$(J),S$):IF K=0 THEN IF M1(J,2)=-1 THEN PRINT "EOB":A$="":GOTO 105 ELSE J=M1(J,2):H=1:GOTO 295
300 U=U+1:IF U<T THEN H=K+S:GOTO 295
305 PRINT LEFT$(L1$(J),K+S-1):H=K
310 GOTO 110
315 REM-----------------------------------------------------------I COMMAND
320 IF MID$(S$,2)<>"" THEN 345 ELSE I2=J:IF J=LN THEN LN=IN
325 INPUT L1$(IN):IF L1$(IN)"\\" THEN 105
330 I3=M1(IN,2):M1(IN,2)=I2
335 M1(IN,1)=M1(I2,1):M1(I2,1)=IN:I4=M1(IN,1)
340 M1(I4,2)=IN:IN=I3:M1(I3,2)=0:GOTO 325
345 IF H1=1 THEN L1$(J)=MID$(S$,2)+L1$(J) ELSE L1$(J)=LEFT$(L1$(J),H-1)+MID$(S$,2)+MID$(L1$(J),H)
350 H=H+LEN(S$):GOTO 105
355 REM-----------------------------------------------------------J COMMAND
360 IF T=0 THEN H=1:GOTO 105
365 H=H+T:IF H<1 THEN H=1
370 IF H>LEN(L1$(J)) THEN H=LEN(L1$(J))
375 GOTO 105
380 REM-----------------------------------------------------------K COMMAND
385 H=1:I2=J:I3=M1(J,1):FOR J1=1 TO T
390 IF M1(J,2)=-1 THEN GOTO 410
395 I4=M1(J,2):L1$(J)="":M1(I4,1)=I3
400 M1(IN,1)=J:M1(J,1)=0:M1(J,2)=IN:IN=J
405 J=I4:NEXT
410 IF I2=LN THEN LN=J ELSE M1(I3,2)=J
415 GOTO 105
420 REM-----------------------------------------------------------L COMMAND
425 I2=J:FOR J=1 TO T
430 PRINT L1$(I2):IF M1(I2,2)=-1 THEN GOTO 105 ELSE I2=M1(I2,2):NEXT
435 GOTO 105
440 REM-----------------------------------------------------------N COMMAND
445 I2=LN
450 IF M1(I2,2)=-1 THEN GOTO 465 ELSE PRINT &16,L1$(I2):I2=M1(I2,2)
455 GOTO 450
460 REM-----------------------------------------------------------R COMMAND
465 J=1:A=0:LN=1:I=1:FE=0:GOSUB 470:GOTO 105
470 IF @S=-1 THEN PRINT "EOF1":I=I-1:FE=1:GOTO 495
475 INPUT &16,L$:IF L$="" THEN GOTO 470
480 A=A+LEN(L$)
485 L1$(I)=L$:M1(I,1)=I-1:IF I=1 THEN 490 ELSE M1(I-1,2)=I
490 IF I=50 OR A>2000 THEN GOTO 495 ELSE I=I+1:GOTO 470
495 M1(I,2)=I+1:I=I+1:L1$(I)="END OF BUFFER":M1(I,1)=I-1:M1(I,2)=-1:H=1:IN=I+1
500 FOR I2=IN TO 100:M1(I2,2)=I2+1:M1(I2,1)=I2-1:NEXT
505 M1(IN,1)=0:M1(I2-1,2)=-1:RETURN
510 REM-----------------------------------------------------------V COMMAND
515 PRINT LEFT$(L1$(J),H):GOTO 105
520 REM-----------------------------------------------------------X COMMAND
525 I2=LN
530 IF M1(I2,2)=-1 THEN GOTO 535 ELSE PRINT &16,L1$(I2):I2=M1(I2,2):GOTO 530
535 IF FE=0 THEN I=1:A=0:GOSUB 470 GOTO 525
540 CLOSE:ON ERROR GOTO 555:INPUT "BACKUP FILE NAME?";N3$:KILL N3$
545 NAME N1$ AS N3$
550 NAME N2$ AS N1$: CLEAR 200:END
555 IF ERR = 53 THEN GOTO 545: ELSE:ON ERROR GOTO 0

REM DEBUGGING

REM 2025-07-20

GOTO
* LINE 105 
* VARIABLE K
* LINE 110 
*  IF
* VARIABLE  A
*  : 
* VARIABLE J1
*  : 
* VARIABLE U
*  : 
* VARIABLE T
* LINE 120 
*  IF
* VARIABLE  I9
*  : 
*  IF
* VARIABLE  SS
* LINE 130 
*  IF
*    GOTO
* LINE 170 
*  ON
*   REM
* LINE 180
     
     
REM solved by using * instead of \\


>N
N
450: Range Error
   
   
>x
x
530: Range Error
   
REM possibly solved because Stefan's BASIC does not index arrays from
   REM 0, only 1 - eg M1(0) is illegal.
   
GOTO
* NUMBER  495
* LINE 475 
*  INPUT
*   #
* NUMBER 1
*  ,
* STRINGVAR L$
*  : 
*  : 
? *  IF
* STRINGVAR  L$
*  =
*  =
* STRING ""
*   THEN
*    GOTO
* NUMBER  470
* LINE 480 
*  IF
* ARRAY  EOF
*  (
* NUMBER 1
*  )
*   THEN
*   PRINT
* STRING  "EOF1"
*  : 
* VARIABLE I
*  =
* VARIABLE I
*  -
* NUMBER 1
*  : 
* VARIABLE FE
*  =
* NUMBER 1
*  : 

REM solved by substituting proper stream identifier -- PRINT #1 -> PRINT &16


