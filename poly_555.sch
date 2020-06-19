EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
Wire Wire Line
	3200 5200 2650 5200
Wire Wire Line
	2650 5200 2650 5600
Wire Wire Line
	2650 5600 2700 5600
Wire Wire Line
	3200 5200 3200 5400
Wire Wire Line
	2700 5800 2200 5800
Wire Wire Line
	3700 5800 3750 5800
$Comp
L Device:R R1
U 1 1 5EEB6743
P 2200 5400
F 0 "R1" H 2300 5350 50  0000 L CNN
F 1 "100k" H 2300 5250 50  0000 L CNN
F 2 "" V 2130 5400 50  0001 C CNN
F 3 "~" H 2200 5400 50  0001 C CNN
	1    2200 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5200 2550 5200
Wire Wire Line
	2200 5200 2200 5250
Connection ~ 2650 5200
Wire Wire Line
	2200 5550 2200 5700
Wire Wire Line
	2700 5700 2200 5700
Connection ~ 2200 5700
$Comp
L Device:C C1
U 1 1 5EEB74D0
P 2200 6100
F 0 "C1" H 2350 6100 50  0000 L CNN
F 1 "C" H 2350 6000 50  0000 L CNN
F 2 "" H 2238 5950 50  0001 C CNN
F 3 "~" H 2200 6100 50  0001 C CNN
	1    2200 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5EEC3F0C
P 2650 6100
F 0 "C2" H 2800 6100 50  0000 L CNN
F 1 "C" H 2800 6000 50  0000 L CNN
F 2 "" H 2688 5950 50  0001 C CNN
F 3 "~" H 2650 6100 50  0001 C CNN
	1    2650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5900 2650 5900
Wire Wire Line
	2650 5900 2650 5950
Wire Wire Line
	2200 6250 2200 6300
Wire Wire Line
	2200 6300 2650 6300
Wire Wire Line
	2650 6300 2650 6250
Wire Wire Line
	3200 6100 3200 6300
Wire Wire Line
	3200 6300 2650 6300
Connection ~ 2650 6300
$Comp
L Device:Battery BT1
U 1 1 5EEAE121
P 1450 3400
F 0 "BT1" H 1558 3446 50  0000 L CNN
F 1 "9v" H 1558 3355 50  0000 L CNN
F 2 "" V 1450 3460 50  0001 C CNN
F 3 "~" V 1450 3460 50  0001 C CNN
	1    1450 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1850 750  -1850 700 
$Comp
L Device:R R4
U 1 1 5EF734F2
P 2900 7300
F 0 "R4" H 2650 7350 50  0000 L CNN
F 1 "10k" H 2650 7250 50  0000 L CNN
F 2 "" V 2830 7300 50  0001 C CNN
F 3 "~" H 2900 7300 50  0001 C CNN
	1    2900 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6850 2900 6850
Wire Wire Line
	2900 6850 2900 7150
$Comp
L Device:R_POT_TRIM_US RV1
U 1 1 5EFDD371
P 3400 6450
F 0 "RV1" V 3300 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 3332 6405 50  0001 R CNN
F 2 "" H 3400 6450 50  0001 C CNN
F 3 "~" H 3400 6450 50  0001 C CNN
	1    3400 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5EFF89F4
P 2900 6450
F 0 "R3" V 2800 6400 50  0000 L CNN
F 1 "100k" V 2700 6350 50  0000 L CNN
F 2 "" V 2830 6450 50  0001 C CNN
F 3 "~" H 2900 6450 50  0001 C CNN
	1    2900 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U1
U 1 1 5EEAB27C
P 3200 5700
F 0 "U1" H 3300 6000 60  0000 C CNN
F 1 "555" H 3500 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 3400 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 3400 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 3400 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 3400 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 3400 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 3400 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 3400 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 3400 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 3400 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 3400 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3400 6900 60  0001 L CNN "Status"
	1    3200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 5800 2200 5950
Connection ~ 2200 5800
Wire Wire Line
	3050 6450 3250 6450
Wire Wire Line
	2200 5700 2200 5800
Wire Wire Line
	2200 5800 2000 5800
Wire Wire Line
	2000 5800 2000 6450
Wire Wire Line
	2000 6450 2750 6450
Wire Wire Line
	3550 6450 3600 6450
Connection ~ 3750 6450
Wire Wire Line
	3750 6450 3750 6850
Wire Wire Line
	3750 5800 3750 6450
Wire Wire Line
	3400 6300 3400 6250
Wire Wire Line
	3400 6250 3600 6250
Wire Wire Line
	3600 6250 3600 6450
Connection ~ 3600 6450
Wire Wire Line
	3600 6450 3750 6450
Wire Wire Line
	5150 5200 4600 5200
Wire Wire Line
	4600 5200 4600 5600
Wire Wire Line
	4600 5600 4650 5600
Wire Wire Line
	5150 5200 5150 5400
Wire Wire Line
	4650 5800 4150 5800
Wire Wire Line
	5650 5800 5700 5800
$Comp
L Device:R R7
U 1 1 5F030D9C
P 4150 5400
F 0 "R7" H 4250 5350 50  0000 L CNN
F 1 "100k" H 4250 5250 50  0000 L CNN
F 2 "" V 4080 5400 50  0001 C CNN
F 3 "~" H 4150 5400 50  0001 C CNN
	1    4150 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5200 4500 5200
Wire Wire Line
	4150 5200 4150 5250
Connection ~ 4600 5200
Wire Wire Line
	4150 5550 4150 5700
Wire Wire Line
	4650 5700 4150 5700
Connection ~ 4150 5700
$Comp
L Device:C C5
U 1 1 5F030DA8
P 4150 6100
F 0 "C5" H 4300 6100 50  0000 L CNN
F 1 "C" H 4300 6000 50  0000 L CNN
F 2 "" H 4188 5950 50  0001 C CNN
F 3 "~" H 4150 6100 50  0001 C CNN
	1    4150 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5F030DAE
P 4600 6100
F 0 "C6" H 4750 6100 50  0000 L CNN
F 1 "C" H 4750 6000 50  0000 L CNN
F 2 "" H 4638 5950 50  0001 C CNN
F 3 "~" H 4600 6100 50  0001 C CNN
	1    4600 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5900 4600 5900
Wire Wire Line
	4600 5900 4600 5950
Wire Wire Line
	4150 6250 4150 6300
Wire Wire Line
	4150 6300 4600 6300
Wire Wire Line
	4600 6300 4600 6250
Wire Wire Line
	5150 6100 5150 6300
Wire Wire Line
	5150 6300 4600 6300
Connection ~ 4600 6300
$Comp
L Device:R R10
U 1 1 5F030DD4
P 4850 7300
F 0 "R10" H 4600 7350 50  0000 L CNN
F 1 "10k" H 4600 7250 50  0000 L CNN
F 2 "" V 4780 7300 50  0001 C CNN
F 3 "~" H 4850 7300 50  0001 C CNN
	1    4850 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6850 4850 6850
Wire Wire Line
	4850 6850 4850 7150
$Comp
L Device:R_POT_TRIM_US RV3
U 1 1 5F030DDF
P 5350 6450
F 0 "RV3" V 5250 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 5282 6405 50  0001 R CNN
F 2 "" H 5350 6450 50  0001 C CNN
F 3 "~" H 5350 6450 50  0001 C CNN
	1    5350 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 5F030DE5
P 4850 6450
F 0 "R9" V 4750 6400 50  0000 L CNN
F 1 "100k" V 4650 6350 50  0000 L CNN
F 2 "" V 4780 6450 50  0001 C CNN
F 3 "~" H 4850 6450 50  0001 C CNN
	1    4850 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U3
U 1 1 5F030DF4
P 5150 5700
F 0 "U3" H 5250 6000 60  0000 C CNN
F 1 "555" H 5450 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 5350 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 5350 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 5350 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 5350 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 5350 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 5350 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 5350 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 5350 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 5350 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 5350 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5350 6900 60  0001 L CNN "Status"
	1    5150 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5800 4150 5950
Connection ~ 4150 5800
Wire Wire Line
	5000 6450 5200 6450
Wire Wire Line
	4150 5700 4150 5800
Wire Wire Line
	4150 5800 3950 5800
Wire Wire Line
	3950 5800 3950 6450
Wire Wire Line
	3950 6450 4700 6450
Wire Wire Line
	5500 6450 5550 6450
