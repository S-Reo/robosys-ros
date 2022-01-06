EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR01
U 1 1 61D656A2
P 5450 4400
F 0 "#PWR01" H 5450 4150 50  0001 C CNN
F 1 "GND" H 5455 4227 50  0000 C CNN
F 2 "" H 5450 4400 50  0001 C CNN
F 3 "" H 5450 4400 50  0001 C CNN
	1    5450 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 61D65B34
P 4050 3000
F 0 "D1" H 4043 2745 50  0000 C CNN
F 1 "LED" H 4043 2836 50  0000 C CNN
F 2 "" H 4050 3000 50  0001 C CNN
F 3 "~" H 4050 3000 50  0001 C CNN
	1    4050 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 61D66079
P 4650 3000
F 0 "R1" H 4720 3046 50  0000 L CNN
F 1 "R" H 4720 2955 50  0000 L CNN
F 2 "" V 4580 3000 50  0001 C CNN
F 3 "~" H 4650 3000 50  0001 C CNN
	1    4650 3000
	0    -1   -1   0   
$EndComp
Text GLabel 3450 3000 0    50   Input ~ 0
GPIO0
Text GLabel 3450 3400 0    50   Input ~ 0
GPIO1
Text GLabel 3450 3800 0    50   Input ~ 0
GPIO2
Text GLabel 3450 4200 0    50   Input ~ 0
GPIO3
$Comp
L Device:R R2
U 1 1 61D67860
P 4650 3400
F 0 "R2" H 4720 3446 50  0000 L CNN
F 1 "R" H 4720 3355 50  0000 L CNN
F 2 "" V 4580 3400 50  0001 C CNN
F 3 "~" H 4650 3400 50  0001 C CNN
	1    4650 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 61D67C21
P 4650 3800
F 0 "R3" H 4720 3846 50  0000 L CNN
F 1 "R" H 4720 3755 50  0000 L CNN
F 2 "" V 4580 3800 50  0001 C CNN
F 3 "~" H 4650 3800 50  0001 C CNN
	1    4650 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 61D67FA0
P 4650 4200
F 0 "R4" V 4857 4200 50  0000 C CNN
F 1 "R" V 4766 4200 50  0000 C CNN
F 2 "" V 4580 4200 50  0001 C CNN
F 3 "~" H 4650 4200 50  0001 C CNN
	1    4650 4200
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 61D68899
P 4050 3400
F 0 "D2" H 4043 3145 50  0000 C CNN
F 1 "LED" H 4043 3236 50  0000 C CNN
F 2 "" H 4050 3400 50  0001 C CNN
F 3 "~" H 4050 3400 50  0001 C CNN
	1    4050 3400
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 61D68AF0
P 4050 3800
F 0 "D3" H 4043 3545 50  0000 C CNN
F 1 "LED" H 4043 3636 50  0000 C CNN
F 2 "" H 4050 3800 50  0001 C CNN
F 3 "~" H 4050 3800 50  0001 C CNN
	1    4050 3800
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 61D68E18
P 4050 4200
F 0 "D4" H 4043 3945 50  0000 C CNN
F 1 "LED" H 4043 4036 50  0000 C CNN
F 2 "" H 4050 4200 50  0001 C CNN
F 3 "~" H 4050 4200 50  0001 C CNN
	1    4050 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 3000 3900 3000
Wire Wire Line
	4200 3000 4500 3000
Wire Wire Line
	4800 3000 5450 3000
Wire Wire Line
	3450 3400 3900 3400
Wire Wire Line
	4200 3400 4500 3400
Wire Wire Line
	4800 3400 5450 3400
Wire Wire Line
	4800 3800 5450 3800
Wire Wire Line
	4800 4200 5450 4200
Wire Wire Line
	4200 3800 4150 3800
Wire Wire Line
	4200 4200 4500 4200
Wire Wire Line
	3900 4200 3450 4200
Connection ~ 4200 3800
Wire Wire Line
	4200 3800 4500 3800
Wire Wire Line
	3450 3800 3900 3800
Connection ~ 5450 4200
Wire Wire Line
	5450 4200 5450 4400
Connection ~ 5450 3800
Wire Wire Line
	5450 3800 5450 4200
Connection ~ 5450 3400
Wire Wire Line
	5450 3400 5450 3800
Wire Wire Line
	5450 3000 5450 3400
$EndSCHEMATC
