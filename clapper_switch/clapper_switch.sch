EESchema Schematic File Version 2
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
LIBS:clapper_switch-cache
EELAYER 25 0
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
L ATTINY85-P IC1
U 1 1 5913D8C0
P 4100 2700
F 0 "IC1" H 2950 3100 50  0000 C CNN
F 1 "ATTINY85-P" H 5100 2300 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_LongPads" H 5100 2700 50  0001 C CIN
F 3 "" H 4100 2700 50  0000 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5913D957
P 1350 2350
F 0 "R1" V 1430 2350 50  0000 C CNN
F 1 "10k" V 1350 2350 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering" V 1280 2350 50  0001 C CNN
F 3 "" H 1350 2350 50  0000 C CNN
	1    1350 2350
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5913D9FE
P 1900 2650
F 0 "C1" H 1925 2750 50  0000 L CNN
F 1 "0.1uF" H 1925 2550 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D6_P5" H 1938 2500 50  0001 C CNN
F 3 "" H 1900 2650 50  0000 C CNN
	1    1900 2650
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5913DAD2
P 2250 3200
F 0 "R2" V 2330 3200 50  0000 C CNN
F 1 "10k" V 2250 3200 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering" V 2180 3200 50  0001 C CNN
F 3 "" H 2250 3200 50  0000 C CNN
	1    2250 3200
	1    0    0    -1  
$EndComp
$Comp
L Microphone MK1
U 1 1 5913DB6C
P 1150 3200
F 0 "MK1" H 1000 3250 50  0000 R CNN
F 1 "Microphone" H 1000 3175 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-18_2Pin" V 1150 3300 50  0001 C CNN
F 3 "" V 1150 3300 50  0000 C CNN
	1    1150 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2650 2050 2650
Wire Wire Line
	1100 2650 1750 2650
Wire Wire Line
	1350 2500 1350 2650
Connection ~ 1350 2650
Wire Wire Line
	2250 3050 2250 2650
Connection ~ 2250 2650
$Comp
L GND #PWR3
U 1 1 5913DC9B
P 2250 3750
F 0 "#PWR3" H 2250 3500 50  0001 C CNN
F 1 "GND" H 2250 3600 50  0000 C CNN
F 2 "" H 2250 3750 50  0000 C CNN
F 3 "" H 2250 3750 50  0000 C CNN
	1    2250 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 5913DCC6
P 1150 3750
F 0 "#PWR1" H 1150 3500 50  0001 C CNN
F 1 "GND" H 1150 3600 50  0000 C CNN
F 2 "" H 1150 3750 50  0000 C CNN
F 3 "" H 1150 3750 50  0000 C CNN
	1    1150 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 5913DCE0
P 5750 3650
F 0 "#PWR7" H 5750 3400 50  0001 C CNN
F 1 "GND" H 5750 3500 50  0000 C CNN
F 2 "" H 5750 3650 50  0000 C CNN
F 3 "" H 5750 3650 50  0000 C CNN
	1    5750 3650
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR6
U 1 1 5913DCF7
P 5650 1650
F 0 "#PWR6" H 5650 1500 50  0001 C CNN
F 1 "+5V" H 5650 1790 50  0000 C CNN
F 2 "" H 5650 1650 50  0000 C CNN
F 3 "" H 5650 1650 50  0000 C CNN
	1    5650 1650
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR2
U 1 1 5913DD27
P 1350 1650
F 0 "#PWR2" H 1350 1500 50  0001 C CNN
F 1 "+5V" H 1350 1790 50  0000 C CNN
F 2 "" H 1350 1650 50  0000 C CNN
F 3 "" H 1350 1650 50  0000 C CNN
	1    1350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2200 1350 1650
Wire Wire Line
	2250 3350 2250 3750
Wire Wire Line
	1150 3400 1150 3750
Wire Wire Line
	5450 2950 5750 2950
Wire Wire Line
	5750 2950 5750 3650
Wire Wire Line
	5450 2450 5650 2450
Wire Wire Line
	5650 2450 5650 1650
$Comp
L CONN_01X03 P1
U 1 1 59633443
P 3100 1150
F 0 "P1" H 3100 1350 50  0000 C CNN
F 1 "CONN_01X03" V 3200 1150 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MCV-G_03x3.81mm_Vertical" H 3100 1150 50  0001 C CNN
F 3 "" H 3100 1150 50  0000 C CNN
	1    3100 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 59633494
P 3050 1550
F 0 "#PWR5" H 3050 1300 50  0001 C CNN
F 1 "GND" H 3050 1400 50  0000 C CNN
F 2 "" H 3050 1550 50  0000 C CNN
F 3 "" H 3050 1550 50  0000 C CNN
	1    3050 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR4