Connection ~ 5700 6450
Wire Wire Line
	5700 6450 5700 6850
Wire Wire Line
	5700 5800 5700 6450
Wire Wire Line
	5350 6300 5350 6250
Wire Wire Line
	5350 6250 5550 6250
Wire Wire Line
	5550 6250 5550 6450
Connection ~ 5550 6450
Wire Wire Line
	5550 6450 5700 6450
Wire Wire Line
	7100 5200 6550 5200
Wire Wire Line
	6550 5200 6550 5600
Wire Wire Line
	6550 5600 6600 5600
Wire Wire Line
	7100 5200 7100 5400
Wire Wire Line
	6600 5800 6100 5800
Wire Wire Line
	7600 5800 7650 5800
$Comp
L Device:R R13
U 1 1 5F03AD6E
P 6100 5400
F 0 "R13" H 6200 5350 50  0000 L CNN
F 1 "100k" H 6200 5250 50  0000 L CNN
F 2 "" V 6030 5400 50  0001 C CNN
F 3 "~" H 6100 5400 50  0001 C CNN
	1    6100 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5200 6450 5200
Wire Wire Line
	6100 5200 6100 5250
Connection ~ 6550 5200
Wire Wire Line
	6100 5550 6100 5700
Wire Wire Line
	6600 5700 6100 5700
Connection ~ 6100 5700
$Comp
L Device:C C9
U 1 1 5F03AD7A
P 6100 6100
F 0 "C9" H 6250 6100 50  0000 L CNN
F 1 "C" H 6250 6000 50  0000 L CNN
F 2 "" H 6138 5950 50  0001 C CNN
F 3 "~" H 6100 6100 50  0001 C CNN
	1    6100 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5F03AD80
P 6550 6100
F 0 "C10" H 6700 6100 50  0000 L CNN
F 1 "C" H 6700 6000 50  0000 L CNN
F 2 "" H 6588 5950 50  0001 C CNN
F 3 "~" H 6550 6100 50  0001 C CNN
	1    6550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5900 6550 5900
Wire Wire Line
	6550 5900 6550 5950
Wire Wire Line
	6100 6250 6100 6300
Wire Wire Line
	6100 6300 6550 6300
Wire Wire Line
	6550 6300 6550 6250
Wire Wire Line
	7100 6100 7100 6300
Wire Wire Line
	7100 6300 6550 6300
Connection ~ 6550 6300
$Comp
L Device:R R15
U 1 1 5F03ADA6
P 6800 7300
F 0 "R15" H 6550 7350 50  0000 L CNN
F 1 "10k" H 6550 7250 50  0000 L CNN
F 2 "" V 6730 7300 50  0001 C CNN
F 3 "~" H 6800 7300 50  0001 C CNN
	1    6800 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 6850 6800 6850
Wire Wire Line
	6800 6850 6800 7150
$Comp
L Device:R_POT_TRIM_US RV5
U 1 1 5F03ADB1
P 7300 6450
F 0 "RV5" V 7200 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 7232 6405 50  0001 R CNN
F 2 "" H 7300 6450 50  0001 C CNN
F 3 "~" H 7300 6450 50  0001 C CNN
	1    7300 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 5F03ADB7
P 6800 6450
F 0 "R14" V 6700 6400 50  0000 L CNN
F 1 "100k" V 6600 6350 50  0000 L CNN
F 2 "" V 6730 6450 50  0001 C CNN
F 3 "~" H 6800 6450 50  0001 C CNN
	1    6800 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U5
U 1 1 5F03ADC6
P 7100 5700
F 0 "U5" H 7200 6000 60  0000 C CNN
F 1 "555" H 7400 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 7300 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 7300 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 7300 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 7300 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 7300 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 7300 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 7300 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 7300 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 7300 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 7300 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7300 6900 60  0001 L CNN "Status"
	1    7100 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5800 6100 5950
Connection ~ 6100 5800
Wire Wire Line
	6950 6450 7150 6450
Wire Wire Line
	6100 5700 6100 5800
Wire Wire Line
	6100 5800 5900 5800
Wire Wire Line
	5900 5800 5900 6450
Wire Wire Line
	5900 6450 6650 6450
Wire Wire Line
	7450 6450 7500 6450
Connection ~ 7650 6450
Wire Wire Line
	7650 6450 7650 6850
Wire Wire Line
	7650 5800 7650 6450
Wire Wire Line
	7300 6300 7300 6250
Wire Wire Line
	7300 6250 7500 6250
Wire Wire Line
	7500 6250 7500 6450
Connection ~ 7500 6450
Wire Wire Line
	7500 6450 7650 6450
Wire Wire Line
	9050 5200 8500 5200
Wire Wire Line
	8500 5200 8500 5600
Wire Wire Line
	8500 5600 8550 5600
Wire Wire Line
	9050 5200 9050 5400
Wire Wire Line
	8550 5800 8050 5800
Wire Wire Line
	9550 5800 9600 5800
$Comp
L Device:R R16
U 1 1 5F099C21
P 8050 5400
F 0 "R16" H 8150 5350 50  0000 L CNN
F 1 "100k" H 8150 5250 50  0000 L CNN
F 2 "" V 7980 5400 50  0001 C CNN
F 3 "~" H 8050 5400 50  0001 C CNN
	1    8050 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5200 8400 5200
Wire Wire Line
	8050 5200 8050 5250
Connection ~ 8500 5200
Wire Wire Line
	8050 5550 8050 5700
Wire Wire Line
	8550 5700 8050 5700
Connection ~ 8050 5700
$Comp
L Device:C C11
U 1 1 5F099C2D
P 8050 6100
F 0 "C11" H 8200 6100 50  0000 L CNN
F 1 "C" H 8200 6000 50  0000 L CNN
F 2 "" H 8088 5950 50  0001 C CNN
F 3 "~" H 8050 6100 50  0001 C CNN
	1    8050 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5F099C33
P 8500 6100
F 0 "C12" H 8650 6100 50  0000 L CNN
F 1 "C" H 8650 6000 50  0000 L CNN
F 2 "" H 8538 5950 50  0001 C CNN
F 3 "~" H 8500 6100 50  0001 C CNN
	1    8500 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 5900 8500 5900
Wire Wire Line
	8500 5900 8500 5950
Wire Wire Line
	8050 6250 8050 6300
Wire Wire Line
	8050 6300 8500 6300
Wire Wire Line
	8500 6300 8500 6250
Wire Wire Line
	9050 6100 9050 6300
Wire Wire Line
	9050 6300 8500 6300
Connection ~ 8500 6300
$Comp
L Device:R R19
U 1 1 5F099C59
P 8750 7300
F 0 "R19" H 8500 7350 50  0000 L CNN
F 1 "10k" H 8500 7250 50  0000 L CNN
F 2 "" V 8680 7300 50  0001 C CNN
F 3 "~" H 8750 7300 50  0001 C CNN
	1    8750 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 6850 8750 6850
Wire Wire Line
	8750 6850 8750 7150
$Comp
L Device:R_POT_TRIM_US RV6
U 1 1 5F099C65
P 9250 6450
F 0 "RV6" V 9150 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 9182 6405 50  0001 R CNN
F 2 "" H 9250 6450 50  0001 C CNN
F 3 "~" H 9250 6450 50  0001 C CNN
	1    9250 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R18
U 1 1 5F099C6B
P 8750 6450
F 0 "R18" V 8650 6400 50  0000 L CNN
F 1 "100k" V 8550 6350 50  0000 L CNN
F 2 "" V 8680 6450 50  0001 C CNN
F 3 "~" H 8750 6450 50  0001 C CNN
	1    8750 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U6
U 1 1 5F099C7A
P 9050 5700
F 0 "U6" H 9150 6000 60  0000 C CNN
F 1 "555" H 9350 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 9250 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 9250 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 9250 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 9250 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 9250 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 9250 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 9250 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 9250 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 9250 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 9250 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9250 6900 60  0001 L CNN "Status"
	1    9050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5800 8050 5950
Connection ~ 8050 5800
Wire Wire Line
	8900 6450 9100 6450
Wire Wire Line
	8050 5700 8050 5800
Wire Wire Line
	8050 5800 7850 5800
Wire Wire Line
	7850 5800 7850 6450
Wire Wire Line
	7850 6450 8600 6450
Wire Wire Line
	9400 6450 9450 6450
Connection ~ 9600 6450
Wire Wire Line
	9600 6450 9600 6850
