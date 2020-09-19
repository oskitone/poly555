EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 22 22
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
L power:+9V #PWR?
U 1 1 5F474334
P 3150 2600
F 0 "#PWR?" H 3150 2450 50  0001 C CNN
F 1 "+9V" H 3165 2773 50  0000 C CNN
F 2 "" H 3150 2600 50  0001 C CNN
F 3 "" H 3150 2600 50  0001 C CNN
	1    3150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2600 3150 2700
Wire Wire Line
	3150 2700 3500 2700
Wire Wire Line
	4150 2700 4150 3100
Wire Wire Line
	4150 2700 5050 2700
Wire Wire Line
	6600 2700 6600 3100
Connection ~ 4150 2700
$Comp
L Device:R_POT_TRIM_US RV101
U 1 1 5F476D82
P 5050 3200
F 0 "RV101" H 4982 3154 50  0000 R CNN
F 1 "1M" H 4982 3245 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-6-V_Vertical" H 5050 3200 50  0001 C CNN
F 3 "~" H 5050 3200 50  0001 C CNN
	1    5050 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 2700 5050 2950
Wire Wire Line
	5050 2700 5800 2700
Wire Wire Line
	5050 3350 5050 3500
Wire Wire Line
	4900 3200 4850 3200
Wire Wire Line
	4850 3200 4850 2950
Wire Wire Line
	4850 2950 5050 2950
Connection ~ 5050 2950
Wire Wire Line
	5050 2950 5050 3050
Wire Wire Line
	5050 3500 4650 3500
$Comp
L Device:R_US R102
U 1 1 5F47CC96
P 5050 3650
F 0 "R102" H 5118 3696 50  0000 L CNN
F 1 "1k" H 5118 3605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5090 3640 50  0001 C CNN
F 3 "~" H 5050 3650 50  0001 C CNN
	1    5050 3650
	1    0    0    -1  
$EndComp
Connection ~ 5050 3500
Wire Wire Line
	4650 3700 4700 3700
Wire Wire Line
	4650 3300 4650 2550
Wire Wire Line
	4650 2550 6050 2550
Wire Wire Line
	6050 2550 6050 2700
Wire Wire Line
	6050 3300 6100 3300
Wire Wire Line
	7100 3500 7150 3500
Wire Wire Line
	7150 3500 7150 3700
Wire Wire Line
	7150 3700 7100 3700
$Comp
L Device:C_Small C101
U 1 1 5F47FCB1
P 3150 3950
F 0 "C101" H 3242 3996 50  0000 L CNN
F 1 ".01uF" H 3242 3905 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3150 3950 50  0001 C CNN
F 3 "~" H 3150 3950 50  0001 C CNN
	1    3150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4050 3150 5000
Wire Wire Line
	3150 3850 3150 3300
Wire Wire Line
	3650 3700 3500 3700
Wire Wire Line
	3500 3700 3500 2700
Connection ~ 3500 2700
Wire Wire Line
	3500 2700 4150 2700
NoConn ~ 3500 3300
NoConn ~ 4650 2700
NoConn ~ 6050 2700
Connection ~ 6050 2700
Wire Wire Line
	6050 2700 6600 2700
Wire Wire Line
	6050 2700 6050 3300
Connection ~ 5050 2700
$Comp
L Device:C_Small C102
U 1 1 5F489007
P 7700 3950
F 0 "C102" H 7792 3996 50  0000 L CNN
F 1 ".1uF" H 7792 3905 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7700 3950 50  0001 C CNN
F 3 "~" H 7700 3950 50  0001 C CNN
	1    7700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4050 7700 5000
Wire Wire Line
	7150 3700 7700 3700
Wire Wire Line
	7700 3700 7700 3850
Connection ~ 7150 3700
$Comp
L Device:R_POT_TRIM_US RV102
U 1 1 5F48C811
P 7700 3100
F 0 "RV102" H 7600 2800 50  0000 R CNN
F 1 "1M" H 7600 2900 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-6-V_Vertical" H 7700 3100 50  0001 C CNN
F 3 "~" H 7700 3100 50  0001 C CNN
	1    7700 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	7550 3100 7500 3100
Wire Wire Line
	7500 3100 7500 2850
Wire Wire Line
	6600 2700 7700 2700
Wire Wire Line
	7700 2700 7700 2850
Connection ~ 6600 2700
Wire Wire Line
	7700 2850 7500 2850
Connection ~ 7700 2850
Wire Wire Line
	7700 2850 7700 2950
Wire Wire Line
	7700 3250 7700 3700
Connection ~ 7700 3700
$Comp
L Device:Speaker LS101
U 1 1 5F48F5FF
P 9350 2950
F 0 "LS101" H 9520 2946 50  0000 L CNN
F 1 "Speaker" H 9520 2855 50  0000 L CNN
F 2 "custom-footprints:Speaker_30mm_36MS30008-PN" H 9350 2750 50  0001 C CNN
F 3 "~" H 9340 2900 50  0001 C CNN
	1    9350 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C103
U 1 1 5F496041
P 8200 3300
F 0 "C103" V 7945 3300 50  0000 C CNN
F 1 "CP" V 8036 3300 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 8238 3150 50  0001 C CNN
F 3 "~" H 8200 3300 50  0001 C CNN
	1    8200 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 2700 9050 2700
Wire Wire Line
	9050 2700 9050 2950
Wire Wire Line
	9050 2950 9150 2950
Connection ~ 7700 2700
Wire Wire Line
	9150 3050 9050 3050
Wire Wire Line
	9050 3050 9050 3300
Wire Wire Line
	8050 3300 7100 3300
