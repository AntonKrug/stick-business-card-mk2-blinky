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
L Connector:Conn_01x08_Female J1
U 1 1 60EDDD6F
P 3400 3900
F 0 "J1" H 3428 3876 50  0000 L CNN
F 1 "Conn_01x08_Female" H 3428 3785 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 3400 3900 50  0001 C CNN
F 3 "~" H 3400 3900 50  0001 C CNN
	1    3400 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J2
U 1 1 60EDE972
P 4750 3900
F 0 "J2" H 4778 3876 50  0000 L CNN
F 1 "Conn_01x08_Female" H 4778 3785 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 4750 3900 50  0001 C CNN
F 3 "~" H 4750 3900 50  0001 C CNN
	1    4750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3600 3000 3600
Wire Wire Line
	3200 3700 3000 3700
Wire Wire Line
	3200 3800 3000 3800
Wire Wire Line
	3200 3900 3000 3900
Wire Wire Line
	3200 4000 3000 4000
Wire Wire Line
	3200 4100 3000 4100
Wire Wire Line
	3200 4200 3000 4200
Wire Wire Line
	3200 4300 3000 4300
Wire Wire Line
	4550 3600 4300 3600
Wire Wire Line
	4550 3700 4300 3700
Wire Wire Line
	4550 3800 4300 3800
Wire Wire Line
	4550 3900 4300 3900
Wire Wire Line
	4550 4000 4300 4000
Wire Wire Line
	4550 4100 4300 4100
Wire Wire Line
	4550 4200 4300 4200
Wire Wire Line
	4550 4300 4300 4300
Text Label 3000 3600 0    50   ~ 0
PB2
Text Label 3000 3700 0    50   ~ 0
PB1
Text Label 3000 3800 0    50   ~ 0
PB0
Text Label 3000 3900 0    50   ~ 0
PD7
Text Label 3000 4000 0    50   ~ 0
PD5
Text Label 3000 4100 0    50   ~ 0
PC4
Text Label 3000 4200 0    50   ~ 0
PC3
Text Label 3000 4300 0    50   ~ 0
PC2
Text Label 4300 3600 0    50   ~ 0
PD6LED
Text Label 4300 3700 0    50   ~ 0
VCC
Text Label 4300 3800 0    50   ~ 0
GND
Text Label 4300 3900 0    50   ~ 0
SCK
Text Label 4300 4000 0    50   ~ 0
RST
Text Label 4300 4100 0    50   ~ 0
MISO
Text Label 4300 4200 0    50   ~ 0
MOSI
Text Label 4300 4300 0    50   ~ 0
PC1
$EndSCHEMATC
