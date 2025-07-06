10 '                 == WRITTEN BY D. L. FITCHHORN ==
15 '                =   *****  ****   *****  *****   =
20 '               =    *      *   *    *      *      =
25 '              =     ***    *   *    *      *       =
30 '               =    *      *   *    *      *      =
45 '                =   *****  ****     *      *     =
40 '                 ==   PROGRAMMER - MITS, INC   ==
45 '
50 DEFINT A-Z
55 CLEAR 15000
60 DIM L1$(100),L2$(13),M1(100,1):FOR I=0 TO 13:READ L2$(I):NEXT
65 DATA 
   A - ADVANCE,B - BEGINNING,C - CHANGE,D - DELETE,E - END,G - GET,I - INSERT,
   J - JUMP, K - KILL,L -LIST,N = NEXT,R - READ,V - VERIFY,X - EXIT
70 PRINT "EDIT -- VERSION 1.0":PRINT
75 LINE INPUT "INPUT FILE NAME?"; N1$
80 OPEN "I",1,N1$
85 N2$="EDIT.TMP"
90 OPEN "O",2,N2$:PRINT #2,""
95 I=1:J=1:H=1
100 '---------------------------------------------------------INPUT COMMAND
105 K=0
110 IF A$="" THEN FOR Q9=1 TO 5:PRINT CHR$(7);:NEXT:LINE INPUT ">"; A$
115 A=0:J1=1:U=0:T=1
120 IF A$="" THEN 105 ELSE I9=INSTR(A$,"\\"):IF I9<>0 THEN S$=LEFT$(A$,I9-1):
    A$=MID$(A$,I9+1) ELSE S$=A$:A$=""
125 SS=ASC(S$)
130 IF 64<SS THEN IF 96<SS THEN SS=SS-32:GOTO 170 ELSE GOTO 170
135 T=VAL(S$)
140 S=LEN(STR$(T))
145 IF T=0 THEN IF LEFT$(S$,1)="/" THEN T=400
150 S$=MID$(S$,S)
155 IF T<0 THEN S$=MID$(S$,2)
160 GOTO 125
165 '             .A  .B  .C  .D  .E  <F> .G  <H> .I  .J  .K  .L  <M>
170 ON SS-64 GOTO 195,235,245,265,280,180,290,180,320,360,385,425,180,
                  445,180,180,180,465,180,180,180,515,180,525,180,180
175 '             .N  <O> <P> <Q> .R  <S> <T> <U> .V  <W> .X  <Y> <Z>
180 FOR N=0 TO 12:PRINT L2$(N):NEXT:GOTO 105
185 '
190 '-----------------------------------------------------------A COMMAND
195 H=1:IF T=0 THEN GOTO 105 ELSE IF T<0 THEN J1=-1
200 FOR I3=0 TO T-J1 STEP J1
205     IF M1(J,0)=0 AND J1=-1 THEN GOTO 105
210     IF M1(J,1)=-1 AND J1=1 THEN J=M1(J,0):GOTO 105
215     IF J1=1 THEN J=M1(J,1) ELSE J=M1(J,0)
220 NEXT
225 GOTO 105
230 '-----------------------------------------------------------B COMMAND
235 J=LN:H=1:GOTO 105
240 '-----------------------------------------------------------C COMMAND
245 S$=MID$(S$,2):IF K=0 THEN S=LEN(S$):K=H
250 IF K=1 THEN L1$(J)=S$+MID$(L1$(J),K+S) ELSE L1$(J)=LEFT$(L1$(J),K-1)+
    S$+MID$(L1$(J),K+S)
255 PRINT L1$(J):H=K+LEN(S$):GOTO 105
260 '-----------------------------------------------------------D COMMAND
265 IF H=1 THEN L1$(J)=MID$(L1$(J),H+T):
    ELSE L1$(J)=LEFT$(L1$(J),H-1)+MID$(L1$(J),H+T)
270 GOTO 105
275 '-----------------------------------------------------------E COMMAND
280 IF M1(J,1)=-1 THEN H=1:GOTO 105 ELSE J=M1(J,1):GOTO 280
285 '-----------------------------------------------------------G COMMAND
290 S$=MID$(S$,2):S=LEN(S$):IF S=0 THEN GOTO 105
295 K=INSTR(H,L1$(J),S$):IF K=0 THEN IF M1(J,1)=-1
    THEN PRINT "EOB":A$="":GOTO 105 ELSE J=M1(J,1):H=1:GOTO 295
300 U=U+1:IF U<T THEN H=K+S:GOTO 295
305 PRINT LEFT$(L1$(J),K+S-1):H=K
310 GOTO 110
315 '-----------------------------------------------------------I COMMAND
320 IF MID$(S$,2)<>"" THEN 345 ELSE I2=J:IF J=LN THEN LN=IN
325 LINE INPUT L1$(IN):IF L1$(IN)"\\" THEN 105
330 I3=M1(IN,1):M1(IN,1)=I2
335 M1(IN,0)=M1(I2,0):