Wire Wire Line
	9600 5800 9600 6450
Wire Wire Line
	9250 6300 9250 6250
Wire Wire Line
	9250 6250 9450 6250
Wire Wire Line
	9450 6250 9450 6450
Connection ~ 9450 6450
Wire Wire Line
	9450 6450 9600 6450
Wire Wire Line
	11000 5200 10450 5200
Wire Wire Line
	10450 5200 10450 5600
Wire Wire Line
	10450 5600 10500 5600
Wire Wire Line
	11000 5200 11000 5400
Wire Wire Line
	10500 5800 10000 5800
Wire Wire Line
	11500 5800 11550 5800
$Comp
L Device:R R22
U 1 1 5F099C96
P 10000 5400
F 0 "R22" H 10100 5350 50  0000 L CNN
F 1 "100k" H 10100 5250 50  0000 L CNN
F 2 "" V 9930 5400 50  0001 C CNN
F 3 "~" H 10000 5400 50  0001 C CNN
	1    10000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 5200 10350 5200
Wire Wire Line
	10000 5200 10000 5250
Connection ~ 10450 5200
Wire Wire Line
	10000 5550 10000 5700
Wire Wire Line
	10500 5700 10000 5700
Connection ~ 10000 5700
$Comp
L Device:C C15
U 1 1 5F099CA2
P 10000 6100
F 0 "C15" H 10150 6100 50  0000 L CNN
F 1 "C" H 10150 6000 50  0000 L CNN
F 2 "" H 10038 5950 50  0001 C CNN
F 3 "~" H 10000 6100 50  0001 C CNN
	1    10000 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5F099CA8
P 10450 6100
F 0 "C16" H 10600 6100 50  0000 L CNN
F 1 "C" H 10600 6000 50  0000 L CNN
F 2 "" H 10488 5950 50  0001 C CNN
F 3 "~" H 10450 6100 50  0001 C CNN
	1    10450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5900 10450 5900
Wire Wire Line
	10450 5900 10450 5950
Wire Wire Line
	10000 6250 10000 6300
Wire Wire Line
	10000 6300 10450 6300
Wire Wire Line
	10450 6300 10450 6250
Wire Wire Line
	11000 6100 11000 6300
Wire Wire Line
	11000 6300 10450 6300
Connection ~ 10450 6300
$Comp
L Device:R R25
U 1 1 5F099CCE
P 10750 7300
F 0 "R25" H 10500 7350 50  0000 L CNN
F 1 "10k" H 10500 7250 50  0000 L CNN
F 2 "" V 10680 7300 50  0001 C CNN
F 3 "~" H 10750 7300 50  0001 C CNN
	1    10750 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 6850 10750 6850
Wire Wire Line
	10750 6850 10750 7150
$Comp
L Device:R_POT_TRIM_US RV8
U 1 1 5F099CD9
P 11200 6450
F 0 "RV8" V 11100 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 11132 6405 50  0001 R CNN
F 2 "" H 11200 6450 50  0001 C CNN
F 3 "~" H 11200 6450 50  0001 C CNN
	1    11200 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R24
U 1 1 5F099CDF
P 10700 6450
F 0 "R24" V 10600 6400 50  0000 L CNN
F 1 "100k" V 10500 6350 50  0000 L CNN
F 2 "" V 10630 6450 50  0001 C CNN
F 3 "~" H 10700 6450 50  0001 C CNN
	1    10700 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U8
U 1 1 5F099CEE
P 11000 5700
F 0 "U8" H 11100 6000 60  0000 C CNN
F 1 "555" H 11300 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 11200 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 11200 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 11200 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 11200 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 11200 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 11200 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 11200 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 11200 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 11200 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 11200 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11200 6900 60  0001 L CNN "Status"
	1    11000 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5800 10000 5950
Connection ~ 10000 5800
Wire Wire Line
	10850 6450 11050 6450
Wire Wire Line
	10000 5700 10000 5800
Wire Wire Line
	10000 5800 9800 5800
Wire Wire Line
	9800 5800 9800 6450
Wire Wire Line
	9800 6450 10550 6450
Wire Wire Line
	11350 6450 11400 6450
Connection ~ 11550 6450
Wire Wire Line
	11550 6450 11550 6850
Wire Wire Line
	11550 5800 11550 6450
Wire Wire Line
	11200 6300 11200 6250
Wire Wire Line
	11200 6250 11400 6250
Wire Wire Line
	11400 6250 11400 6450
Connection ~ 11400 6450
Wire Wire Line
	11400 6450 11550 6450
Wire Wire Line
	12950 5200 12400 5200
Wire Wire Line
	12400 5200 12400 5600
Wire Wire Line
	12400 5600 12450 5600
Wire Wire Line
	12950 5200 12950 5400
Wire Wire Line
	12450 5800 11950 5800
Wire Wire Line
	13450 5800 13500 5800
$Comp
L Device:R R28
U 1 1 5F099D0B
P 11950 5400
F 0 "R28" H 12050 5350 50  0000 L CNN
F 1 "100k" H 12050 5250 50  0000 L CNN
F 2 "" V 11880 5400 50  0001 C CNN
F 3 "~" H 11950 5400 50  0001 C CNN
	1    11950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	12400 5200 12300 5200
Wire Wire Line
	11950 5200 11950 5250
Connection ~ 12400 5200
Wire Wire Line
	11950 5550 11950 5700
Wire Wire Line
	12450 5700 11950 5700
Connection ~ 11950 5700
$Comp
L Device:C C19
U 1 1 5F099D17
P 11950 6100
F 0 "C19" H 12100 6100 50  0000 L CNN
F 1 "C" H 12100 6000 50  0000 L CNN
F 2 "" H 11988 5950 50  0001 C CNN
F 3 "~" H 11950 6100 50  0001 C CNN
	1    11950 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 5F099D1D
P 12400 6100
F 0 "C20" H 12550 6100 50  0000 L CNN
F 1 "C" H 12550 6000 50  0000 L CNN
F 2 "" H 12438 5950 50  0001 C CNN
F 3 "~" H 12400 6100 50  0001 C CNN
	1    12400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 5900 12400 5900
Wire Wire Line
	12400 5900 12400 5950
Wire Wire Line
	11950 6250 11950 6300
Wire Wire Line
	11950 6300 12400 6300
Wire Wire Line
	12400 6300 12400 6250
Wire Wire Line
	12950 6100 12950 6300
Wire Wire Line
	12950 6300 12400 6300
Connection ~ 12400 6300
$Comp
L Device:R R31
U 1 1 5F099D43
P 12650 7300
F 0 "R31" H 12400 7350 50  0000 L CNN
F 1 "10k" H 12400 7250 50  0000 L CNN
F 2 "" V 12580 7300 50  0001 C CNN
F 3 "~" H 12650 7300 50  0001 C CNN
	1    12650 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	13500 6850 12650 6850
Wire Wire Line
	12650 6850 12650 7150
$Comp
L Device:R_POT_TRIM_US RV10
U 1 1 5F099D4E
P 13150 6450
F 0 "RV10" V 13050 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 13082 6405 50  0001 R CNN
F 2 "" H 13150 6450 50  0001 C CNN
F 3 "~" H 13150 6450 50  0001 C CNN
	1    13150 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R30
U 1 1 5F099D54
P 12650 6450
F 0 "R30" V 12550 6400 50  0000 L CNN
F 1 "100k" V 12450 6350 50  0000 L CNN
F 2 "" V 12580 6450 50  0001 C CNN
F 3 "~" H 12650 6450 50  0001 C CNN
	1    12650 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U10
U 1 1 5F099D63
P 12950 5700
F 0 "U10" H 13050 6000 60  0000 C CNN
F 1 "555" H 13250 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 13150 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 13150 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 13150 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 13150 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 13150 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 13150 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 13150 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 13150 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 13150 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 13150 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 13150 6900 60  0001 L CNN "Status"
	1    12950 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 5800 11950 5950
Connection ~ 11950 5800
Wire Wire Line
	12800 6450 13000 6450
Wire Wire Line
	11950 5700 11950 5800
Wire Wire Line
	11950 5800 11750 5800
Wire Wire Line
	11750 5800 11750 6450
Wire Wire Line
	11750 6450 12500 6450
Wire Wire Line
	13300 6450 13350 6450
Connection ~ 13500 6450
Wire Wire Line
	13500 6450 13500 6850
