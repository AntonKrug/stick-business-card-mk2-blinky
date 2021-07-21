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
L MCU_Microchip_ATmega:ATmega88-20AU U?
U 1 1 60F7A185
P 4650 3500
F 0 "U?" H 4650 1911 50  0001 C CNN
F 1 "ATmega88-20AU" H 4650 1911 50  0001 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 4650 3500 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2545-8-bit-AVR-Microcontroller-ATmega48-88-168_Datasheet.pdf" H 4650 3500 50  0001 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F7AFE1
P 4650 5000
F 0 "#PWR?" H 4650 4750 50  0001 C CNN
F 1 "GND" H 4655 4827 50  0001 C CNN
F 2 "" H 4650 5000 50  0001 C CNN
F 3 "" H 4650 5000 50  0001 C CNN
	1    4650 5000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60F7BFA3
P 4650 2000
F 0 "#PWR?" H 4650 1850 50  0001 C CNN
F 1 "VCC" H 4665 2173 50  0000 C CNN
F 2 "" H 4650 2000 50  0001 C CNN
F 3 "" H 4650 2000 50  0001 C CNN
	1    4650 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60F7CF82
P 6150 4300
F 0 "R?" V 5943 4300 50  0001 C CNN
F 1 "68R" V 6250 4300 50  0000 C CNN
F 2 "" V 6080 4300 50  0001 C CNN
F 3 "~" H 6150 4300 50  0001 C CNN
	1    6150 4300
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60F7D9C4
P 6650 4200
F 0 "R?" V 6443 4200 50  0001 C CNN
F 1 "68R" V 6535 4200 50  0000 C CNN
F 2 "" V 6580 4200 50  0001 C CNN
F 3 "~" H 6650 4200 50  0001 C CNN
	1    6650 4200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 60F7E51A
P 6500 4650
F 0 "D?" V 6454 4730 50  0001 L CNN
F 1 "3.6V" V 6500 4730 50  0000 L CNN
F 2 "" H 6500 4650 50  0001 C CNN
F 3 "~" H 6500 4650 50  0001 C CNN
	1    6500 4650
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 60F7F729
P 6950 4650
F 0 "D?" V 6904 4730 50  0001 L CNN
F 1 "3.6V" V 6950 4730 50  0000 L CNN
F 2 "" H 6950 4650 50  0001 C CNN
F 3 "~" H 6950 4650 50  0001 C CNN
	1    6950 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 4300 6500 4500
Wire Wire Line
	6800 4200 6950 4200
Wire Wire Line
	6950 4200 6950 4500
$Comp
L power:GND #PWR?
U 1 1 60F82C2B
P 6500 4800
F 0 "#PWR?" H 6500 4550 50  0001 C CNN
F 1 "GND" H 6505 4627 50  0001 C CNN
F 2 "" H 6500 4800 50  0001 C CNN
F 3 "" H 6500 4800 50  0001 C CNN
	1    6500 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F83088
P 6950 4800
F 0 "#PWR?" H 6950 4550 50  0001 C CNN
F 1 "GND" H 6955 4627 50  0001 C CNN
F 2 "" H 6950 4800 50  0001 C CNN
F 3 "" H 6950 4800 50  0001 C CNN
	1    6950 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_A USB
U 1 1 60F834CD
P 7800 4350
F 0 "USB" H 7700 4750 50  0000 C CNN
F 1 "USB_A" H 7857 4726 50  0001 C CNN
F 2 "" H 7950 4300 50  0001 C CNN
F 3 " ~" H 7950 4300 50  0001 C CNN
	1    7800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F88083
P 7800 4750
F 0 "#PWR?" H 7800 4500 50  0001 C CNN
F 1 "GND" H 7805 4577 50  0001 C CNN
F 2 "" H 7800 4750 50  0001 C CNN
F 3 "" H 7800 4750 50  0001 C CNN
	1    7800 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F88439
P 7700 4750
F 0 "#PWR?" H 7700 4500 50  0001 C CNN
F 1 "GND" H 7705 4577 50  0001 C CNN
F 2 "" H 7700 4750 50  0001 C CNN
F 3 "" H 7700 4750 50  0001 C CNN
	1    7700 4750
	1    0    0    -1  
$EndComp
Connection ~ 6950 4200
Wire Wire Line
	6950 4200 7300 4200
Connection ~ 6500 4300
Wire Wire Line
	6500 4300 7300 4300
