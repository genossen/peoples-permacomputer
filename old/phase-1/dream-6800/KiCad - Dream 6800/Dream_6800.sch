EESchema Schematic File Version 2
LIBS:Dream_6800
LIBS:180_din
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Dream_6800-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title ""
Date "4 jan 2019"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1400 2200 1000 600 
U 5BB9FB4E
F0 "CPU" 50
F1 "Dream_6800_CPU.sch" 50
$EndSheet
Text Notes 4100 1250 0    200  ~ 40
Dream 6800 Computer
$Sheet
S 1400 3200 1000 600 
U 5BBA3BEF
F0 "Memory" 50
F1 "Dream_6800_Mem.sch" 50
$EndSheet
$Sheet
S 1400 4200 1000 600 
U 5BBB10E3
F0 "Keyboard" 50
F1 "Dream_6800_Keys.sch" 50
$EndSheet
$Sheet
S 1400 5200 1000 600 
U 5BBB9A6A
F0 "Cassette" 50
F1 "Dream_6800_Cass.sch" 50
$EndSheet
$Sheet
S 3000 2200 1000 600 
U 5BBC86A7
F0 "Video" 50
F1 "Dream_6800_Video.sch" 50
$EndSheet
$Comp
L CONN_20X2 P6
U 1 1 5BC0C71B
P 9300 3550
F 0 "P6" H 9300 4600 60  0000 C CNN
F 1 "Expansion Connector" V 9300 3550 60  0000 C CNN
F 2 "" H 9300 3550 60  0000 C CNN
F 3 "" H 9300 3550 60  0000 C CNN
	1    9300 3550
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P7
U 1 1 5BC0C72A
P 9350 5100
F 0 "P7" H 9430 5100 40  0000 L CNN
F 1 "CONN_1" H 9350 5155 30  0001 C CNN
F 2 "" H 9350 5100 60  0000 C CNN
F 3 "" H 9350 5100 60  0000 C CNN
	1    9350 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P8
U 1 1 5BC0C739
P 9350 5300
F 0 "P8" H 9430 5300 40  0000 L CNN
F 1 "CONN_1" H 9350 5355 30  0001 C CNN
F 2 "" H 9350 5300 60  0000 C CNN
F 3 "" H 9350 5300 60  0000 C CNN
	1    9350 5300
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P9
U 1 1 5BC0C748
P 9350 5500
F 0 "P9" H 9430 5500 40  0000 L CNN
F 1 "CONN_1" H 9350 5555 30  0001 C CNN
F 2 "" H 9350 5500 60  0000 C CNN
F 3 "" H 9350 5500 60  0000 C CNN
	1    9350 5500
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P10
U 1 1 5BC0C757
P 9350 5700
F 0 "P10" H 9430 5700 40  0000 L CNN
F 1 "CONN_1" H 9350 5755 30  0001 C CNN
F 2 "" H 9350 5700 60  0000 C CNN
F 3 "" H 9350 5700 60  0000 C CNN
	1    9350 5700
	1    0    0    -1  
$EndComp
NoConn ~ 9200 5100
NoConn ~ 9200 5300
NoConn ~ 9200 5500
NoConn ~ 9200 5700
Wire Wire Line
	8900 2600 8700 2600
Wire Wire Line
	8900 2700 8700 2700
Wire Wire Line
	8900 2800 8700 2800
Wire Wire Line
	8900 2900 8700 2900
Wire Wire Line
	8900 3000 8700 3000
Wire Wire Line
	8900 3100 8700 3100
Wire Wire Line
	8900 3200 8700 3200
Wire Wire Line
	8900 3300 8700 3300
Wire Wire Line
	9700 2600 9900 2600
Wire Wire Line
	9700 2700 9900 2700
Wire Wire Line
	9700 2800 9900 2800
Wire Wire Line
	9700 2900 9900 2900
Wire Wire Line
	9700 3000 9900 3000
Wire Wire Line
	9700 3100 9900 3100
Wire Wire Line
	9700 3200 9900 3200
Wire Wire Line
	9700 3300 9900 3300
Text GLabel 8700 3700 0    50   3State ~ 0
A15
Text GLabel 9900 3700 2    50   3State ~ 0
A14
Text GLabel 8700 3600 0    50   3State ~ 0
A13
Text GLabel 9900 3600 2    50   3State ~ 0
A12
Text GLabel 8700 3500 0    50   3State ~ 0
A11
Text GLabel 9900 3500 2    50   3State ~ 0
A10
Text GLabel 8700 3400 0    50   3State ~ 0
A9
Text GLabel 9900 3400 2    50   3State ~ 0
A8
Text GLabel 8700 3300 0    50   3State ~ 0
A7
Text GLabel 9900 3300 2    50   3State ~ 0
A6
Text GLabel 8700 3200 0    50   3State ~ 0
A5
Text GLabel 9900 3200 2    50   3State ~ 0
A4
Text GLabel 8700 3100 0    50   3State ~ 0
A3
Text GLabel 9900 3100 2    50   3State ~ 0
A2
Text GLabel 8700 3000 0    50   3State ~ 0
A1
Text GLabel 9900 3000 2    50   3State ~ 0
A0
Wire Wire Line
	8900 3400 8700 3400