Wire Wire Line
	13500 5800 13500 6450
Wire Wire Line
	13150 6300 13150 6250
Wire Wire Line
	13150 6250 13350 6250
Wire Wire Line
	13350 6250 13350 6450
Connection ~ 13350 6450
Wire Wire Line
	13350 6450 13500 6450
Wire Wire Line
	14900 5200 14350 5200
Wire Wire Line
	14350 5200 14350 5600
Wire Wire Line
	14350 5600 14400 5600
Wire Wire Line
	14900 5200 14900 5400
Wire Wire Line
	14400 5800 13900 5800
Wire Wire Line
	15400 5800 15450 5800
$Comp
L Device:R R34
U 1 1 5F0AFC8F
P 13900 5400
F 0 "R34" H 14000 5350 50  0000 L CNN
F 1 "100k" H 14000 5250 50  0000 L CNN
F 2 "" V 13830 5400 50  0001 C CNN
F 3 "~" H 13900 5400 50  0001 C CNN
	1    13900 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 5200 14250 5200
Wire Wire Line
	13900 5200 13900 5250
Connection ~ 14350 5200
Wire Wire Line
	13900 5550 13900 5700
Wire Wire Line
	14400 5700 13900 5700
Connection ~ 13900 5700
$Comp
L Device:C C23
U 1 1 5F0AFC9B
P 13900 6100
F 0 "C23" H 14050 6100 50  0000 L CNN
F 1 "C" H 14050 6000 50  0000 L CNN
F 2 "" H 13938 5950 50  0001 C CNN
F 3 "~" H 13900 6100 50  0001 C CNN
	1    13900 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 5F0AFCA1
P 14350 6100
F 0 "C24" H 14500 6100 50  0000 L CNN
F 1 "C" H 14500 6000 50  0000 L CNN
F 2 "" H 14388 5950 50  0001 C CNN
F 3 "~" H 14350 6100 50  0001 C CNN
	1    14350 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	14400 5900 14350 5900
Wire Wire Line
	14350 5900 14350 5950
Wire Wire Line
	13900 6250 13900 6300
Wire Wire Line
	13900 6300 14350 6300
Wire Wire Line
	14350 6300 14350 6250
Wire Wire Line
	14900 6100 14900 6300
Wire Wire Line
	14900 6300 14350 6300
Connection ~ 14350 6300
$Comp
L Device:R R36
U 1 1 5F0AFCC7
P 14600 7300
F 0 "R36" H 14350 7350 50  0000 L CNN
F 1 "10k" H 14350 7250 50  0000 L CNN
F 2 "" V 14530 7300 50  0001 C CNN
F 3 "~" H 14600 7300 50  0001 C CNN
	1    14600 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	15450 6850 14600 6850
Wire Wire Line
	14600 6850 14600 7150
$Comp
L Device:R_POT_TRIM_US RV12
U 1 1 5F0AFCD2
P 15100 6450
F 0 "RV12" V 15000 6550 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 15032 6405 50  0001 R CNN
F 2 "" H 15100 6450 50  0001 C CNN
F 3 "~" H 15100 6450 50  0001 C CNN
	1    15100 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R35
U 1 1 5F0AFCD8
P 14600 6450
F 0 "R35" V 14500 6400 50  0000 L CNN
F 1 "100k" V 14400 6350 50  0000 L CNN
F 2 "" V 14530 6450 50  0001 C CNN
F 3 "~" H 14600 6450 50  0001 C CNN
	1    14600 6450
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U12
U 1 1 5F0AFCE7
P 14900 5700
F 0 "U12" H 15000 6000 60  0000 C CNN
F 1 "555" H 15200 6000 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 15100 5900 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 15100 6000 60  0001 L CNN
F 4 "296-1411-5-ND" H 15100 6100 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 15100 6200 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 15100 6300 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 15100 6400 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 15100 6500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 15100 6600 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 15100 6700 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 15100 6800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 15100 6900 60  0001 L CNN "Status"
	1    14900 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13900 5800 13900 5950
Connection ~ 13900 5800
Wire Wire Line
	14750 6450 14950 6450
Wire Wire Line
	13900 5700 13900 5800
Wire Wire Line
	13900 5800 13700 5800
Wire Wire Line
	13700 5800 13700 6450
Wire Wire Line
	13700 6450 14450 6450
Wire Wire Line
	15250 6450 15300 6450
Connection ~ 15450 6450
Wire Wire Line
	15450 6450 15450 6850
Wire Wire Line
	15450 5800 15450 6450
Wire Wire Line
	15100 6300 15100 6250
Wire Wire Line
	15100 6250 15300 6250
Wire Wire Line
	15300 6250 15300 6450
Connection ~ 15300 6450
Wire Wire Line
	15300 6450 15450 6450
Wire Wire Line
	3850 3350 3300 3350
Wire Wire Line
	3300 3350 3300 3750
Wire Wire Line
	3300 3750 3350 3750
Wire Wire Line
	3850 3350 3850 3550
Wire Wire Line
	3350 3950 2850 3950
Wire Wire Line
	4350 3950 4400 3950
$Comp
L Device:R R2
U 1 1 5F2530D5
P 2850 3550
F 0 "R2" H 2950 3500 50  0000 L CNN
F 1 "100k" H 2950 3400 50  0000 L CNN
F 2 "" V 2780 3550 50  0001 C CNN
F 3 "~" H 2850 3550 50  0001 C CNN
	1    2850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3350 2850 3350
Wire Wire Line
	2850 3350 2850 3400
Connection ~ 3300 3350
Wire Wire Line
	2850 3700 2850 3850
Wire Wire Line
	3350 3850 2850 3850
Connection ~ 2850 3850
$Comp
L Device:C C3
U 1 1 5F2530E1
P 2850 4250
F 0 "C3" H 3000 4250 50  0000 L CNN
F 1 "C" H 3000 4150 50  0000 L CNN
F 2 "" H 2888 4100 50  0001 C CNN
F 3 "~" H 2850 4250 50  0001 C CNN
	1    2850 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5F2530E7
P 3300 4250
F 0 "C4" H 3450 4250 50  0000 L CNN
F 1 "10nF" H 3450 4150 50  0000 L CNN
F 2 "" H 3338 4100 50  0001 C CNN
F 3 "~" H 3300 4250 50  0001 C CNN
	1    3300 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4050 3300 4050
Wire Wire Line
	3300 4050 3300 4100
Wire Wire Line
	2850 4400 2850 4450
Wire Wire Line
	2850 4450 3300 4450
Wire Wire Line
	3300 4450 3300 4400
Wire Wire Line
	3850 4250 3850 4450
Wire Wire Line
	3850 4450 3300 4450
Connection ~ 3300 4450
$Comp
L dk_Tactile-Switches:FSM4JSMATR S2
U 1 1 5F2530FE
P 3750 2700
F 0 "S2" V 3750 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 3950 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 3900 60  0001 L CNN "Status"
	1    3750 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 2900 3850 2950
Connection ~ 3850 3350
Wire Wire Line
	3650 2900 3650 2950
Wire Wire Line
	3650 2950 3850 2950
Connection ~ 3850 2950
Wire Wire Line
	3850 2950 3850 3350
Wire Wire Line
	3650 2500 3650 2400
Wire Wire Line
	3650 2400 3850 2400
Wire Wire Line
	3850 2400 3850 2500
$Comp
L Device:R R6
U 1 1 5F25310D
P 3850 7300
F 0 "R6" H 3600 7350 50  0000 L CNN
F 1 "10k" H 3600 7250 50  0000 L CNN
F 2 "" V 3780 7300 50  0001 C CNN
F 3 "~" H 3850 7300 50  0001 C CNN
	1    3850 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4850 3850 4850
Wire Wire Line
	3850 4850 3850 7150
$Comp
L Device:R_POT_TRIM_US RV2
U 1 1 5F253118
P 4050 4600
F 0 "RV2" V 3950 4700 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 3982 4555 50  0001 R CNN
F 2 "" H 4050 4600 50  0001 C CNN
F 3 "~" H 4050 4600 50  0001 C CNN
	1    4050 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F25311E
