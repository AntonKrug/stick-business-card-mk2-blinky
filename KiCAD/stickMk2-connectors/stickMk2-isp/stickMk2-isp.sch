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
L Connector_Generic:Conn_02x03_Odd_Even ISP1
U 1 1 60EE71FA
P 4600 3500
F 0 "ISP1" H 4650 3817 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 4650 3726 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x03_P1.27mm_Vertical_SMD" H 4600 3500 50  0001 C CNN
F 3 "~" H 4600 3500 50  0001 C CNN
	1    4600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3400 4100 3400
Wire Wire Line
	4400 3500 4100 3500
Wire Wire Line
	4400 3600 4100 3600
Wire Wire Line
	4900 3400 5250 3400
Wire Wire Line
	4900 3500 5250 3500
Wire Wire Line
	4900 3600 5250 3600
Text Label 4100 3400 0    50   ~ 0
RST
Text Label 4100 3500 0    50   ~ 0
SCK
Text Label 4100 3600 0    50   ~ 0
MISO
Text Label 5100 3600 0    50   ~ 0
VCC
Text Label 5050 3500 0    50   ~ 0
MOSI
Text Label 5100 3400 0    50   ~ 0
GND
$EndSCHEMATC