Text GLabel 7300 4200 2    50   Input ~ 0
D+
Text GLabel 7300 4300 2    50   Input ~ 0
D-
Text GLabel 8100 4350 2    50   Input ~ 0
D+
Text GLabel 8100 4450 2    50   Input ~ 0
D-
$Comp
L power:VCC #PWR?
U 1 1 60F89CBC
P 8100 4150
F 0 "#PWR?" H 8100 4000 50  0001 C CNN
F 1 "VCC" H 8115 4323 50  0000 C CNN
F 2 "" H 8100 4150 50  0001 C CNN
F 3 "" H 8100 4150 50  0001 C CNN
	1    8100 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 60F8A617
P 5750 4600
F 0 "D?" H 5743 4345 50  0001 C CNN
F 1 "LED" H 5743 4437 50  0000 C CNN
F 2 "" H 5750 4600 50  0001 C CNN
F 3 "~" H 5750 4600 50  0001 C CNN
	1    5750 4600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F8BEE8
P 5900 4800
F 0 "#PWR?" H 5900 4550 50  0001 C CNN
F 1 "GND" H 5905 4627 50  0001 C CNN
F 2 "" H 5900 4800 50  0001 C CNN
F 3 "" H 5900 4800 50  0001 C CNN
	1    5900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4800 5900 4600
Wire Wire Line
	6300 4300 6500 4300
Text GLabel 6000 4600 2    50   Input ~ 0
PD6LED
Wire Wire Line
	6000 4600 5900 4600
Connection ~ 5900 4600
$Comp
L Connector_Generic:Conn_02x03_Odd_Even ISP
U 1 1 60F8EC52
P 7650 3600
F 0 "ISP" H 7700 3825 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7700 3826 50  0001 C CNN
F 2 "" H 7650 3600 50  0001 C CNN
F 3 "~" H 7650 3600 50  0001 C CNN
	1    7650 3600
	1    0    0    -1  
$EndComp
Text GLabel 7450 3500 0    50   Input ~ 0
RST
Text GLabel 7450 3600 0    50   Input ~ 0
SCK
Text GLabel 7450 3700 0    50   Input ~ 0
MISO
Text GLabel 7950 3600 2    50   Input ~ 0
MOSI
$Comp
L power:GND #PWR?
U 1 1 60F92052
P 8300 3500
F 0 "#PWR?" H 8300 3250 50  0001 C CNN
F 1 "GND" H 8305 3327 50  0001 C CNN
F 2 "" H 8300 3500 50  0001 C CNN
F 3 "" H 8300 3500 50  0001 C CNN
	1    8300 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3500 7950 3500
$Comp
L power:VCC #PWR?
U 1 1 60F92718
P 8500 3700
F 0 "#PWR?" H 8500 3550 50  0001 C CNN
F 1 "VCC" H 8515 3873 50  0000 C CNN
F 2 "" H 8500 3700 50  0001 C CNN
F 3 "" H 8500 3700 50  0001 C CNN
	1    8500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3700 8500 3700
Text GLabel 5250 3800 2    50   Input ~ 0
RST
Text GLabel 5250 2800 2    50   Input ~ 0
SCK
Text GLabel 5250 2700 2    50   Input ~ 0
MISO
Text GLabel 5250 2600 2    50   Input ~ 0
MOSI
Text Notes 4150 5200 0    50   ~ 0
AT MEGA88 20AU
Text GLabel 5250 2500 2    50   Input ~ 0
PB2
Text GLabel 5250 2400 2    50   Input ~ 0
PB1
Text GLabel 5250 2300 2    50   Input ~ 0
PB0
Text GLabel 5250 4700 2    50   Input ~ 0
PD7
Wire Wire Line
	5250 4300 6000 4300
Wire Wire Line
	5250 4200 6500 4200
Text GLabel 5250 4500 2    50   Input ~ 0
PD5
Text GLabel 5250 3600 2    50   Input ~ 0
PC4
Wire Wire Line
	5600 4600 5250 4600
Text GLabel 5250 3500 2    50   Input ~ 0
PC3
Text GLabel 5250 3400 2    50   Input ~ 0
PC2
Text GLabel 5250 3300 2    50   Input ~ 0
PC1
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 60F99D93
P 8450 2650
F 0 "J2" H 8400 3100 50  0000 L CNN
F 1 "Conn_01x08" H 8530 2551 50  0001 L CNN
F 2 "" H 8450 2650 50  0001 C CNN
F 3 "~" H 8450 2650 50  0001 C CNN
	1    8450 2650
	1    0    0    -1  