P 3550 4600
F 0 "R5" V 3450 4550 50  0000 L CNN
F 1 "100k" V 3350 4500 50  0000 L CNN
F 2 "" V 3480 4600 50  0001 C CNN
F 3 "~" H 3550 4600 50  0001 C CNN
	1    3550 4600
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U2
U 1 1 5F25312D
P 3850 3850
F 0 "U2" H 3950 4150 60  0000 C CNN
F 1 "555" H 4150 4150 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 4050 4050 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 4050 4150 60  0001 L CNN
F 4 "296-1411-5-ND" H 4050 4250 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 4050 4350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 4050 4450 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 4050 4550 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 4050 4650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 4050 4750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 4050 4850 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 4050 4950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4050 5050 60  0001 L CNN "Status"
	1    3850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3950 2850 4100
Connection ~ 2850 3950
Wire Wire Line
	3700 4600 3900 4600
Wire Wire Line
	2850 3850 2850 3950
Wire Wire Line
	2850 3950 2650 3950
Wire Wire Line
	2650 3950 2650 4600
Wire Wire Line
	2650 4600 3400 4600
Wire Wire Line
	4200 4600 4250 4600
Connection ~ 4400 4600
Wire Wire Line
	4400 4600 4400 4850
Wire Wire Line
	4400 3950 4400 4600
Wire Wire Line
	4050 4450 4050 4400
Wire Wire Line
	4050 4400 4250 4400
Wire Wire Line
	4250 4400 4250 4600
Connection ~ 4250 4600
Wire Wire Line
	4250 4600 4400 4600
Wire Wire Line
	5800 3350 5250 3350
Wire Wire Line
	5250 3350 5250 3750
Wire Wire Line
	5250 3750 5300 3750
Wire Wire Line
	5800 3350 5800 3550
Wire Wire Line
	5300 3950 4800 3950
Wire Wire Line
	6300 3950 6350 3950
$Comp
L Device:R R8
U 1 1 5F253149
P 4800 3550
F 0 "R8" H 4900 3500 50  0000 L CNN
F 1 "100k" H 4900 3400 50  0000 L CNN
F 2 "" V 4730 3550 50  0001 C CNN
F 3 "~" H 4800 3550 50  0001 C CNN
	1    4800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3350 4800 3350
Wire Wire Line
	4800 3350 4800 3400
Connection ~ 5250 3350
Wire Wire Line
	4800 3700 4800 3850
Wire Wire Line
	5300 3850 4800 3850
Connection ~ 4800 3850
$Comp
L Device:C C7
U 1 1 5F253155
P 4800 4250
F 0 "C7" H 4950 4250 50  0000 L CNN
F 1 "C" H 4950 4150 50  0000 L CNN
F 2 "" H 4838 4100 50  0001 C CNN
F 3 "~" H 4800 4250 50  0001 C CNN
	1    4800 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5F25315B
P 5250 4250
F 0 "C8" H 5400 4250 50  0000 L CNN
F 1 "C" H 5400 4150 50  0000 L CNN
F 2 "" H 5288 4100 50  0001 C CNN
F 3 "~" H 5250 4250 50  0001 C CNN
	1    5250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4050 5250 4050
Wire Wire Line
	5250 4050 5250 4100
Wire Wire Line
	4800 4400 4800 4450
Wire Wire Line
	4800 4450 5250 4450
Wire Wire Line
	5250 4450 5250 4400
Wire Wire Line
	5800 4250 5800 4450
Wire Wire Line
	5800 4450 5250 4450
Connection ~ 5250 4450
$Comp
L dk_Tactile-Switches:FSM4JSMATR S4
U 1 1 5F253172
P 5700 2700
F 0 "S4" V 5700 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 5700 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 5900 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 5900 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 5900 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 5900 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 5900 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 5900 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 5900 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 5900 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 5900 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 5900 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5900 3900 60  0001 L CNN "Status"
	1    5700 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 2900 5800 2950
Connection ~ 5800 3350
Wire Wire Line
	5600 2900 5600 2950
Wire Wire Line
	5600 2950 5800 2950
Connection ~ 5800 2950
Wire Wire Line
	5800 2950 5800 3350
Wire Wire Line
	5600 2500 5600 2400
Wire Wire Line
	5600 2400 5800 2400
Wire Wire Line
	5800 2400 5800 2500
$Comp
L Device:R R12
U 1 1 5F253181
P 5800 7300
F 0 "R12" H 5550 7350 50  0000 L CNN
F 1 "10k" H 5550 7250 50  0000 L CNN
F 2 "" V 5730 7300 50  0001 C CNN
F 3 "~" H 5800 7300 50  0001 C CNN
	1    5800 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4850 5800 4850
Wire Wire Line
	5800 4850 5800 7150
$Comp
L Device:R_POT_TRIM_US RV4
U 1 1 5F25318C
P 6000 4600
F 0 "RV4" V 5900 4700 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 5932 4555 50  0001 R CNN
F 2 "" H 6000 4600 50  0001 C CNN
F 3 "~" H 6000 4600 50  0001 C CNN
	1    6000 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 5F253192
P 5500 4600
F 0 "R11" V 5400 4550 50  0000 L CNN
F 1 "100k" V 5300 4500 50  0000 L CNN
F 2 "" V 5430 4600 50  0001 C CNN
F 3 "~" H 5500 4600 50  0001 C CNN
	1    5500 4600
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U4
U 1 1 5F2531A1
P 5800 3850
F 0 "U4" H 5900 4150 60  0000 C CNN
F 1 "555" H 6100 4150 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 6000 4050 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 6000 4150 60  0001 L CNN
F 4 "296-1411-5-ND" H 6000 4250 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 6000 4350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 6000 4450 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 6000 4550 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 6000 4650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 6000 4750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 6000 4850 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 6000 4950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6000 5050 60  0001 L CNN "Status"
	1    5800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3950 4800 4100
Connection ~ 4800 3950
Wire Wire Line
	5650 4600 5850 4600
Wire Wire Line
	4800 3850 4800 3950
Wire Wire Line
	4800 3950 4600 3950
Wire Wire Line
	4600 3950 4600 4600
Wire Wire Line
	4600 4600 5350 4600
Wire Wire Line
	6150 4600 6200 4600
Connection ~ 6350 4600
Wire Wire Line
	6350 4600 6350 4850
Wire Wire Line
	6350 3950 6350 4600
Wire Wire Line
	6000 4450 6000 4400
Wire Wire Line
	6000 4400 6200 4400
Wire Wire Line
	6200 4400 6200 4600
Connection ~ 6200 4600
Wire Wire Line
	6200 4600 6350 4600
Wire Wire Line
	9700 3350 9150 3350
Wire Wire Line
	9150 3350 9150 3750
Wire Wire Line
	9150 3750 9200 3750
Wire Wire Line
	9700 3350 9700 3550
Wire Wire Line
	9200 3950 8700 3950
Wire Wire Line
	10200 3950 10250 3950
$Comp
L Device:R R17
U 1 1 5F253231
P 8700 3550
F 0 "R17" H 8800 3500 50  0000 L CNN
F 1 "100k" H 8800 3400 50  0000 L CNN
F 2 "" V 8630 3550 50  0001 C CNN
F 3 "~" H 8700 3550 50  0001 C CNN
	1    8700 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3350 8700 3350
Wire Wire Line
	8700 3350 8700 3400
Connection ~ 9150 3350
Wire Wire Line
	8700 3700 8700 3850
Wire Wire Line
	9200 3850 8700 3850
Connection ~ 8700 3850
$Comp
L Device:C C13
U 1 1 5F25323D
P 8700 4250
F 0 "C13" H 8850 4250 50  0000 L CNN
F 1 "C" H 8850 4150 50  0000 L CNN
F 2 "" H 8738 4100 50  0001 C CNN
F 3 "~" H 8700 4250 50  0001 C CNN
	1    8700 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5F253243
P 9150 4250
F 0 "C14" H 9300 4250 50  0000 L CNN
F 1 "C" H 9300 4150 50  0000 L CNN
F 2 "" H 9188 4100 50  0001 C CNN
F 3 "~" H 9150 4250 50  0001 C CNN
	1    9150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4050 9150 4050
Wire Wire Line
	9150 4050 9150 4100
Wire Wire Line
	8700 4400 8700 4450
Wire Wire Line
	8700 4450 9150 4450
Wire Wire Line
	9150 4450 9150 4400
Wire Wire Line
	9700 4250 9700 4450
Wire Wire Line
	9700 4450 9150 4450