U 1 1 596334C3
P 2700 750
F 0 "#PWR4" H 2700 600 50  0001 C CNN
F 1 "+5V" H 2700 890 50  0000 C CNN
F 2 "" H 2700 750 50  0000 C CNN
F 3 "" H 2700 750 50  0000 C CNN
	1    2700 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2550 2400 2550
Wire Wire Line
	2400 2550 2400 1150
Wire Wire Line
	2400 1150 2900 1150
Wire Wire Line
	3050 1550 2900 1550
Wire Wire Line
	2900 1550 2900 1250
Wire Wire Line
	2900 1050 2700 1050
Wire Wire Line
	2700 1050 2700 750 
$Comp
L CONN_01X02 P2
U 1 1 5963355E
P 1450 1000
F 0 "P2" H 1450 1150 50  0000 C CNN
F 1 "CONN_01X02" V 1550 1000 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MCV-G_02x3.81mm_Vertical" H 1450 1000 50  0001 C CNN
F 3 "" H 1450 1000 50  0000 C CNN
	1    1450 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2650 1150 3000
Wire Wire Line
	1100 2650 1100 1050
Wire Wire Line
	1100 1050 1250 1050
Connection ~ 1150 2650
Wire Wire Line
	1150 3600 750  3600
Wire Wire Line
	750  3600 750  950 
Wire Wire Line
	750  950  1250 950 
Connection ~ 1150 3600
$Comp
L Transformer_1P_1S T1
U 1 1 59634495
P 7500 1850
F 0 "T1" H 7500 2100 50  0000 C CNN
F 1 "Transformer_1P_1S" H 7500 1550 50  0000 C CNN
F 2 "TenstarRobot:TenstarRobot" H 7500 1850 50  0001 C CNN
F 3 "" H 7500 1850 50  0000 C CNN
	1    7500 1850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 59634682
P 8700 1800
F 0 "P3" H 8700 1950 50  0000 C CNN
F 1 "CONN_01X02" V 8800 1800 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MCV-G_02x3.81mm_Vertical" H 8700 1800 50  0001 C CNN
F 3 "" H 8700 1800 50  0000 C CNN
	1    8700 1800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR8
U 1 1 596346FC
P 6800 1300
F 0 "#PWR8" H 6800 1150 50  0001 C CNN
F 1 "+5V" H 6800 1440 50  0000 C CNN
F 2 "" H 6800 1300 50  0000 C CNN
F 3 "" H 6800 1300 50  0000 C CNN
	1    6800 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 59634722
P 6850 2700
F 0 "#PWR9" H 6850 2450 50  0001 C CNN
F 1 "GND" H 6850 2550 50  0000 C CNN
F 2 "" H 6850 2700 50  0000 C CNN
F 3 "" H 6850 2700 50  0000 C CNN
	1    6850 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2050 6850 2050
Wire Wire Line
	6850 2050 6850 2700
Wire Wire Line
	7100 1650 6800 1650
Wire Wire Line
	6800 1650 6800 1300
Wire Wire Line
	7900 1650 8200 1650
Wire Wire Line
	8200 1650 8200 1750
Wire Wire Line
	8200 1750 8500 1750
Wire Wire Line
	8500 1850 8250 1850
Wire Wire Line
	8250 1850 8250 2050
Wire Wire Line
	8250 2050 7900 2050
$Comp
L CONN_01X01 P4
U 1 1 5963531A
P 8000 3350
F 0 "P4" H 8000 3450 50  0000 C CNN
F 1 "CONN_01X01" V 8100 3350 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 8000 3350 50  0001 C CNN
F 3 "" H 8000 3350 50  0000 C CNN
	1    8000 3350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 5963571E
P 8000 3750
F 0 "P5" H 8000 3850 50  0000 C CNN
F 1 "CONN_01X01" V 8100 3750 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 8000 3750 50  0001 C CNN
F 3 "" H 8000 3750 50  0000 C CNN
	1    8000 3750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 5963575F
P 8000 4050
F 0 "P6" H 8000 4150 50  0000 C CNN
F 1 "CONN_01X01" V 8100 4050 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 8000 4050 50  0001 C CNN
F 3 "" H 8000 4050 50  0000 C CNN
	1    8000 4050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P7
U 1 1 5963579B
P 8000 4400
F 0 "P7" H 8000 4500 50  0000 C CNN
F 1 "CONN_01X01" V 8100 4400 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_DIN965_Pad" H 8000 4400 50  0001 C CNN
F 3 "" H 8000 4400 50  0000 C CNN
	1    8000 4400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
