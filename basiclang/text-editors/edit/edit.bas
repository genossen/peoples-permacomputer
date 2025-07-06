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
100 '---------------------------------------------------INPUT COMMAND
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
195 