Connection ~ 9150 4450
$Comp
L dk_Tactile-Switches:FSM4JSMATR S7
U 1 1 5F25325A
P 9600 2700
F 0 "S7" V 9600 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 9600 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 9800 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 9800 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 9800 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 9800 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 9800 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 9800 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 9800 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 9800 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 9800 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 9800 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9800 3900 60  0001 L CNN "Status"
	1    9600 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 2900 9700 2950
Connection ~ 9700 3350
Wire Wire Line
	9500 2900 9500 2950
Wire Wire Line
	9500 2950 9700 2950
Connection ~ 9700 2950
Wire Wire Line
	9700 2950 9700 3350
Wire Wire Line
	9500 2500 9500 2400
Wire Wire Line
	9500 2400 9700 2400
Wire Wire Line
	9700 2400 9700 2500
$Comp
L Device:R R21
U 1 1 5F253269
P 9700 7250
F 0 "R21" H 9450 7300 50  0000 L CNN
F 1 "10k" H 9450 7200 50  0000 L CNN
F 2 "" V 9630 7250 50  0001 C CNN
F 3 "~" H 9700 7250 50  0001 C CNN
	1    9700 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4850 9700 4850
Wire Wire Line
	9700 4850 9700 7100
$Comp
L Device:R_POT_TRIM_US RV7
U 1 1 5F253274
P 9900 4600
F 0 "RV7" V 9800 4700 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 9832 4555 50  0001 R CNN
F 2 "" H 9900 4600 50  0001 C CNN
F 3 "~" H 9900 4600 50  0001 C CNN
	1    9900 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R20
U 1 1 5F25327A
P 9400 4600
F 0 "R20" V 9300 4550 50  0000 L CNN
F 1 "100k" V 9200 4500 50  0000 L CNN
F 2 "" V 9330 4600 50  0001 C CNN
F 3 "~" H 9400 4600 50  0001 C CNN
	1    9400 4600
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U7
U 1 1 5F253289
P 9700 3850
F 0 "U7" H 9800 4150 60  0000 C CNN
F 1 "555" H 10000 4150 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 9900 4050 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 9900 4150 60  0001 L CNN
F 4 "296-1411-5-ND" H 9900 4250 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 9900 4350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 9900 4450 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 9900 4550 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 9900 4650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 9900 4750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 9900 4850 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 9900 4950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9900 5050 60  0001 L CNN "Status"
	1    9700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3950 8700 4100
Connection ~ 8700 3950
Wire Wire Line
	9550 4600 9750 4600
Wire Wire Line
	8700 3850 8700 3950
Wire Wire Line
	8700 3950 8500 3950
Wire Wire Line
	8500 3950 8500 4600
Wire Wire Line
	8500 4600 9250 4600
Wire Wire Line
	10050 4600 10100 4600
Connection ~ 10250 4600
Wire Wire Line
	10250 4600 10250 4850
Wire Wire Line
	10250 3950 10250 4600
Wire Wire Line
	9900 4450 9900 4400
Wire Wire Line
	9900 4400 10100 4400
Wire Wire Line
	10100 4400 10100 4600
Connection ~ 10100 4600
Wire Wire Line
	10100 4600 10250 4600
Wire Wire Line
	11650 3350 11100 3350
Wire Wire Line
	11100 3350 11100 3750
Wire Wire Line
	11100 3750 11150 3750
Wire Wire Line
	11650 3350 11650 3550
Wire Wire Line
	11150 3950 10650 3950
Wire Wire Line
	12150 3950 12200 3950
$Comp
L Device:R R23
U 1 1 5F2532A5
P 10650 3550
F 0 "R23" H 10750 3500 50  0000 L CNN
F 1 "100k" H 10750 3400 50  0000 L CNN
F 2 "" V 10580 3550 50  0001 C CNN
F 3 "~" H 10650 3550 50  0001 C CNN
	1    10650 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	11100 3350 10650 3350
Wire Wire Line
	10650 3350 10650 3400
Connection ~ 11100 3350
Wire Wire Line
	10650 3700 10650 3850
Wire Wire Line
	11150 3850 10650 3850
Connection ~ 10650 3850
$Comp
L Device:C C17
U 1 1 5F2532B1
P 10650 4250
F 0 "C17" H 10800 4250 50  0000 L CNN
F 1 "C" H 10800 4150 50  0000 L CNN
F 2 "" H 10688 4100 50  0001 C CNN
F 3 "~" H 10650 4250 50  0001 C CNN
	1    10650 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5F2532B7
P 11100 4250
F 0 "C18" H 11250 4250 50  0000 L CNN
F 1 "C" H 11250 4150 50  0000 L CNN
F 2 "" H 11138 4100 50  0001 C CNN
F 3 "~" H 11100 4250 50  0001 C CNN
	1    11100 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 4050 11100 4050
Wire Wire Line
	11100 4050 11100 4100
Wire Wire Line
	10650 4400 10650 4450
Wire Wire Line
	10650 4450 11100 4450
Wire Wire Line
	11100 4450 11100 4400
Wire Wire Line
	11650 4250 11650 4450
Wire Wire Line
	11650 4450 11100 4450
Connection ~ 11100 4450
$Comp
L dk_Tactile-Switches:FSM4JSMATR S9
U 1 1 5F2532CE
P 11550 2700
F 0 "S9" V 11550 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 11550 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 11750 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 11750 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 11750 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 11750 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 11750 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 11750 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 11750 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 11750 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 11750 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 11750 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11750 3900 60  0001 L CNN "Status"
	1    11550 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	11650 2900 11650 2950
Connection ~ 11650 3350
Wire Wire Line
	11450 2900 11450 2950
Wire Wire Line
	11450 2950 11650 2950
Connection ~ 11650 2950
Wire Wire Line
	11650 2950 11650 3350
Wire Wire Line
	11450 2500 11450 2400
Wire Wire Line
	11450 2400 11650 2400
Wire Wire Line
	11650 2400 11650 2500
$Comp
L Device:R R27
U 1 1 5F2532DD
P 11650 7300
F 0 "R27" H 11400 7350 50  0000 L CNN
F 1 "10k" H 11400 7250 50  0000 L CNN
F 2 "" V 11580 7300 50  0001 C CNN
F 3 "~" H 11650 7300 50  0001 C CNN
	1    11650 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	12200 4850 11650 4850
Wire Wire Line
	11650 4850 11650 7150
$Comp
L Device:R_POT_TRIM_US RV9
U 1 1 5F2532E8
P 11850 4600
F 0 "RV9" V 11750 4700 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 11782 4555 50  0001 R CNN
F 2 "" H 11850 4600 50  0001 C CNN
F 3 "~" H 11850 4600 50  0001 C CNN
	1    11850 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R26
U 1 1 5F2532EE
P 11350 4600
F 0 "R26" V 11250 4550 50  0000 L CNN
F 1 "100k" V 11150 4500 50  0000 L CNN
F 2 "" V 11280 4600 50  0001 C CNN
F 3 "~" H 11350 4600 50  0001 C CNN
	1    11350 4600
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U9
U 1 1 5F2532FD
P 11650 3850
F 0 "U9" H 11750 4150 60  0000 C CNN
F 1 "555" H 11950 4150 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 11850 4050 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 11850 4150 60  0001 L CNN
F 4 "296-1411-5-ND" H 11850 4250 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 11850 4350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 11850 4450 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 11850 4550 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 11850 4650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 11850 4750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 11850 4850 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 11850 4950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11850 5050 60  0001 L CNN "Status"
	1    11650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 3950 10650 4100
Connection ~ 10650 3950
Wire Wire Line
	11500 4600 11700 4600
Wire Wire Line
	10650 3850 10650 3950
Wire Wire Line
	10650 3950 10450 3950
Wire Wire Line
	10450 3950 10450 4600
Wire Wire Line
	10450 4600 11200 4600
Wire Wire Line
	12000 4600 12050 4600
Connection ~ 12200 4600
Wire Wire Line
	12200 4600 12200 4850
Wire Wire Line
	12200 3950 12200 4600
Wire Wire Line
	11850 4450 11850 4400
Wire Wire Line
	11850 4400 12050 4400
Wire Wire Line
	12050 4400 12050 4600
Connection ~ 12050 4600
Wire Wire Line
	12050 4600 12200 4600
Wire Wire Line
	13600 3350 13050 3350
Wire Wire Line
	13050 3350 13050 3750
Wire Wire Line
	13050 3750 13100 3750
Wire Wire Line
	13600 3350 13600 3550
Wire Wire Line
	13100 3950 12600 3950
Wire Wire Line
	14100 3950 14150 3950
