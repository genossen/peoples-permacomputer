REM - L1$(X), each line.
REM - M1$(X,0), previous line.
REM - M1$(X,1), next line.

REM - LN, first active cell in L1$.
REM - IN, first inactive cell in L1$.
REM - H, DOT, for position within cell.
REM - J, cell that DOT is in.

55 SET 22, "Microsoft"
60 DIM L1$(50,100):DIM L2$(13): DIM M1(100,1):FOR I=0 TO 13:READ L2$(I):NEXT
65 DATA "ADVANCE","BEGINNING","CHANGE","DELETE","END","GET","INSERT","JUMP","KILL","LIST","NEXT","READ","VERIFY","EXIT"
70 PRINT "EDIT -- VERSION 1.0":PRINT
75 INPUT "INPUT FILE NAME?"; N1$
77 @S=0
80 OPEN N1$,0
82 IF @S<>0 THEN PRINT "OPEN failed":END
85 REM N2$="EDIT.TMP"
87 REM @S=0
90 REM OPEN N2$,1:PRINT &16,""
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
180 FOR N=0 TO 12:PRINT L2$(N):NEXT:GOTO 105
185 REM
190 REM-----------------------------------------------------------A COMMAND
195 H=1:IF T=0 THEN GOTO 105 ELSE IF T<0 THEN J1=-1
200 FOR I3=0 TO T-J1 STEP J1
205     IF M1(J,0)=0 AND J1=-1 THEN GOTO 105
210     IF M1(J,1)=-1 AND J1=1 THEN J=M1(J,0):GOTO 105
215     IF J1=1 THEN J=M1(J,1) ELSE J=M1(J,0)
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
280 IF M1(J,1)=-1 THEN H=1:GOTO 105 ELSE J=M1(J,1):GOTO 280
285 REM-----------------------------------------------------------G COMMAND
290 S$=MID$(S$,2):S=LEN(S$):IF S=0 THEN GOTO 105
295 K=INSTR(H,L1$(J),S$):IF K=0 THEN IF M1(J,1)=-1 THEN PRINT "EOB":A$="":GOTO 105 ELSE J=M1(J,1):H=1:GOTO 295
300 U=U+1:IF U<T THEN H=K+S:GOTO 295
305 PRINT LEFT$(L1$(J),K+S-1):H=K
310 GOTO 110
315 REM-----------------------------------------------------------I COMMAND
320 IF MID$(S$,2)<>"" THEN 345 ELSE I2=J:IF J=LN THEN LN=IN
325 INPUT L1$(IN):IF L1$(IN)"\\" THEN 105
330 I3=M1(IN,1):M1(IN,1)=I2
335 M1(IN,0)=M1(I2,0):M1(I2,0)=IN:I4=M1(IN,0)
340 M1(I4,1)=IN:IN=I3:M1(I3,0)=0:GOTO 325
345 IF H1=1 THEN L1$(J)=MID$(S$,2)+L1$(J) ELSE L1$(J)=LEFT$(L1$(J),H-1)+MID$(S$,2)+MID$(L1$(J),H)
350 H=H+LEN(S$):GOTO 105
355 REM-----------------------------------------------------------J COMMAND
360 IF T=0 THEN H=1:GOTO 105
365 H=H+T:IF H<1 THEN H=1
370 IF H>LEN(L1$(J)) THEN H=LEN(L1$(J))
375 GOTO 105
380 REM-----------------------------------------------------------K COMMAND
385 H=1:I2=J:I3=M1(J,0):FOR J1=1 TO T
390 IF M1(J,1)=-1 THEN GOTO 410
395 I4=M1(J,1):L1$(J)="":M1(I4,0)=I3
400 M1(IN,0)=J:M1(J,0)=0:M1(J,1)=IN:IN=J
405 J=I4:NEXT
410 IF I2=LN THEN LN=J ELSE M1(I3,1)=J
415 GOTO 105
420 REM-----------------------------------------------------------L COMMAND
425 I2=J:FOR J=1 TO T
430 PRINT L1$(I2):IF M1(I2,1)=-1 THEN GOTO 105 ELSE I2=M1(I2,1):NEXT
435 GOTO 105
440 REM-----------------------------------------------------------N COMMAND
445 I2=LN
450 IF M1(I2,1)=-1 THEN GOTO 465 ELSE PRINT #2,L1$(I2):I2=M1(I2,1)
455 GOTO 450
460 REM-----------------------------------------------------------R COMMAND
465 @S=0:J=1:A2=0:LN=1:I=1:FE=0:GOSUB 470:GOTO 105
470 IF @S=-1 THEN PRINT "EOF1":I=I-1:FE=1:GOTO 495
475 INPUT &16,L$:IF L$="" THEN GOTO 470
480 A2=A2+LEN(L$)
485 L1$(I)=L$:M1(I,0)=I-1:IF I=1 THEN 490 ELSE M1(I-1,1)=I
490 IF I=50 OR A2>2000 THEN GOTO 495 ELSE I=I+1:GOTO 470
495 M1(I,1)=I+1:I=I+1:L1$(I)="END OF BUFFER":M1(I,0)=I-1:M1(I,1)=-1:H=1:IN=I+1
500 FOR I2=IN TO 100:M1(I2,1)=I2+1:M1(I2,0)=I2-1:NEXT
505 M1(IN,0)=0:M1(I2-1,1)=-1:RETURN
510 REM-----------------------------------------------------------V COMMAND
515 PRINT LEFT$(L1$(J),H):GOTO 105
520 REM-----------------------------------------------------------X COMMAND
525 I2=LN
530 IF M1(I2,1)=-1 THEN GOTO 535 ELSE PRINT #2,L1$(I2):I2=M1(I2,1):GOTO 530
535 IF FE=0 THEN I=1:A2=0:GOSUB 470 GOTO 525
540 CLOSE:ON ERROR GOTO 555:INPUT "BACKUP FILE NAME?";N3$:KILL N3$
545 NAME N1$ AS N3$
550 NAME N2$ AS N1$: CLEAR 200:END
555 IF ERR = 53 THEN GOTO 545: ELSE:ON ERROR GOTO 0