Wire Wire Line
	8900 3500 8700 3500
Wire Wire Line
	8900 3600 8700 3600
Wire Wire Line
	8900 3700 8700 3700
Wire Wire Line
	9700 3400 9900 3400
Wire Wire Line
	9700 3500 9900 3500
Wire Wire Line
	9700 3600 9900 3600
Wire Wire Line
	9700 3700 9900 3700
Text GLabel 8700 2900 0    50   BiDi ~ 0
D7
Text GLabel 8700 2800 0    50   BiDi ~ 0
D6
Text GLabel 8700 2700 0    50   BiDi ~ 0
D5
Text GLabel 8700 2600 0    50   BiDi ~ 0
D4
Text GLabel 9900 2600 2    50   BiDi ~ 0
D3
Text GLabel 9900 2700 2    50   BiDi ~ 0
D2
Text GLabel 9900 2800 2    50   BiDi ~ 0
D1
Text GLabel 9900 2900 2    50   BiDi ~ 0
D0
Wire Wire Line
	8900 3800 8400 3800
Wire Wire Line
	9700 3800 10200 3800
Wire Wire Line
	8900 3900 8700 3900
Wire Wire Line
	8900 4000 8700 4000
Wire Wire Line
	9700 3900 9900 3900
Wire Wire Line
	9700 4000 9900 4000
Wire Wire Line
	9700 4100 9900 4100
Text GLabel 9900 4000 2    50   Input ~ 0
R/W*
Text GLabel 9900 3900 2    50   Input ~ 0
BA*
Text GLabel 8700 4200 0    50   Input ~ 0
02
Text GLabel 9900 4100 2    50   Input ~ 0
IRQ*
Text GLabel 8700 3900 0    50   Input ~ 0
RST*
Text Label 10200 3800 0    60   ~ 0
GND
Text Label 8400 3800 2    60   ~ 0
GND
Wire Wire Line
	8900 4500 8700 4500
Wire Wire Line
	9700 4500 9900 4500
Text GLabel 8700 4300 0    50   Input ~ 0
+5v
Text GLabel 9900 4300 2    50   Input ~ 0
+5v
Wire Wire Line
	8900 4200 8700 4200
Text GLabel 8700 4000 0    50   Input ~ 0
VMA
$Sheet
S 3000 3200 1000 600 
U 5BC12967
F0 "Power" 50
F1 "Dream_6800_Power.sch" 50
$EndSheet
$Comp
L C C19
U 1 1 5BC1B598
P 5700 2800
F 0 "C19" H 5750 2925 40  0000 L CNN
F 1 "100nF" H 5750 2675 40  0000 L CNN
F 2 "~" H 5738 2650 30  0000 C CNN
F 3 "~" H 5700 2800 60  0000 C CNN
	1    5700 2800
	1    0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 5BC1B59E
P 6100 2800
F 0 "C20" H 6150 2925 40  0000 L CNN
F 1 "100nF" H 6150 2675 40  0000 L CNN
F 2 "~" H 6138 2650 30  0000 C CNN
F 3 "~" H 6100 2800 60  0000 C CNN
	1    6100 2800
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 5BC1B5A4
P 6500 2800
F 0 "C21" H 6550 2925 40  0000 L CNN
F 1 "100nF" H 6550 2675 40  0000 L CNN
F 2 "~" H 6538 2650 30  0000 C CNN
F 3 "~" H 6500 2800 60  0000 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 5BC1B5AA
P 6900 2800
F 0 "C22" H 6950 2925 40  0000 L CNN
F 1 "100nF" H 6950 2675 40  0000 L CNN
F 2 "~" H 6938 2650 30  0000 C CNN
F 3 "~" H 6900 2800 60  0000 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 5BC1B5B0
P 7300 2800
F 0 "C23" H 7350 2925 40  0000 L CNN
F 1 "100nF" H 7350 2675 40  0000 L CNN
F 2 "~" H 7338 2650 30  0000 C CNN
F 3 "~" H 7300 2800 60  0000 C CNN
	1    7300 2800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR01
U 1 1 5BC1B5B6
P 5000 2350
F 0 "#PWR01" H 5000 2450 30  0001 C CNN
F 1 "VCC" H 5000 2450 30  0000 C CNN
F 2 "" H 5000 2350 60  0000 C CNN
F 3 "" H 5000 2350 60  0000 C CNN
	1    5000 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5BC1B5BC