$EndComp
Text GLabel 8250 2350 0    50   Input ~ 0
PD6LED
Text GLabel 8250 2650 0    50   Input ~ 0
SCK
Text GLabel 8250 2750 0    50   Input ~ 0
RST
Text GLabel 8250 2850 0    50   Input ~ 0
MISO
Text GLabel 8250 2950 0    50   Input ~ 0
MOSI
Text GLabel 8250 3050 0    50   Input ~ 0
PC1
$Comp
L power:GND #PWR?
U 1 1 60F9C6CA
P 7800 2550
F 0 "#PWR?" H 7800 2300 50  0001 C CNN
F 1 "GND" H 7805 2377 50  0001 C CNN
F 2 "" H 7800 2550 50  0001 C CNN
F 3 "" H 7800 2550 50  0001 C CNN
	1    7800 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2550 7800 2550
$Comp
L power:VCC #PWR?
U 1 1 60F9CE61
P 7800 2450
F 0 "#PWR?" H 7800 2300 50  0001 C CNN
F 1 "VCC" H 7815 2623 50  0000 C CNN
F 2 "" H 7800 2450 50  0001 C CNN
F 3 "" H 7800 2450 50  0001 C CNN
	1    7800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2450 7800 2450
$Comp
L Connector_Generic:Conn_01x08 J1
U 1 1 60F9DB1B
P 7400 2650
F 0 "J1" H 7350 3100 50  0000 L CNN
F 1 "Conn_01x08" H 7480 2551 50  0001 L CNN
F 2 "" H 7400 2650 50  0001 C CNN
F 3 "~" H 7400 2650 50  0001 C CNN
	1    7400 2650
	1    0    0    -1  
$EndComp
Text GLabel 7200 2350 0    50   Input ~ 0
PB2
Text GLabel 7200 2450 0    50   Input ~ 0
PB1
Text GLabel 7200 2550 0    50   Input ~ 0
PB0
Text GLabel 7200 2650 0    50   Input ~ 0
PD7
Text GLabel 7200 2750 0    50   Input ~ 0
PD5
Text GLabel 7200 2850 0    50   Input ~ 0
PC4
Text GLabel 7200 2950 0    50   Input ~ 0
PC3
Text GLabel 7200 3050 0    50   Input ~ 0
PC2
$Comp
L Device:Crystal_GND24 Y?
U 1 1 60F9F121
P 6100 3200
F 0 "Y?" V 6146 2956 50  0001 R CNN
F 1 "12MHz" V 6300 3500 50  0000 R CNN
F 2 "" H 6100 3200 50  0001 C CNN
F 3 "~" H 6100 3200 50  0001 C CNN
	1    6100 3200
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 60FA7CA0
P 6250 2800
F 0 "C?" V 5998 2800 50  0001 C CNN
F 1 "3.3pF" V 6090 2800 50  0000 C CNN
F 2 "" H 6288 2650 50  0001 C CNN
F 3 "~" H 6250 2800 50  0001 C CNN
	1    6250 2800
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60FAC2F2
P 6250 3650
F 0 "C?" V 5998 3650 50  0001 C CNN
F 1 "3.3pF" V 6410 3650 50  0000 C CNN
F 2 "" H 6288 3500 50  0001 C CNN
F 3 "~" H 6250 3650 50  0001 C CNN
	1    6250 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 3050 6100 2800
Wire Wire Line
	5900 3200 5800 3200
$Comp
L power:GND #PWR?
U 1 1 60FAFF04
P 5800 3300
F 0 "#PWR?" H 5800 3050 50  0001 C CNN
F 1 "GND" H 5805 3127 50  0001 C CNN
F 2 "" H 5800 3300 50  0001 C CNN
F 3 "" H 5800 3300 50  0001 C CNN
	1    5800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3200 5800 3300
Wire Wire Line
	6100 3350 6100 3650
Wire Wire Line
	6100 3650 5600 3650
Wire Wire Line
	5600 3650 5600 3000
Wire Wire Line
	5600 3000 5250 3000
Wire Wire Line
	6100 2800 5600 2800
Wire Wire Line
	5600 2800 5600 2900
Wire Wire Line
	5600 2900 5250 2900
Connection ~ 6100 2800
$Comp
L power:GND #PWR?
U 1 1 60FB2B02
P 6450 3700
F 0 "#PWR?" H 6450 3450 50  0001 C CNN
F 1 "GND" H 6455 3527 50  0001 C CNN
F 2 "" H 6450 3700 50  0001 C CNN
F 3 "" H 6450 3700 50  0001 C CNN
	1    6450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3650 6450 3650
Wire Wire Line
	6450 3650 6450 3700
Wire Wire Line
	6300 3200 6450 3200
Wire Wire Line
	6450 3200 6450 3650
Connection ~ 6450 3650
Wire Wire Line
	6400 2800 6450 2800
Wire Wire Line
	6450 2800 6450 3200
Connection ~ 6450 3200
Connection ~ 6100 3650
$EndSCHEMATC