NoConn ~ 7700 3300
$Comp
L Device:R_POT_TRIM_US RV103
U 1 1 5F4918D3
P 8650 3300
F 0 "RV103" V 8537 3300 50  0000 C CNN
F 1 "5k" V 8446 3300 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-6-V_Vertical" H 8650 3300 50  0001 C CNN
F 3 "~" H 8650 3300 50  0001 C CNN
	1    8650 3300
	0    1    -1   0   
$EndComp
Wire Wire Line
	9050 3050 8650 3050
Wire Wire Line
	8650 3050 8650 3150
Connection ~ 9050 3050
Wire Wire Line
	8350 3300 8500 3300
Wire Wire Line
	8800 3300 9050 3300
Wire Wire Line
	5800 3700 5800 2700
Connection ~ 5800 2700
Wire Wire Line
	5800 2700 6050 2700
Wire Wire Line
	3150 5000 4150 5000
Connection ~ 4150 5000
Wire Wire Line
	6600 3900 6600 5000
Connection ~ 6600 5000
$Comp
L Timer:LM556 U101
U 2 1 5F472EE9
P 6600 3500
F 0 "U101" H 6600 4081 50  0000 C CNN
F 1 "LM556" H 6600 3990 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6600 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm556.pdf" H 6600 3500 50  0001 C CNN
	2    6600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3700 5800 3700
$Comp
L Device:Battery BT?
U 1 1 5F4C9DC6
P 1050 4250
AR Path="/5F4C9DC6" Ref="BT?"  Part="1" 
AR Path="/5F470266/5F4C9DC6" Ref="BT101"  Part="1" 
F 0 "BT101" H 1158 4296 50  0000 L CNN
F 1 "9v" H 1158 4205 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1050 4310 50  0001 C CNN
F 3 "~" V 1050 4310 50  0001 C CNN
	1    1050 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F4C9DCC
P 2400 4100
AR Path="/5F4C9DCC" Ref="D?"  Part="1" 
AR Path="/5F470266/5F4C9DCC" Ref="D101"  Part="1" 
F 0 "D101" V 2439 3982 50  0000 R CNN
F 1 "LED" V 2348 3982 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 2400 4100 50  0001 C CNN
F 3 "~" H 2400 4100 50  0001 C CNN
	1    2400 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F4C9DD2
P 2400 3600
AR Path="/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F4E92A/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F9596F/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F95BBA/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F95BBF/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F96182/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F96187/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F9685F/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F96864/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/60F96869/5F4C9DD2" Ref="R?"  Part="1" 
AR Path="/5F470266/5F4C9DD2" Ref="R101"  Part="1" 
F 0 "R101" H 2500 3650 50  0000 L CNN
F 1 "330" H 2500 3550 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2330 3600 50  0001 C CNN
F 3 "~" H 2400 3600 50  0001 C CNN
	1    2400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3750 2400 3950
Wire Wire Line
	1050 5000 2400 5000
Wire Wire Line
	2400 4250 2400 5000
Wire Wire Line
	2050 2700 2400 2700
NoConn ~ 2050 2900
Wire Wire Line
	1650 2800 1050 2800
$Comp
L dk_Slide-Switches:EG1218 S?
U 1 1 5F4C9DE7
P 1850 2800
AR Path="/5F4C9DE7" Ref="S?"  Part="1" 
AR Path="/5F470266/5F4C9DE7" Ref="S101"  Part="1" 
F 0 "S101" H 1850 3081 50  0000 C CNN
F 1 "EG1218" H 1850 2990 50  0000 C CNN
F 2 "Button_Switch_THT:SW_Slide_1P2T_CK_OS102011MS2Q" H 2050 3000 50  0001 L CNN
F 3 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 2050 3100 60  0001 L CNN
F 4 "EG1903-ND" H 2050 3200 60  0001 L CNN "Digi-Key_PN"
F 5 "EG1218" H 2050 3300 60  0001 L CNN "MPN"
F 6 "Switches" H 2050 3400 60  0001 L CNN "Category"
F 7 "Slide Switches" H 2050 3500 60  0001 L CNN "Family"
F 8 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 2050 3600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/e-switch/EG1218/EG1903-ND/101726" H 2050 3700 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH SLIDE SPDT 200MA 30V" H 2050 3800 60  0001 L CNN "Description"
F 11 "E-Switch" H 2050 3900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2050 4000 60  0001 L CNN "Status"
	1    1850 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2800 1050 4050
Wire Wire Line
	1050 4450 1050 5000
Wire Wire Line
	2400 2700 2400 3450
Connection ~ 2400 5000
Connection ~ 2400 2700
Wire Wire Line
	2400 2700 3150 2700
Connection ~ 3150 2700
Wire Wire Line
	2400 5000 3150 5000
Connection ~ 3150 5000
Wire Wire Line
	6600 5000 7700 5000
Wire Wire Line
	4150 3900 4150 5000
$Comp
L Timer:LM556 U101
U 1 1 5F4726A4
P 4150 3500
F 0 "U101" H 4150 4081 50  0000 C CNN
F 1 "LM556" H 4150 3990 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4150 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm556.pdf" H 4150 3500 50  0001 C CNN
	1    4150 3500
	1    0    0    -1  
$EndComp
NoConn ~ 4150 4050
Wire Wire Line
	4150 5000 6600 5000
Wire Wire Line
	5050 3800 5050 4050
Wire Wire Line
	5050 4050 4700 4050
Wire Wire Line
	3650 3300 3400 3300
Wire Wire Line
	3400 3300 3150 3300
Connection ~ 3400 3300
Wire Wire Line
	3400 3300 3400 4050
Connection ~ 4700 4050
Wire Wire Line
	4700 4050 3400 4050
Wire Wire Line
	4700 3700 4700 4050
$EndSCHEMATC