$Comp
L Device:R R29
U 1 1 5F253319
P 12600 3550
F 0 "R29" H 12700 3500 50  0000 L CNN
F 1 "100k" H 12700 3400 50  0000 L CNN
F 2 "" V 12530 3550 50  0001 C CNN
F 3 "~" H 12600 3550 50  0001 C CNN
	1    12600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	13050 3350 12600 3350
Wire Wire Line
	12600 3350 12600 3400
Connection ~ 13050 3350
Wire Wire Line
	12600 3700 12600 3850
Wire Wire Line
	13100 3850 12600 3850
Connection ~ 12600 3850
$Comp
L Device:C C21
U 1 1 5F253325
P 12600 4250
F 0 "C21" H 12750 4250 50  0000 L CNN
F 1 "C" H 12750 4150 50  0000 L CNN
F 2 "" H 12638 4100 50  0001 C CNN
F 3 "~" H 12600 4250 50  0001 C CNN
	1    12600 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 5F25332B
P 13050 4250
F 0 "C22" H 13200 4250 50  0000 L CNN
F 1 "C" H 13200 4150 50  0000 L CNN
F 2 "" H 13088 4100 50  0001 C CNN
F 3 "~" H 13050 4250 50  0001 C CNN
	1    13050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 4050 13050 4050
Wire Wire Line
	13050 4050 13050 4100
Wire Wire Line
	12600 4400 12600 4450
Wire Wire Line
	12600 4450 13050 4450
Wire Wire Line
	13050 4450 13050 4400
Wire Wire Line
	13600 4250 13600 4450
Wire Wire Line
	13600 4450 13050 4450
Connection ~ 13050 4450
$Comp
L dk_Tactile-Switches:FSM4JSMATR S11
U 1 1 5F253342
P 13500 2700
F 0 "S11" V 13500 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 13500 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 13700 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 13700 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 13700 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 13700 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 13700 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 13700 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 13700 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 13700 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 13700 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 13700 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 13700 3900 60  0001 L CNN "Status"
	1    13500 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	13600 2900 13600 2950
Connection ~ 13600 3350
Wire Wire Line
	13400 2900 13400 2950
Wire Wire Line
	13400 2950 13600 2950
Connection ~ 13600 2950
Wire Wire Line
	13600 2950 13600 3350
Wire Wire Line
	13400 2500 13400 2400
Wire Wire Line
	13400 2400 13600 2400
Wire Wire Line
	13600 2400 13600 2500
$Comp
L Device:R R33
U 1 1 5F253351
P 13600 7300
F 0 "R33" H 13350 7350 50  0000 L CNN
F 1 "10k" H 13350 7250 50  0000 L CNN
F 2 "" V 13530 7300 50  0001 C CNN
F 3 "~" H 13600 7300 50  0001 C CNN
	1    13600 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 4850 13600 4850
Wire Wire Line
	13600 4850 13600 7150
$Comp
L Device:R_POT_TRIM_US RV11
U 1 1 5F25335C
P 13800 4600
F 0 "RV11" V 13700 4700 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 13732 4555 50  0001 R CNN
F 2 "" H 13800 4600 50  0001 C CNN
F 3 "~" H 13800 4600 50  0001 C CNN
	1    13800 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R32
U 1 1 5F253362
P 13300 4600
F 0 "R32" V 13200 4550 50  0000 L CNN
F 1 "100k" V 13100 4500 50  0000 L CNN
F 2 "" V 13230 4600 50  0001 C CNN
F 3 "~" H 13300 4600 50  0001 C CNN
	1    13300 4600
	0    -1   -1   0   
$EndComp
$Comp
L dk_Clock-Timing-Programmable-Timers-and-Oscillators:NE555P U11
U 1 1 5F253371
P 13600 3850
F 0 "U11" H 13700 4150 60  0000 C CNN
F 1 "555" H 13900 4150 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 13800 4050 60  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 13800 4150 60  0001 L CNN
F 4 "296-1411-5-ND" H 13800 4250 60  0001 L CNN "Digi-Key_PN"
F 5 "NE555P" H 13800 4350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 13800 4450 60  0001 L CNN "Category"
F 7 "Clock/Timing - Programmable Timers and Oscillators" H 13800 4550 60  0001 L CNN "Family"
F 8 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fne555" H 13800 4650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/NE555P/296-1411-5-ND/277057" H 13800 4750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC OSC SINGLE TIMER 100KHZ 8-DIP" H 13800 4850 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 13800 4950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 13800 5050 60  0001 L CNN "Status"
	1    13600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 3950 12600 4100
Connection ~ 12600 3950
Wire Wire Line
	13450 4600 13650 4600
Wire Wire Line
	12600 3850 12600 3950
Wire Wire Line
	12600 3950 12400 3950
Wire Wire Line
	12400 3950 12400 4600
Wire Wire Line
	12400 4600 13150 4600
Wire Wire Line
	13950 4600 14000 4600
Connection ~ 14150 4600
Wire Wire Line
	14150 4600 14150 4850
Wire Wire Line
	14150 3950 14150 4600
Wire Wire Line
	13800 4450 13800 4400
Wire Wire Line
	13800 4400 14000 4400
Wire Wire Line
	14000 4400 14000 4600
Connection ~ 14000 4600
Wire Wire Line
	14000 4600 14150 4600
Wire Wire Line
	14650 2400 14650 2500
Wire Wire Line
	14450 2400 14650 2400
Wire Wire Line
	14450 2500 14450 2400
Wire Wire Line
	14450 2950 14650 2950
Wire Wire Line
	14450 2900 14450 2950
Wire Wire Line
	14650 2900 14650 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S12
U 1 1 5F0AFCB8
P 14550 2700
F 0 "S12" V 14550 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 14550 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 14750 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 14750 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 14750 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 14750 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 14750 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 14750 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 14750 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 14750 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 14750 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 14750 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 14750 3900 60  0001 L CNN "Status"
	1    14550 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	12700 2400 12700 2500
Wire Wire Line
	12500 2400 12700 2400
Wire Wire Line
	12500 2500 12500 2400
Wire Wire Line
	12500 2950 12700 2950
Wire Wire Line
	12500 2900 12500 2950
Wire Wire Line
	12700 2900 12700 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S10
U 1 1 5F099D34
P 12600 2700
F 0 "S10" V 12600 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 12600 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 12800 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 12800 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 12800 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 12800 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 12800 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 12800 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 12800 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 12800 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 12800 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 12800 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12800 3900 60  0001 L CNN "Status"
	1    12600 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	10750 2400 10750 2500
Wire Wire Line
	10550 2400 10750 2400
Wire Wire Line
	10550 2500 10550 2400
Wire Wire Line
	10550 2950 10750 2950
Wire Wire Line
	10550 2900 10550 2950
Wire Wire Line
	10750 2900 10750 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S8
U 1 1 5F099CBF
P 10650 2700
F 0 "S8" V 10650 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 10650 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 10850 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 10850 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 10850 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 10850 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 10850 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 10850 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 10850 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 10850 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 10850 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 10850 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10850 3900 60  0001 L CNN "Status"
	1    10650 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 2400 8800 2500
Wire Wire Line
	8600 2400 8800 2400
Wire Wire Line
	8600 2500 8600 2400
Wire Wire Line
	8600 2950 8800 2950
Wire Wire Line
	8600 2900 8600 2950
Wire Wire Line
	8800 2900 8800 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S6
U 1 1 5F099C4A
P 8700 2700
F 0 "S6" V 8700 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 8700 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 8900 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 8900 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 8900 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 8900 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 8900 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 8900 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 8900 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 8900 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 8900 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 8900 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8900 3900 60  0001 L CNN "Status"
	1    8700 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 2400 6850 2500
Wire Wire Line
	6650 2400 6850 2400
Wire Wire Line
	6650 2500 6650 2400
Wire Wire Line
	6650 2950 6850 2950
Wire Wire Line
	6650 2900 6650 2950
Wire Wire Line
	6850 2900 6850 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S5
U 1 1 5F03AD97
P 6750 2700
F 0 "S5" V 6750 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 6750 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 6950 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6950 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 6950 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6950 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 6950 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6950 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6950 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6950 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6950 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6950 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6950 3900 60  0001 L CNN "Status"
	1    6750 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 2400 4900 2500
Wire Wire Line
	4700 2400 4900 2400
Wire Wire Line
	4700 2500 4700 2400