P 7600 4800
F 0 "#PWR02" H 7600 4800 30  0001 C CNN
F 1 "GND" H 7600 4730 30  0001 C CNN
F 2 "" H 7600 4800 60  0000 C CNN
F 3 "" H 7600 4800 60  0000 C CNN
	1    7600 4800
	1    0    0    -1  
$EndComp
$Comp
L CP C18
U 1 1 5BC1B5C2
P 5300 2800
F 0 "C18" H 5350 2925 40  0000 L CNN
F 1 "22uF" H 5350 2675 40  0000 L CNN
F 2 "~" H 5400 2650 30  0000 C CNN
F 3 "~" H 5300 2800 300 0000 C CNN
	1    5300 2800
	1    0    0    -1  
$EndComp
$Comp
L C C31
U 1 1 5BC1B5C8
P 5700 4400
F 0 "C31" H 5750 4525 40  0000 L CNN
F 1 "100nF" H 5750 4275 40  0000 L CNN
F 2 "~" H 5738 4250 30  0000 C CNN
F 3 "~" H 5700 4400 60  0000 C CNN
	1    5700 4400
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 5BC3DB0B
P 5300 3600
F 0 "C24" H 5350 3725 40  0000 L CNN
F 1 "100nF" H 5350 3475 40  0000 L CNN
F 2 "~" H 5338 3450 30  0000 C CNN
F 3 "~" H 5300 3600 60  0000 C CNN
	1    5300 3600
	1    0    0    -1  
$EndComp
$Comp
L C C25
U 1 1 5BC3DB11
P 5700 3600
F 0 "C25" H 5750 3725 40  0000 L CNN
F 1 "100nF" H 5750 3475 40  0000 L CNN
F 2 "~" H 5738 3450 30  0000 C CNN
F 3 "~" H 5700 3600 60  0000 C CNN
	1    5700 3600
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 5BC3DB17
P 6100 3600
F 0 "C26" H 6150 3725 40  0000 L CNN
F 1 "100nF" H 6150 3475 40  0000 L CNN
F 2 "~" H 6138 3450 30  0000 C CNN
F 3 "~" H 6100 3600 60  0000 C CNN
	1    6100 3600
	1    0    0    -1  
$EndComp
$Comp
L C C27
U 1 1 5BC3DB1D
P 6500 3600
F 0 "C27" H 6550 3725 40  0000 L CNN
F 1 "100nF" H 6550 3475 40  0000 L CNN
F 2 "~" H 6538 3450 30  0000 C CNN
F 3 "~" H 6500 3600 60  0000 C CNN
	1    6500 3600
	1    0    0    -1  
$EndComp
$Comp
L C C28
U 1 1 5BC3DB23
P 6900 3600
F 0 "C28" H 6950 3725 40  0000 L CNN
F 1 "100nF" H 6950 3475 40  0000 L CNN
F 2 "~" H 6938 3450 30  0000 C CNN
F 3 "~" H 6900 3600 60  0000 C CNN
	1    6900 3600
	1    0    0    -1  
$EndComp
$Comp
L C C29
U 1 1 5BC3DB29
P 7300 3600
F 0 "C29" H 7350 3725 40  0000 L CNN
F 1 "100nF" H 7350 3475 40  0000 L CNN
F 2 "~" H 7338 3450 30  0000 C CNN
F 3 "~" H 7300 3600 60  0000 C CNN
	1    7300 3600
	1    0    0    -1  
$EndComp
$Comp
L C C30
U 1 1 5BC3DB2F
P 5300 4400
F 0 "C30" H 5350 4525 40  0000 L CNN
F 1 "100nF" H 5350 4275 40  0000 L CNN
F 2 "~" H 5338 4250 30  0000 C CNN
F 3 "~" H 5300 4400 60  0000 C CNN
	1    5300 4400
	1    0    0    -1  
$EndComp
$Comp
L C C32
U 1 1 5BC3DB59
P 6100 4400
F 0 "C32" H 6150 4525 40  0000 L CNN
F 1 "100nF" H 6150 4275 40  0000 L CNN
F 2 "~" H 6138 4250 30  0000 C CNN
F 3 "~" H 6100 4400 60  0000 C CNN
	1    6100 4400
	1    0    0    -1  
$EndComp
$Comp
L C C33
U 1 1 5BC3DB5F
P 6500 4400
F 0 "C33" H 6550 4525 40  0000 L CNN
F 1 "100nF" H 6550 4275 40  0000 L CNN
F 2 "~" H 6538 4250 30  0000 C CNN
F 3 "~" H 6500 4400 60  0000 C CNN
	1    6500 4400
	1    0    0    -1  
