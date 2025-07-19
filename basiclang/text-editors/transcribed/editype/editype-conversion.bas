42 pc=1:lc=1:f=0:print chr$(14): dim a$(200):print "{clear}":poke 650,128
51 m$=""
53 print "{clear}   mode selection":print:print:print"lp=load and print":print
55 print "n=new":print:print"e=edit":print:print"p=print"
58 print:print "s=save":print:print "l=load":print:print "c=continue"
60 print:input "select mode: "; m$
61 if m$="e" then 3010
62 if m$="p" then 3800
63 if m$="n" then 100
64 if m$="l" then 5000
65 if m$="s" then 6000
66 if m$="lp" then 3800
67 if m$="c" then for b=1 to k-1:print a$(b):next b print a$(k);:goto 120
68 goto 51
100 for a=1 to 200:a$(a)="":next a
103 input "type file name";v$
105 print "{clear}       new mode":k=1
120 poke 204,0:poke 207,0:get c$:if c$="" then 120:poke 204:2
130 if c$="{down}" then 120
140 if c$="{up}" then 120
150 if c$="{right}"  then 120
160 if c$="{left}"  then 120
170 if c$="@" then 51
171 if c$="{home}" then 120
172 if c$="{clear}" then 120
175 if c$=chr$(20) and len(a$(k))=0 then 120
180 print c$;    
190 if c$=chr$(13) then k=k+1:a$(k)=a$(k)+c$:goto 120
200 if c$=chr$(20) then a$(k)=left$(a$(k),len(a$(k))-1):goto 120
210 a$(k)=a$(k)+c$:c$="":if len(a$(k))<22 then 120
220 if right$(a$(k),1)=chr$(32) then 240
221 if right$(a$(k),1)=chr$(160) then 240
230 a$(k+1)=right$(a$(k),1)+a$(k+1):a$(k)=left$(a$(k),len(a$(k))-1):goto 220
240 for u=1 to 22-len(a$(k)):print chr$(20);:next u
250 if len(a$(k))<11 then print,,
260 if len(a$(k))>10 then print,
264 if a$(k)="" then a$(k)=" "
265 if fre(o)<600 then print "{rev}memory low{off}":print
266 if fre(o)<500 then 51
270 k=k=1:print a$(k);:goto 120
280 goto 51
3010 c4$="":c5$=""
3015 print "{clear}     edit mode":q=1
3025 print:print "f=forward":print "@=return to menu":print "c=correct"
3016 print "selection? "
3030 get w$:if w$="" then 3030
3040 if w$="f" then print a$(q):q=q+1:if q>199 then 51:goto 3030
3055 if w$="@" then 51
3066 if w$="c" then 3200
3061 goto 3030
3200 print "error:"
3210 for a=1 to 80
3220     get j$:if j$="" then 3220
3225     if j$="{up}" then 3250
3226     if j$=chr$(20) then c4$=left$(c4$,len(c4$)-1):goto 3235
3230     c4$=c$+j$
3235     print j$
3240 next a
3250 print:print "correction: "
3260 for a=1 to 80
3270     get j$:if j$="" then 3270
3280     if j$="{up}" then 3310
3281     if j$=chr$(20) then c5$=left$(c5$,len(c5$)-1):goto 3290
3285     c5$=c5$+j$
3290     print j$;
3300 next a
3310 print "{clear}   {rev}correcting{off}"
3320 for a=1 to 200
3325     for b=1 to len (a$(a))
3327         o=len(c4$)
3329         if mid$(a$(a),b,o)=c4$ then oo=len(a$(a))-b+1-len(c4$)
3330         if mid$(a$(a),b,o)=c4$ then c6$=right$(a$(a),oo)
3340         if mid$(a$(a),b,o)=c4$ then a$(a)=left$(a$(a),b-1):goto 3344
3341         goto 3346
3344         a$(a)=a$(a)+c5$+c6$:c4$="":c5$=""
3345         print "{clear}":for h=1 to a:print a$(h):next h:q=h::goto 3025
3346     next b
3347 next a
3348 print "{clear}{red}{rev}error not found{blu}{off}":print:goto 3025
3350 goto 3010
3800 print:input "normal line length"; la
3810 print:input "inset line length"; lb
3903 print "single or double      space? s/d"
3904 input sd$
3905 input "line numbering #"; sl
4000 t1$="":n=1:ll=la
4002 open 4,4
4003 t$="":t2$="":p$="":lc=1
4010 print #4:print #4:print #4
4016 lc=3
4040 close 4,4
4050 if a$(n)="" and m$="lp" then 5002
4051 if a$(n)="" then 4600
4059 t2$=a$(n)
4060 for a=1 to ll-len(p$)
4061     t2$="" then 4094
4065     x$=left$(t2$,1):t2$=right$(t2$,len(t2$)-1)
4075     if x$="[" then ll=lb:goto 4060
4076     if x$="]" then fl=1:goto 4060
4080     if x$="{up}" then 4200
4085     if x$=chr$(13) then 4660
4090     p$=p$+x$
4094     if len(t2$)=0 then n=n+1:goto 4050
4095 next a
4100 goto 4610
4200 for a=1 to la
4210     x$=left$(t2$,1):t2$=right$(t2$,len(t2$)-1)
4211     if len(t2$)=0 then n=n+1:t2$=a$(n)
4214     if a$(n)="" and len (t2$)=0 then p$=x$:goto 4660
4220     if x$=chr$(13) then 4300
4230     p$=p$+x$
4240 next a
4300 in=(80-len(p$))/2:goto 4670
4620 if right$(p$,1)=chr$(32) then 4660
4622 if right$(p$,1)=chr$(160) then 4660
4630 t1$=right$(p$,1)+t1$:p$=left$(p$,len(p$)-1)
4640 next a
4660 if left$(p$,1)=chr$(32) then p$=right(p$,len(p$)-1)
4661 if left$(p$,1)=chr$(160) then p$=right$(p$,len(p$)-1)
4662 print p$
4665 in=(80-ll)/2
4666 de$=str$(sl):if fl=1 then open 4,4
4667 if fl=1 then print #4,chr$(17)de$"."spc(in-len(de$)-1)p$spc(75-len(p$)-in)de$"."
4668 if fl=1 then close 4:lc=lc+1:sl=sl+1:p$="":fl=0:p$=t1$:t1$="":goto 4680
4670 open 4,4:print #4,chr$(17)spc(in)p$:close 4,4:p$="":p$=t1$:t1$="":lc=lc+1
4680 if sd$="d" then open 4,4:print #4:close 4:lc=lc+1
4690 if lc>60 then 7000
4700 if x$=chr$(13) then ll=la
4701 if a$(n)="" and m$="lp" then p$=p$+x$:goto 5002
4705 if a$(n) "" then 51
4710 goto 4060
5000 input "type file name"; v$
5002 for a=1 to 200:a$(a)="":next a
5005 print "{clear}      load mode"
5010 open 1,1,0,v$
5015 print "file open, loading."
5020 for a=1 to 200
5025     for b=1 to 22
5030         get #1,z$
5031         a$(a)=a$(a)+z$
5040         if z$="" then 5065
5042     next b
5050 next a
5065 close 1:n=1
5070 if m$="lp" then n=1:goto 4050
5080 goto 51
6000 print "{clear}save mode"
6010 open 1,1,1,v$
6030 for a=1 to 200
6040     print #1,a$(a);
6050     if a$(a)="" then 6075
6060 next a
6075 close 1
6080 goto 51
7000 open 4,4
7001 for m=1 to 66-lc
7002     print #4
7003 next m
7004 print #4:pc=pc+1
7005 print #4,chr$(17)spc(70)"page "pc
7006 print #4
7007 close 4
7008 lc=3
7009 goto 4060