Wire Wire Line
	4700 2950 4900 2950
Wire Wire Line
	4700 2900 4700 2950
Wire Wire Line
	4900 2900 4900 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S3
U 1 1 5F030DC5
P 4800 2700
F 0 "S3" V 4800 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 4800 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 5000 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 5000 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 5000 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 5000 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 5000 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 5000 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 5000 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 5000 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 5000 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 5000 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5000 3900 60  0001 L CNN "Status"
	1    4800 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 2400 2950 2500
Wire Wire Line
	2750 2400 2950 2400
Wire Wire Line
	2750 2500 2750 2400
Wire Wire Line
	2750 2950 2950 2950
Wire Wire Line
	2750 2900 2750 2950
Wire Wire Line
	2950 2900 2950 2950
$Comp
L dk_Tactile-Switches:FSM4JSMATR S1
U 1 1 5EF68CCC
P 2850 2700
F 0 "S1" V 2850 2850 60  0000 L CNN
F 1 "FSM4JSMATR" V 2850 2900 60  0001 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 3050 2900 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3050 3000 60  0001 L CNN
F 4 "450-1759-1-ND" H 3050 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3050 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 3050 3300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3050 3400 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3050 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3050 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3050 3700 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3050 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3050 3900 60  0001 L CNN "Status"
	1    2850 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 5200 4500 2950
Wire Wire Line
	4500 2950 4700 2950
Connection ~ 4500 5200
Wire Wire Line
	4500 5200 4150 5200
Connection ~ 4700 2950
Wire Wire Line
	2550 5200 2550 2950
Wire Wire Line
	2550 2950 2750 2950
Connection ~ 2550 5200
Wire Wire Line
	2550 5200 2200 5200
Connection ~ 2750 2950
Wire Wire Line
	6450 5200 6450 2950
Wire Wire Line
	6450 2950 6650 2950
Connection ~ 6450 5200
Wire Wire Line
	6450 5200 6100 5200
Connection ~ 6650 2950
Wire Wire Line
	8400 5200 8400 2950
Wire Wire Line
	8400 2950 8600 2950
Connection ~ 8400 5200
Wire Wire Line
	8400 5200 8050 5200
Connection ~ 8600 2950
Wire Wire Line
	10350 5200 10350 2950
Wire Wire Line
	10350 2950 10550 2950
Connection ~ 10350 5200
Wire Wire Line
	10350 5200 10000 5200
Connection ~ 10550 2950
Wire Wire Line
	12300 5200 12300 2950
Wire Wire Line
	12300 2950 12500 2950
Connection ~ 12300 5200
Wire Wire Line
	12300 5200 11950 5200
Connection ~ 12500 2950
Wire Wire Line
	14250 5200 14250 2950
Wire Wire Line
	14250 2950 14450 2950
Connection ~ 14250 5200
Wire Wire Line
	14250 5200 13900 5200
Connection ~ 14450 2950
Wire Wire Line
	14450 2150 14450 2400
Connection ~ 14450 2400
Wire Wire Line
	2750 2400 2750 2150
Connection ~ 2750 2400
Connection ~ 2750 2150
Wire Wire Line
	2750 2150 3650 2150
Wire Wire Line
	3650 2150 3650 2400
Connection ~ 3650 2150
Wire Wire Line
	3650 2150 4700 2150
Connection ~ 3650 2400
Wire Wire Line
	4700 2400 4700 2150
Connection ~ 4700 2400
Connection ~ 4700 2150
Wire Wire Line
	4700 2150 5600 2150
Wire Wire Line
	5600 2150 5600 2400
Connection ~ 5600 2150
Wire Wire Line
	5600 2150 6650 2150
Connection ~ 5600 2400
Wire Wire Line
	6650 2400 6650 2150
Connection ~ 6650 2400
Connection ~ 6650 2150
Wire Wire Line
	6650 2150 8600 2150
Wire Wire Line
	8600 2400 8600 2150
Connection ~ 8600 2400
Connection ~ 8600 2150
Wire Wire Line
	9500 2400 9500 2150
Wire Wire Line
	8600 2150 9500 2150
Connection ~ 9500 2400
Connection ~ 9500 2150
Wire Wire Line
	9500 2150 10550 2150
Wire Wire Line
	10550 2400 10550 2150
Connection ~ 10550 2400
Connection ~ 10550 2150
Wire Wire Line
	10550 2150 11450 2150
Wire Wire Line
	11450 2400 11450 2150
Connection ~ 11450 2400
Connection ~ 11450 2150
Wire Wire Line
	11450 2150 12500 2150
Wire Wire Line
	12500 2400 12500 2150
Connection ~ 12500 2400
Connection ~ 12500 2150
Wire Wire Line
	12500 2150 13400 2150
Wire Wire Line
	13400 2400 13400 2150
Connection ~ 13400 2400
Connection ~ 13400 2150
Wire Wire Line
	13400 2150 14450 2150
Wire Wire Line
	2900 7450 2900 7900
Wire Wire Line
	2900 7900 3850 7900
Wire Wire Line
	14600 7900 14600 7450
Wire Wire Line
	3850 7450 3850 7900
Connection ~ 3850 7900
Wire Wire Line
	3850 7900 4850 7900
Wire Wire Line
	4850 7450 4850 7900
Connection ~ 4850 7900
Wire Wire Line
	4850 7900 5800 7900
Wire Wire Line
	5800 7450 5800 7900
Connection ~ 5800 7900
Wire Wire Line
	5800 7900 6800 7900
Wire Wire Line
	6800 7450 6800 7900
Connection ~ 6800 7900
Wire Wire Line
	6800 7900 8750 7900
Wire Wire Line
	8750 7450 8750 7900
Connection ~ 8750 7900
Wire Wire Line
	8750 7900 9700 7900
Wire Wire Line
	9700 7400 9700 7900
Connection ~ 9700 7900
Wire Wire Line
	10750 7450 10750 7900
Connection ~ 10750 7900
Wire Wire Line
	10750 7900 11650 7900
Wire Wire Line
	11650 7450 11650 7900
Connection ~ 11650 7900
Wire Wire Line
	11650 7900 12650 7900
Wire Wire Line
	12650 7450 12650 7900
Connection ~ 12650 7900
Wire Wire Line
	12650 7900 13600 7900
Wire Wire Line
	13600 7450 13600 7900
Connection ~ 13600 7900
Wire Wire Line
	13600 7900 14600 7900
$Comp
L dk_Toggle-Switches:100SP1T1B4M2QE S?
U 1 1 605C53E5
P 1450 2700
F 0 "S?" V 1503 2512 60  0000 R CNN
F 1 "100SP1T1B4M2QE" V 1397 2512 60  0000 R CNN
F 2 "digikey-footprints:Toggle_Switch_100SP1T1B4M2QE" H 1650 2900 60  0001 L CNN
F 3 "http://spec_sheets.e-switch.com/specs/T111597.pdf" H 1650 3000 60  0001 L CNN
F 4 "EG2355-ND" H 1650 3100 60  0001 L CNN "Digi-Key_PN"
F 5 "100SP1T1B4M2QE" H 1650 3200 60  0001 L CNN "MPN"
F 6 "Switches" H 1650 3300 60  0001 L CNN "Category"
F 7 "Toggle Switches" H 1650 3400 60  0001 L CNN "Family"
F 8 "http://spec_sheets.e-switch.com/specs/T111597.pdf" H 1650 3500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/e-switch/100SP1T1B4M2QE/EG2355-ND/378824" H 1650 3600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TOGGLE SPDT 5A 120V" H 1650 3700 60  0001 L CNN "Description"
F 11 "E-Switch" H 1650 3800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1650 3900 60  0001 L CNN "Status"
	1    1450 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 2150 1550 2500
Wire Wire Line
	1550 2150 2750 2150
Wire Wire Line
	1450 2900 1450 3200
Wire Wire Line
	1450 3600 1450 6450
Wire Wire Line
	1450 6450 2000 6450
Connection ~ 2000 6450
$Comp
L Device:Speaker LS?
U 1 1 60774F8D
P 10750 9300
F 0 "LS?" H 10920 9296 50  0000 L CNN
F 1 "Speaker" H 10920 9205 50  0000 L CNN
F 2 "" H 10750 9100 50  0001 C CNN
F 3 "~" H 10740 9250 50  0001 C CNN
	1    10750 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 7900 10750 7900
$EndSCHEMATC