$EndComp
$Comp
L C C34
U 1 1 5BC3DB65
P 6900 4400
F 0 "C34" H 6950 4525 40  0000 L CNN
F 1 "100nF" H 6950 4275 40  0000 L CNN
F 2 "~" H 6938 4250 30  0000 C CNN
F 3 "~" H 6900 4400 60  0000 C CNN
	1    6900 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4600 5300 4700
Wire Wire Line
	5300 3800 5300 3900
Wire Wire Line
	5300 3900 7600 3900
Wire Wire Line
	5300 3000 5300 3100
Wire Wire Line
	5300 3100 7600 3100
Connection ~ 7600 3900
Wire Wire Line
	5700 3800 5700 3900
Connection ~ 5700 3900
Wire Wire Line
	6100 3800 6100 3900
Connection ~ 6100 3900
Wire Wire Line
	6500 3800 6500 3900
Connection ~ 6500 3900
Wire Wire Line
	6900 3800 6900 3900
Connection ~ 6900 3900
Wire Wire Line
	7300 3800 7300 3900
Connection ~ 7300 3900
Connection ~ 6900 4700
Connection ~ 6500 4700
Connection ~ 6100 4700
Connection ~ 5700 4700
Wire Wire Line
	5700 3000 5700 3100
Connection ~ 5700 3100
Wire Wire Line
	6100 3000 6100 3100
Connection ~ 6100 3100
Wire Wire Line
	6500 3000 6500 3100
Connection ~ 6500 3100
Wire Wire Line
	6900 3000 6900 3100
Connection ~ 6900 3100
Wire Wire Line
	7300 3000 7300 3100
Connection ~ 7300 3100
Wire Wire Line
	7300 4100 5000 4100
Wire Wire Line
	5000 4100 5000 2350
Wire Wire Line
	5300 4200 5300 4100
Connection ~ 5300 4100
Wire Wire Line
	5700 4200 5700 4100
Connection ~ 5700 4100
Wire Wire Line
	6100 4200 6100 4100
Connection ~ 6100 4100
Wire Wire Line
	6500 4200 6500 4100
Connection ~ 6500 4100
Wire Wire Line
	6900 4200 6900 4100
Connection ~ 6900 4100
Wire Wire Line
	7300 3400 7300 3300
Wire Wire Line
	7300 3300 5000 3300
Connection ~ 5000 3300
Wire Wire Line
	6900 3400 6900 3300
Connection ~ 6900 3300
Wire Wire Line
	6500 3400 6500 3300
Connection ~ 6500 3300
Wire Wire Line
	6100 3400 6100 3300
Connection ~ 6100 3300
Wire Wire Line
	5700 3400 5700 3300
Connection ~ 5700 3300
Wire Wire Line
	5300 3400 5300 3300
Connection ~ 5300 3300
Wire Wire Line
	7300 2600 7300 2500
Wire Wire Line
	7300 2500 5000 2500
Connection ~ 5000 2500
Wire Wire Line
	6900 2600 6900 2500
Connection ~ 6900 2500
Wire Wire Line
	6500 2600 6500 2500
Connection ~ 6500 2500
Wire Wire Line
	6100 2600 6100 2500
Connection ~ 6100 2500
Wire Wire Line
	5700 2600 5700 2500
Connection ~ 5700 2500
Wire Wire Line
	5300 2600 5300 2500
Connection ~ 5300 2500
NoConn ~ 9700 4200
NoConn ~ 9700 4400
NoConn ~ 8900 4400
Wire Wire Line
	9700 4300 9900 4300
Wire Wire Line
	8900 4300 8700 4300
Text GLabel 8700 4500 0    50   Input ~ 0
+12v
Text GLabel 9900 4500 2    50   Input ~ 0
+12v
Wire Wire Line
	5700 4600 5700 4700
Wire Wire Line
	6100 4600 6100 4700
Wire Wire Line
	6500 4600 6500 4700
Wire Wire Line
	6900 4600 6900 4700
Wire Wire Line
	7600 3100 7600 4800
Connection ~ 7600 4700
Connection ~ 7300 4700
Wire Wire Line
	5300 4700 7600 4700
Wire Wire Line
	7300 4600 7300 4700
Wire Wire Line
	7300 4200 7300 4100
$Comp
L CP C35
U 1 1 5BD9E5CE
P 7300 4400
F 0 "C35" H 7350 4525 40  0000 L CNN
F 1 "22uF" H 7350 4275 40  0000 L CNN
F 2 "~" H 7400 4250 30  0000 C CNN
F 3 "~" H 7300 4400 300 0000 C CNN
	1    7300 4400
	1    0    0    -1  
$EndComp
NoConn ~ 8900 4100
$EndSCHEMATC
