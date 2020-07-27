EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 21
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
L Device:Battery BT1
U 1 1 5EEAE121
P 1200 4050
F 0 "BT1" H 1308 4096 50  0000 L CNN
F 1 "9v" H 1308 4005 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1200 4110 50  0001 C CNN
F 3 "~" V 1200 4110 50  0001 C CNN
	1    1200 4050
	1    0    0    -1  
$EndComp
$Sheet
S 4250 1050 900  550 
U 60F4E92A
F0 "555_astable" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 1250 50 
F3 "9v" I L 4250 1250 50 
F4 "Gnd" I L 4250 1450 50 
$EndSheet
Wire Wire Line
	3450 1050 3550 1050
Wire Wire Line
	3450 1250 3450 1050
Wire Wire Line
	3550 1250 3450 1250
Wire Wire Line
	4000 1250 4000 1050
Wire Wire Line
	3950 1250 4000 1250
Wire Wire Line
	3950 1050 4000 1050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S2
U 1 1 60FBC6A1
P 3750 1150
AR Path="/60FBC6A1" Ref="S2"  Part="1" 
AR Path="/60F4E92A/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F9596F/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F95BBA/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F95BBF/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F96182/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F96187/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F9685F/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F96864/60FBC6A1" Ref="S?"  Part="1" 
AR Path="/60F96869/60FBC6A1" Ref="S?"  Part="1" 
F 0 "S2" V 3750 1300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 1350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 1350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 1450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 1550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 1650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 1750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 1850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 1950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 2050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 2150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 2250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 2350 60  0001 L CNN "Status"
	1    3750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1050 3100 1050
Connection ~ 3450 1050
Wire Wire Line
	4000 1250 4250 1250
Connection ~ 4000 1250
$Sheet
S 4250 2050 900  550 
U 5EF17819
F0 "sheet5EF17814" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 2250 50 
F3 "9v" I L 4250 2250 50 
F4 "Gnd" I L 4250 2450 50 
$EndSheet
Wire Wire Line
	3450 2050 3550 2050
Wire Wire Line
	3450 2250 3450 2050
Wire Wire Line
	3550 2250 3450 2250
Wire Wire Line
	4000 2250 4000 2050
Wire Wire Line
	3950 2250 4000 2250
Wire Wire Line
	3950 2050 4000 2050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S3
U 1 1 5EF1782E
P 3750 2150
AR Path="/5EF1782E" Ref="S3"  Part="1" 
AR Path="/60F4E92A/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F9596F/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F96182/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F96187/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F9685F/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F96864/5EF1782E" Ref="S?"  Part="1" 
AR Path="/60F96869/5EF1782E" Ref="S?"  Part="1" 
F 0 "S3" V 3750 2300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 2350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 2350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 2450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 2550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 2650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 2750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 2850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 2950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 3050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 3150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 3250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 3350 60  0001 L CNN "Status"
	1    3750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2250 4250 2250
Connection ~ 4000 2250
$Sheet
S 4250 3050 900  550 
U 5EF23030
F0 "sheet5EF2302B" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 3250 50 
F3 "9v" I L 4250 3250 50 
F4 "Gnd" I L 4250 3450 50 
$EndSheet
Wire Wire Line
	3450 3050 3550 3050
Wire Wire Line
	3450 3250 3450 3050
Wire Wire Line
	3550 3250 3450 3250
Wire Wire Line
	4000 3250 4000 3050
Wire Wire Line
	3950 3250 4000 3250
Wire Wire Line
	3950 3050 4000 3050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S4
U 1 1 5EF23045
P 3750 3150
AR Path="/5EF23045" Ref="S4"  Part="1" 
AR Path="/60F4E92A/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F9596F/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F96182/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F96187/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F9685F/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F96864/5EF23045" Ref="S?"  Part="1" 
AR Path="/60F96869/5EF23045" Ref="S?"  Part="1" 
F 0 "S4" V 3750 3300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 3350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 3350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 3450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 3550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 3650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 3750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 3850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 3950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 4050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 4150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 4250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 4350 60  0001 L CNN "Status"
	1    3750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3250 4250 3250
Connection ~ 4000 3250
$Sheet
S 4250 4050 900  550 
U 5EF259E1
F0 "sheet5EF259DC" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 4250 50 
F3 "9v" I L 4250 4250 50 
F4 "Gnd" I L 4250 4450 50 
$EndSheet
Wire Wire Line
	3450 4050 3550 4050
Wire Wire Line
	3450 4250 3450 4050
Wire Wire Line
	3550 4250 3450 4250
Wire Wire Line
	4000 4250 4000 4050
Wire Wire Line
	3950 4250 4000 4250
Wire Wire Line
	3950 4050 4000 4050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S5
U 1 1 5EF259F6
P 3750 4150
AR Path="/5EF259F6" Ref="S5"  Part="1" 
AR Path="/60F4E92A/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F9596F/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F96182/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F96187/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F9685F/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F96864/5EF259F6" Ref="S?"  Part="1" 
AR Path="/60F96869/5EF259F6" Ref="S?"  Part="1" 
F 0 "S5" V 3750 4300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 4350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 4350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 4450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 4550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 4650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 4750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 4850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 4950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 5050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 5150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 5250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 5350 60  0001 L CNN "Status"
	1    3750 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4250 4250 4250
Connection ~ 4000 4250
$Sheet
S 4250 5050 900  550 
U 5EF27E4C
F0 "sheet5EF27E47" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 5250 50 
F3 "9v" I L 4250 5250 50 
F4 "Gnd" I L 4250 5450 50 
$EndSheet
Wire Wire Line
	3450 5050 3550 5050
Wire Wire Line
	3450 5250 3450 5050
Wire Wire Line
	3550 5250 3450 5250
Wire Wire Line
	4000 5250 4000 5050
Wire Wire Line
	3950 5250 4000 5250
Wire Wire Line
	3950 5050 4000 5050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S6
U 1 1 5EF27E61
P 3750 5150
AR Path="/5EF27E61" Ref="S6"  Part="1" 
AR Path="/60F4E92A/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F9596F/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F96182/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F96187/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F9685F/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F96864/5EF27E61" Ref="S?"  Part="1" 
AR Path="/60F96869/5EF27E61" Ref="S?"  Part="1" 
F 0 "S6" V 3750 5300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 5350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 5350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 5450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 5550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 5650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 5750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 5850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 5950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 6050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 6150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 6250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 6350 60  0001 L CNN "Status"
	1    3750 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5250 4250 5250
Connection ~ 4000 5250
Wire Wire Line
	3100 1050 3100 2050
Wire Wire Line
	3100 2050 3450 2050
Connection ~ 3450 2050
Wire Wire Line
	3100 3050 3450 3050
Connection ~ 3100 2050
Connection ~ 3450 3050
Wire Wire Line
	3100 3050 3100 4050
Wire Wire Line
	3100 4050 3450 4050
Connection ~ 3100 3050
Connection ~ 3450 4050
Wire Wire Line
	3100 4050 3100 5050
Wire Wire Line
	3100 5050 3450 5050
Connection ~ 3100 4050
Connection ~ 3450 5050
Wire Wire Line
	4250 1450 3250 1450
Wire Wire Line
	3250 1450 3250 2450
Wire Wire Line
	4250 2450 3250 2450
Connection ~ 3250 2450
Wire Wire Line
	3250 2450 3250 3450
Wire Wire Line
	4250 3450 3250 3450
Connection ~ 3250 3450
Wire Wire Line
	3250 3450 3250 4450
Wire Wire Line
	4250 4450 3250 4450
Connection ~ 3250 4450
Wire Wire Line
	3250 4450 3250 5450
Wire Wire Line
	4250 5450 3250 5450
$Comp
L Device:LED D1
U 1 1 5F0644B0
P 2550 3900
F 0 "D1" V 2589 3782 50  0000 R CNN
F 1 "LED" V 2498 3782 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 2550 3900 50  0001 C CNN
F 3 "~" H 2550 3900 50  0001 C CNN
	1    2550 3900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F0694ED
P 2550 3400
AR Path="/5F0694ED" Ref="R1"  Part="1" 
AR Path="/60F4E92A/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F9596F/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F95BBA/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F95BBF/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F96182/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F96187/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F9685F/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F96864/5F0694ED" Ref="R?"  Part="1" 
AR Path="/60F96869/5F0694ED" Ref="R?"  Part="1" 
F 0 "R1" H 2650 3450 50  0000 L CNN
F 1 "330" H 2650 3350 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 2480 3400 50  0001 C CNN
F 3 "~" H 2550 3400 50  0001 C CNN
	1    2550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3550 2550 3750
Wire Wire Line
	1200 4800 2550 4800
Wire Wire Line
	2550 4050 2550 4800
$Comp
L Device:R_POT_TRIM_US RV1
U 1 1 5F169489
P 9500 3500
AR Path="/5F169489" Ref="RV1"  Part="1" 
AR Path="/60F4E92A/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F9596F/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F95BBA/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F95BBF/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F96182/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F96187/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F9685F/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F96864/5F169489" Ref="RV?"  Part="1" 
AR Path="/60F96869/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF17819/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF23030/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF259E1/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF27E4C/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF2B213/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF6055A/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF6057F/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF605A2/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF605C5/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF605E8/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF6060B/5F169489" Ref="RV?"  Part="1" 
AR Path="/5EF7A07F/5F169489" Ref="RV?"  Part="1" 
F 0 "RV1" V 9400 3600 50  0000 R CNN
F 1 "R_POT_TRIM_US" H 9432 3455 50  0001 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-6-V_Vertical" H 9500 3500 50  0001 C CNN
F 3 "~" H 9500 3500 50  0001 C CNN
	1    9500 3500
	1    0    0    1   
$EndComp
Wire Wire Line
	9500 4450 9850 4450
$Comp
L Device:R R2
U 1 1 5F3FF342
P 9850 3850
AR Path="/5F3FF342" Ref="R2"  Part="1" 
AR Path="/60F4E92A/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F9596F/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F95BBA/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F95BBF/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F96182/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F96187/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F9685F/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F96864/5F3FF342" Ref="R?"  Part="1" 
AR Path="/60F96869/5F3FF342" Ref="R?"  Part="1" 
F 0 "R2" H 9600 3900 50  0000 L CNN
F 1 "100" H 9600 3800 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9780 3850 50  0001 C CNN
F 3 "~" H 9850 3850 50  0001 C CNN
	1    9850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3500 9850 3700
Wire Wire Line
	9850 4000 9850 4450
Connection ~ 9850 4450
Wire Wire Line
	9500 2900 9500 3350
Wire Wire Line
	9650 3500 9850 3500
Wire Wire Line
	9500 3650 9500 4450
Text Notes 9100 2800 0    50   ~ 0
TODO: extra resistor here to “fix”\nfrequency shift from vol change?
Text Notes 9600 4750 0    50   ~ 0
Optional “fake log” resistor\nhttps://sound-au.com/project01.htm
Wire Wire Line
	5450 1250 5450 2250
Wire Wire Line
	5150 1250 5450 1250
Wire Wire Line
	5150 2250 5450 2250
Connection ~ 5450 2250
Wire Wire Line
	5450 2250 5450 3250
Wire Wire Line
	5150 3250 5450 3250
Connection ~ 5450 3250
Wire Wire Line
	5450 3250 5450 4250
Wire Wire Line
	5150 4250 5450 4250
Connection ~ 5450 4250
Wire Wire Line
	5150 5250 5450 5250
Wire Wire Line
	5450 4250 5450 5250
Text Notes 9700 3150 0    50   ~ 0
TODO: reverse vol pot if\nnot using right trimwheel
$Comp
L Amplifier_Audio:LM386 U1
U 1 1 5F0FEF81
P 11350 3400
F 0 "U1" H 10900 3800 50  0000 L CNN
F 1 "LM386" H 10900 3700 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 11450 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm386.pdf" H 11550 3600 50  0001 C CNN
	1    11350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3500 11050 3500
Connection ~ 9850 3500
$Comp
L Device:C C2
U 1 1 5F234E50
P 12400 4200
AR Path="/5F234E50" Ref="C2"  Part="1" 
AR Path="/60F4E92A/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F9596F/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F95BBA/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F95BBF/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F96182/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F96187/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F9685F/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F96864/5F234E50" Ref="C?"  Part="1" 
AR Path="/60F96869/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF17819/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF23030/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF259E1/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF27E4C/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF2B213/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF6055A/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF6057F/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF605A2/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF605C5/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF605E8/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF6060B/5F234E50" Ref="C?"  Part="1" 
AR Path="/5EF7A07F/5F234E50" Ref="C?"  Part="1" 
F 0 "C2" H 12600 4300 50  0000 L CNN
F 1 "47nF" H 12550 4200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 12438 4050 50  0001 C CNN
F 3 "~" H 12400 4200 50  0001 C CNN
	1    12400 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5F2BD566
P 12400 3650
AR Path="/5F2BD566" Ref="R3"  Part="1" 
AR Path="/60F4E92A/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F9596F/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F95BBA/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F95BBF/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F96182/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F96187/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F9685F/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F96864/5F2BD566" Ref="R?"  Part="1" 
AR Path="/60F96869/5F2BD566" Ref="R?"  Part="1" 
F 0 "R3" H 12150 3700 50  0000 L CNN
F 1 "10" H 12150 3600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 12330 3650 50  0001 C CNN
F 3 "~" H 12400 3650 50  0001 C CNN
	1    12400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 3400 12400 3400
Wire Wire Line
	12400 3400 12400 3500
$Comp
L Device:CP1 C3
U 1 1 5F321372
P 12750 3400
F 0 "C3" V 13002 3400 50  0000 C CNN
F 1 "220uF" V 12911 3400 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 12750 3400 50  0001 C CNN
F 3 "~" H 12750 3400 50  0001 C CNN
	1    12750 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	12400 3400 12600 3400
Connection ~ 12400 3400
Wire Wire Line
	12900 3400 13200 3400
Wire Wire Line
	13200 3500 13100 3500
Wire Wire Line
	12400 4350 12400 4450
Connection ~ 12400 4450
Wire Wire Line
	12400 4450 13100 4450
$Comp
L Device:Speaker LS1
U 1 1 5F32F818
P 13400 3400
F 0 "LS1" H 13570 3396 50  0000 L CNN
F 1 "Speaker" H 13570 3305 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13400 3200 50  0001 C CNN
F 3 "~" H 13390 3350 50  0001 C CNN
	1    13400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 3500 13100 4450
Wire Wire Line
	11250 700  11250 3100
Wire Wire Line
	11750 4450 12400 4450
Connection ~ 11750 4450
Wire Wire Line
	11750 4350 11750 4450
$Comp
L Device:C C1
U 1 1 5F18156C
P 11750 4200
AR Path="/5F18156C" Ref="C1"  Part="1" 
AR Path="/60F4E92A/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F9596F/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F95BBA/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F95BBF/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F96182/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F96187/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F9685F/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F96864/5F18156C" Ref="C?"  Part="1" 
AR Path="/60F96869/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF17819/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF23030/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF259E1/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF27E4C/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF2B213/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF6055A/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF6057F/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF605A2/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF605C5/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF605E8/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF6060B/5F18156C" Ref="C?"  Part="1" 
AR Path="/5EF7A07F/5F18156C" Ref="C?"  Part="1" 
F 0 "C1" H 11500 4150 50  0000 L CNN
F 1 ".1uF" H 11450 4250 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 11788 4050 50  0001 C CNN
F 3 "~" H 11750 4200 50  0001 C CNN
	1    11750 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	11050 3300 10950 3300
Wire Wire Line
	10950 3300 10950 4450
Wire Wire Line
	9850 4450 10950 4450
Connection ~ 10950 4450
Wire Wire Line
	11350 3100 11350 3000
Wire Wire Line
	11350 3000 11750 3000
Wire Wire Line
	11750 3000 11750 4050
NoConn ~ 11350 3700
NoConn ~ 11450 3700
Wire Wire Line
	12400 3800 12400 4050
Wire Wire Line
	2200 2500 2550 2500
NoConn ~ 2200 2700
Wire Wire Line
	1800 2600 1200 2600
$Comp
L dk_Slide-Switches:EG1218 S1
U 1 1 5F3DD481
P 2000 2600
F 0 "S1" H 2000 2881 50  0000 C CNN
F 1 "EG1218" H 2000 2790 50  0000 C CNN
F 2 "Button_Switch_THT:SW_Slide_1P2T_CK_OS102011MS2Q" H 2200 2800 50  0001 L CNN
F 3 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 2200 2900 60  0001 L CNN
F 4 "EG1903-ND" H 2200 3000 60  0001 L CNN "Digi-Key_PN"
F 5 "EG1218" H 2200 3100 60  0001 L CNN "MPN"
F 6 "Switches" H 2200 3200 60  0001 L CNN "Category"
F 7 "Slide Switches" H 2200 3300 60  0001 L CNN "Family"
F 8 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 2200 3400 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/e-switch/EG1218/EG1903-ND/101726" H 2200 3500 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH SLIDE SPDT 200MA 30V" H 2200 3600 60  0001 L CNN "Description"
F 11 "E-Switch" H 2200 3700 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2200 3800 60  0001 L CNN "Status"
	1    2000 2600
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F9428F6
P 1300 1400
F 0 "#FLG?" H 1300 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 1300 1573 50  0000 C CNN
F 2 "" H 1300 1400 50  0001 C CNN
F 3 "~" H 1300 1400 50  0001 C CNN
	1    1300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1400 1300 2050
Wire Wire Line
	1200 2600 1200 3850
Wire Wire Line
	1200 4250 1200 4800
$Comp
L power:GND #PWR?
U 1 1 5F9C6B7D
P 13100 4650
F 0 "#PWR?" H 13100 4400 50  0001 C CNN
F 1 "GND" H 13105 4477 50  0000 C CNN
F 2 "" H 13100 4650 50  0001 C CNN
F 3 "" H 13100 4650 50  0001 C CNN
	1    13100 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 4650 13100 4450
Wire Wire Line
	3100 700  11250 700 
$Sheet
S 4250 6050 900  550 
U 5F7AB892
F0 "sheet5F7AB889" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 6250 50 
F3 "9v" I L 4250 6250 50 
F4 "Gnd" I L 4250 6450 50 
$EndSheet
Wire Wire Line
	3450 6050 3550 6050
Wire Wire Line
	3450 6250 3450 6050
Wire Wire Line
	3550 6250 3450 6250
Wire Wire Line
	4000 6250 4000 6050
Wire Wire Line
	3950 6250 4000 6250
Wire Wire Line
	3950 6050 4000 6050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S7
U 1 1 5F7AB8A7
P 3750 6150
AR Path="/5F7AB8A7" Ref="S7"  Part="1" 
AR Path="/60F4E92A/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F96182/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F96187/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F96864/5F7AB8A7" Ref="S?"  Part="1" 
AR Path="/60F96869/5F7AB8A7" Ref="S?"  Part="1" 
F 0 "S7" V 3750 6300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 6350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 6350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 6450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 6550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 6650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 6750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 6850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 6950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 7050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 7150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 7250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 7350 60  0001 L CNN "Status"
	1    3750 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6050 3100 6050
Connection ~ 3450 6050
Wire Wire Line
	4000 6250 4250 6250
Connection ~ 4000 6250
$Sheet
S 4250 7050 900  550 
U 5F7AB8B0
F0 "sheet5F7AB88A" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 7250 50 
F3 "9v" I L 4250 7250 50 
F4 "Gnd" I L 4250 7450 50 
$EndSheet
Wire Wire Line
	3450 7050 3550 7050
Wire Wire Line
	3450 7250 3450 7050
Wire Wire Line
	3550 7250 3450 7250
Wire Wire Line
	4000 7250 4000 7050
Wire Wire Line
	3950 7250 4000 7250
Wire Wire Line
	3950 7050 4000 7050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S8
U 1 1 5F7AB8C5
P 3750 7150
AR Path="/5F7AB8C5" Ref="S8"  Part="1" 
AR Path="/60F4E92A/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F96182/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F96187/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F96864/5F7AB8C5" Ref="S?"  Part="1" 
AR Path="/60F96869/5F7AB8C5" Ref="S?"  Part="1" 
F 0 "S8" V 3750 7300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 7350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 7350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 7450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 7550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 7650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 7750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 7850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 7950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 8050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 8150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 8250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 8350 60  0001 L CNN "Status"
	1    3750 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 7250 4250 7250
Connection ~ 4000 7250
$Sheet
S 4250 8050 900  550 
U 5F7AB8CC
F0 "sheet5F7AB88B" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 8250 50 
F3 "9v" I L 4250 8250 50 
F4 "Gnd" I L 4250 8450 50 
$EndSheet
Wire Wire Line
	3450 8050 3550 8050
Wire Wire Line
	3450 8250 3450 8050
Wire Wire Line
	3550 8250 3450 8250
Wire Wire Line
	4000 8250 4000 8050
Wire Wire Line
	3950 8250 4000 8250
Wire Wire Line
	3950 8050 4000 8050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S9
U 1 1 5F7AB8E1
P 3750 8150
AR Path="/5F7AB8E1" Ref="S9"  Part="1" 
AR Path="/60F4E92A/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F96182/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F96187/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F96864/5F7AB8E1" Ref="S?"  Part="1" 
AR Path="/60F96869/5F7AB8E1" Ref="S?"  Part="1" 
F 0 "S9" V 3750 8300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 8350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 8350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 8450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 8550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 8650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 8750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 8850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 8950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 9050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 9150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 9250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 9350 60  0001 L CNN "Status"
	1    3750 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 8250 4250 8250
Connection ~ 4000 8250
$Sheet
S 4250 9050 900  550 
U 5F7AB8E8
F0 "sheet5F7AB88C" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 9250 50 
F3 "9v" I L 4250 9250 50 
F4 "Gnd" I L 4250 9450 50 
$EndSheet
Wire Wire Line
	3450 9050 3550 9050
Wire Wire Line
	3450 9250 3450 9050
Wire Wire Line
	3550 9250 3450 9250
Wire Wire Line
	4000 9250 4000 9050
Wire Wire Line
	3950 9250 4000 9250
Wire Wire Line
	3950 9050 4000 9050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S10
U 1 1 5F7AB8FD
P 3750 9150
AR Path="/5F7AB8FD" Ref="S10"  Part="1" 
AR Path="/60F4E92A/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F96182/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F96187/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F96864/5F7AB8FD" Ref="S?"  Part="1" 
AR Path="/60F96869/5F7AB8FD" Ref="S?"  Part="1" 
F 0 "S10" V 3750 9300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 9350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 9350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 9450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 9550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 9650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 9750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 9850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 9950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 10050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 10150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 10250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 10350 60  0001 L CNN "Status"
	1    3750 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 9250 4250 9250
Connection ~ 4000 9250
$Sheet
S 4250 10050 900  550 
U 5F7AB904
F0 "sheet5F7AB88D" 50
F1 "555_astable.sch" 50
F2 "Out" I R 5150 10250 50 
F3 "9v" I L 4250 10250 50 
F4 "Gnd" I L 4250 10450 50 
$EndSheet
Wire Wire Line
	3450 10050 3550 10050
Wire Wire Line
	3450 10250 3450 10050
Wire Wire Line
	3550 10250 3450 10250
Wire Wire Line
	4000 10250 4000 10050
Wire Wire Line
	3950 10250 4000 10250
Wire Wire Line
	3950 10050 4000 10050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S11
U 1 1 5F7AB919
P 3750 10150
AR Path="/5F7AB919" Ref="S11"  Part="1" 
AR Path="/60F4E92A/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F96182/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F96187/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F96864/5F7AB919" Ref="S?"  Part="1" 
AR Path="/60F96869/5F7AB919" Ref="S?"  Part="1" 
F 0 "S11" V 3750 10300 60  0000 L CNN
F 1 "FSM4JSMATR" V 3750 10350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 3950 10350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 10450 60  0001 L CNN
F 4 "450-1759-1-ND" H 3950 10550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 3950 10650 60  0001 L CNN "MPN"
F 6 "Switches" H 3950 10750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3950 10850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 3950 10950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 3950 11050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 3950 11150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 3950 11250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3950 11350 60  0001 L CNN "Status"
	1    3750 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 10250 4250 10250
Connection ~ 4000 10250
Wire Wire Line
	3100 7050 3450 7050
Connection ~ 3450 7050
Wire Wire Line
	3100 8050 3450 8050
Connection ~ 3450 8050
Wire Wire Line
	3100 9050 3450 9050
Connection ~ 3450 9050
Wire Wire Line
	3100 10050 3450 10050
Connection ~ 3450 10050
Wire Wire Line
	4250 6450 3250 6450
Wire Wire Line
	3250 6450 3250 7450
Wire Wire Line
	4250 7450 3250 7450
Connection ~ 3250 7450
Wire Wire Line
	3250 7450 3250 8450
Wire Wire Line
	4250 8450 3250 8450
Connection ~ 3250 8450
Wire Wire Line
	3250 8450 3250 9450
Wire Wire Line
	4250 9450 3250 9450
Connection ~ 3250 9450
Wire Wire Line
	3250 9450 3250 10450
Wire Wire Line
	4250 10450 3250 10450
Wire Wire Line
	5450 6250 5450 7250
Wire Wire Line
	5150 6250 5450 6250
Wire Wire Line
	5150 7250 5450 7250
Connection ~ 5450 7250
Wire Wire Line
	5450 7250 5450 8250
Wire Wire Line
	5150 8250 5450 8250
Connection ~ 5450 8250
Wire Wire Line
	5450 8250 5450 9250
Wire Wire Line
	5150 9250 5450 9250
Connection ~ 5450 9250
Wire Wire Line
	5150 10250 5450 10250
Wire Wire Line
	5450 9250 5450 10250
Wire Wire Line
	3100 5050 3100 6050
Connection ~ 3100 5050
Wire Wire Line
	3100 6050 3100 7050
Connection ~ 3100 6050
Wire Wire Line
	3100 7050 3100 8050
Connection ~ 3100 7050
Wire Wire Line
	3100 8050 3100 9050
Connection ~ 3100 8050
Wire Wire Line
	3100 9050 3100 10050
Connection ~ 3100 9050
Wire Wire Line
	3250 5450 3250 6450
Connection ~ 3250 5450
Connection ~ 3250 6450
Wire Wire Line
	5450 5250 5450 6250
Connection ~ 5450 5250
Connection ~ 5450 6250
Wire Wire Line
	2550 2500 2550 3250
Wire Wire Line
	3100 2050 3100 3050
$Sheet
S 7050 1050 900  550 
U 5F842B3B
F0 "sheet5F842B2D" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 1250 50 
F3 "9v" I L 7050 1250 50 
F4 "Gnd" I L 7050 1450 50 
$EndSheet
Wire Wire Line
	6250 1050 6350 1050
Wire Wire Line
	6250 1250 6250 1050
Wire Wire Line
	6350 1250 6250 1250
Wire Wire Line
	6800 1250 6800 1050
Wire Wire Line
	6750 1250 6800 1250
Wire Wire Line
	6750 1050 6800 1050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S12
U 1 1 5F842B50
P 6550 1150
AR Path="/5F842B50" Ref="S12"  Part="1" 
AR Path="/60F4E92A/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842B50" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842B50" Ref="S?"  Part="1" 
F 0 "S12" V 6550 1300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 1350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 1350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 1450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 1550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 1650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 1750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 1850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 1950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 2050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 2150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 2250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 2350 60  0001 L CNN "Status"
	1    6550 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1050 5900 1050
Connection ~ 6250 1050
Wire Wire Line
	6800 1250 7050 1250
Connection ~ 6800 1250
$Sheet
S 7050 2050 900  550 
U 5F842B59
F0 "sheet5F842B2E" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 2250 50 
F3 "9v" I L 7050 2250 50 
F4 "Gnd" I L 7050 2450 50 
$EndSheet
Wire Wire Line
	6250 2050 6350 2050
Wire Wire Line
	6250 2250 6250 2050
Wire Wire Line
	6350 2250 6250 2250
Wire Wire Line
	6800 2250 6800 2050
Wire Wire Line
	6750 2250 6800 2250
Wire Wire Line
	6750 2050 6800 2050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S13
U 1 1 5F842B6E
P 6550 2150
AR Path="/5F842B6E" Ref="S13"  Part="1" 
AR Path="/60F4E92A/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842B6E" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842B6E" Ref="S?"  Part="1" 
F 0 "S13" V 6550 2300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 2350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 2350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 2450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 2550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 2650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 2750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 2850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 2950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 3050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 3150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 3250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 3350 60  0001 L CNN "Status"
	1    6550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2250 7050 2250
Connection ~ 6800 2250
$Sheet
S 7050 3050 900  550 
U 5F842B75
F0 "sheet5F842B2F" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 3250 50 
F3 "9v" I L 7050 3250 50 
F4 "Gnd" I L 7050 3450 50 
$EndSheet
Wire Wire Line
	6250 3050 6350 3050
Wire Wire Line
	6250 3250 6250 3050
Wire Wire Line
	6350 3250 6250 3250
Wire Wire Line
	6800 3250 6800 3050
Wire Wire Line
	6750 3250 6800 3250
Wire Wire Line
	6750 3050 6800 3050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S14
U 1 1 5F842B8A
P 6550 3150
AR Path="/5F842B8A" Ref="S14"  Part="1" 
AR Path="/60F4E92A/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842B8A" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842B8A" Ref="S?"  Part="1" 
F 0 "S14" V 6550 3300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 3350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 3350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 3450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 3550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 3650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 3750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 3850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 3950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 4050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 4150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 4250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 4350 60  0001 L CNN "Status"
	1    6550 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3250 7050 3250
Connection ~ 6800 3250
$Sheet
S 7050 4050 900  550 
U 5F842B91
F0 "sheet5F842B30" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 4250 50 
F3 "9v" I L 7050 4250 50 
F4 "Gnd" I L 7050 4450 50 
$EndSheet
Wire Wire Line
	6250 4050 6350 4050
Wire Wire Line
	6250 4250 6250 4050
Wire Wire Line
	6350 4250 6250 4250
Wire Wire Line
	6800 4250 6800 4050
Wire Wire Line
	6750 4250 6800 4250
Wire Wire Line
	6750 4050 6800 4050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S15
U 1 1 5F842BA6
P 6550 4150
AR Path="/5F842BA6" Ref="S15"  Part="1" 
AR Path="/60F4E92A/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842BA6" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842BA6" Ref="S?"  Part="1" 
F 0 "S15" V 6550 4300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 4350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 4350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 4450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 4550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 4650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 4750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 4850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 4950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 5050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 5150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 5250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 5350 60  0001 L CNN "Status"
	1    6550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4250 7050 4250
Connection ~ 6800 4250
$Sheet
S 7050 5050 900  550 
U 5F842BAD
F0 "sheet5F842B31" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 5250 50 
F3 "9v" I L 7050 5250 50 
F4 "Gnd" I L 7050 5450 50 
$EndSheet
Wire Wire Line
	6250 5050 6350 5050
Wire Wire Line
	6250 5250 6250 5050
Wire Wire Line
	6350 5250 6250 5250
Wire Wire Line
	6800 5250 6800 5050
Wire Wire Line
	6750 5250 6800 5250
Wire Wire Line
	6750 5050 6800 5050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S16
U 1 1 5F842BC2
P 6550 5150
AR Path="/5F842BC2" Ref="S16"  Part="1" 
AR Path="/60F4E92A/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842BC2" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842BC2" Ref="S?"  Part="1" 
F 0 "S16" V 6550 5300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 5350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 5350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 5450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 5550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 5650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 5750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 5850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 5950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 6050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 6150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 6250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 6350 60  0001 L CNN "Status"
	1    6550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 5250 7050 5250
Connection ~ 6800 5250
Wire Wire Line
	5900 1050 5900 2050
Wire Wire Line
	5900 2050 6250 2050
Connection ~ 6250 2050
Wire Wire Line
	5900 3050 6250 3050
Connection ~ 5900 2050
Connection ~ 6250 3050
Wire Wire Line
	5900 3050 5900 4050
Wire Wire Line
	5900 4050 6250 4050
Connection ~ 5900 3050
Connection ~ 6250 4050
Wire Wire Line
	5900 4050 5900 5050
Wire Wire Line
	5900 5050 6250 5050
Connection ~ 5900 4050
Connection ~ 6250 5050
Wire Wire Line
	7050 1450 6050 1450
Wire Wire Line
	6050 1450 6050 2450
Wire Wire Line
	7050 2450 6050 2450
Connection ~ 6050 2450
Wire Wire Line
	6050 2450 6050 3450
Wire Wire Line
	7050 3450 6050 3450
Connection ~ 6050 3450
Wire Wire Line
	6050 3450 6050 4450
Wire Wire Line
	7050 4450 6050 4450
Connection ~ 6050 4450
Wire Wire Line
	6050 4450 6050 5450
Wire Wire Line
	7050 5450 6050 5450
Wire Wire Line
	8250 1250 8250 2250
Wire Wire Line
	7950 1250 8250 1250
Wire Wire Line
	7950 2250 8250 2250
Connection ~ 8250 2250
Wire Wire Line
	8250 2250 8250 2900
Wire Wire Line
	7950 3250 8250 3250
Connection ~ 8250 3250
Wire Wire Line
	8250 3250 8250 4250
Wire Wire Line
	7950 4250 8250 4250
Connection ~ 8250 4250
Wire Wire Line
	7950 5250 8250 5250
Wire Wire Line
	8250 4250 8250 5250
$Sheet
S 7050 6050 900  550 
U 5F842BEF
F0 "sheet5F842B32" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 6250 50 
F3 "9v" I L 7050 6250 50 
F4 "Gnd" I L 7050 6450 50 
$EndSheet
Wire Wire Line
	6250 6050 6350 6050
Wire Wire Line
	6250 6250 6250 6050
Wire Wire Line
	6350 6250 6250 6250
Wire Wire Line
	6800 6250 6800 6050
Wire Wire Line
	6750 6250 6800 6250
Wire Wire Line
	6750 6050 6800 6050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S17
U 1 1 5F842C04
P 6550 6150
AR Path="/5F842C04" Ref="S17"  Part="1" 
AR Path="/60F4E92A/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842C04" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842C04" Ref="S?"  Part="1" 
F 0 "S17" V 6550 6300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 6350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 6350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 6450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 6550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 6650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 6750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 6850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 6950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 7050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 7150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 7250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 7350 60  0001 L CNN "Status"
	1    6550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 6050 5900 6050
Connection ~ 6250 6050
Wire Wire Line
	6800 6250 7050 6250
Connection ~ 6800 6250
$Sheet
S 7050 7050 900  550 
U 5F842C0D
F0 "sheet5F842B33" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 7250 50 
F3 "9v" I L 7050 7250 50 
F4 "Gnd" I L 7050 7450 50 
$EndSheet
Wire Wire Line
	6250 7050 6350 7050
Wire Wire Line
	6250 7250 6250 7050
Wire Wire Line
	6350 7250 6250 7250
Wire Wire Line
	6800 7250 6800 7050
Wire Wire Line
	6750 7250 6800 7250
Wire Wire Line
	6750 7050 6800 7050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S18
U 1 1 5F842C22
P 6550 7150
AR Path="/5F842C22" Ref="S18"  Part="1" 
AR Path="/60F4E92A/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842C22" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842C22" Ref="S?"  Part="1" 
F 0 "S18" V 6550 7300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 7350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 7350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 7450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 7550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 7650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 7750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 7850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 7950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 8050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 8150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 8250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 8350 60  0001 L CNN "Status"
	1    6550 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 7250 7050 7250
Connection ~ 6800 7250
$Sheet
S 7050 8050 900  550 
U 5F842C29
F0 "sheet5F842B34" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 8250 50 
F3 "9v" I L 7050 8250 50 
F4 "Gnd" I L 7050 8450 50 
$EndSheet
Wire Wire Line
	6250 8050 6350 8050
Wire Wire Line
	6250 8250 6250 8050
Wire Wire Line
	6350 8250 6250 8250
Wire Wire Line
	6800 8250 6800 8050
Wire Wire Line
	6750 8250 6800 8250
Wire Wire Line
	6750 8050 6800 8050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S19
U 1 1 5F842C3E
P 6550 8150
AR Path="/5F842C3E" Ref="S19"  Part="1" 
AR Path="/60F4E92A/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842C3E" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842C3E" Ref="S?"  Part="1" 
F 0 "S19" V 6550 8300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 8350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 8350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 8450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 8550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 8650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 8750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 8850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 8950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 9050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 9150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 9250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 9350 60  0001 L CNN "Status"
	1    6550 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 8250 7050 8250
Connection ~ 6800 8250
$Sheet
S 7050 9050 900  550 
U 5F842C45
F0 "sheet5F842B35" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 9250 50 
F3 "9v" I L 7050 9250 50 
F4 "Gnd" I L 7050 9450 50 
$EndSheet
Wire Wire Line
	6250 9050 6350 9050
Wire Wire Line
	6250 9250 6250 9050
Wire Wire Line
	6350 9250 6250 9250
Wire Wire Line
	6800 9250 6800 9050
Wire Wire Line
	6750 9250 6800 9250
Wire Wire Line
	6750 9050 6800 9050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S20
U 1 1 5F842C5A
P 6550 9150
AR Path="/5F842C5A" Ref="S20"  Part="1" 
AR Path="/60F4E92A/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842C5A" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842C5A" Ref="S?"  Part="1" 
F 0 "S20" V 6550 9300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 9350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 9350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 9450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 9550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 9650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 9750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 9850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 9950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 10050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 10150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 10250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 10350 60  0001 L CNN "Status"
	1    6550 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 9250 7050 9250
Connection ~ 6800 9250
$Sheet
S 7050 10050 900  550 
U 5F842C61
F0 "sheet5F842B36" 50
F1 "555_astable.sch" 50
F2 "Out" I R 7950 10250 50 
F3 "9v" I L 7050 10250 50 
F4 "Gnd" I L 7050 10450 50 
$EndSheet
Wire Wire Line
	6250 10050 6350 10050
Wire Wire Line
	6250 10250 6250 10050
Wire Wire Line
	6350 10250 6250 10250
Wire Wire Line
	6800 10250 6800 10050
Wire Wire Line
	6750 10250 6800 10250
Wire Wire Line
	6750 10050 6800 10050
$Comp
L dk_Tactile-Switches:FSM4JSMATR S21
U 1 1 5F842C76
P 6550 10150
AR Path="/5F842C76" Ref="S21"  Part="1" 
AR Path="/60F4E92A/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F9596F/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F95BBA/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F95BBF/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F96182/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F96187/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F9685F/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F96864/5F842C76" Ref="S?"  Part="1" 
AR Path="/60F96869/5F842C76" Ref="S?"  Part="1" 
F 0 "S21" V 6550 10300 60  0000 L CNN
F 1 "FSM4JSMATR" V 6550 10350 60  0001 L CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 6750 10350 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 10450 60  0001 L CNN
F 4 "450-1759-1-ND" H 6750 10550 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 6750 10650 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 10750 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 10850 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 6750 10950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 6750 11050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 6750 11150 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 6750 11250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 11350 60  0001 L CNN "Status"
	1    6550 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 10250 7050 10250
Connection ~ 6800 10250
Wire Wire Line
	5900 7050 6250 7050
Connection ~ 6250 7050
Wire Wire Line
	5900 8050 6250 8050
Connection ~ 6250 8050
Wire Wire Line
	5900 9050 6250 9050
Connection ~ 6250 9050
Wire Wire Line
	5900 10050 6250 10050
Connection ~ 6250 10050
Wire Wire Line
	7050 6450 6050 6450
Wire Wire Line
	6050 6450 6050 7450
Wire Wire Line
	7050 7450 6050 7450
Connection ~ 6050 7450
Wire Wire Line
	6050 7450 6050 8450
Wire Wire Line
	7050 8450 6050 8450
Connection ~ 6050 8450
Wire Wire Line
	6050 8450 6050 9450
Wire Wire Line
	7050 9450 6050 9450
Connection ~ 6050 9450
Wire Wire Line
	6050 9450 6050 10450
Wire Wire Line
	7050 10450 6050 10450
Wire Wire Line
	8250 6250 8250 7250
Wire Wire Line
	7950 6250 8250 6250
Wire Wire Line
	7950 7250 8250 7250
Connection ~ 8250 7250
Wire Wire Line
	8250 7250 8250 8250
Wire Wire Line
	7950 8250 8250 8250
Connection ~ 8250 8250
Wire Wire Line
	8250 8250 8250 9250
Wire Wire Line
	7950 9250 8250 9250
Connection ~ 8250 9250
Wire Wire Line
	7950 10250 8250 10250
Wire Wire Line
	8250 9250 8250 10250
Wire Wire Line
	5900 5050 5900 6050
Connection ~ 5900 5050
Wire Wire Line
	5900 6050 5900 7050
Connection ~ 5900 6050
Wire Wire Line
	5900 7050 5900 8050
Connection ~ 5900 7050
Wire Wire Line
	5900 8050 5900 9050
Connection ~ 5900 8050
Wire Wire Line
	5900 9050 5900 10050
Connection ~ 5900 9050
Wire Wire Line
	6050 5450 6050 6450
Connection ~ 6050 5450
Connection ~ 6050 6450
Wire Wire Line
	8250 5250 8250 6250
Connection ~ 8250 5250
Connection ~ 8250 6250
Wire Wire Line
	5900 2050 5900 3050
Wire Wire Line
	5450 10250 5450 10750
Wire Wire Line
	5450 10750 8250 10750
Wire Wire Line
	8250 10750 8250 10250
Connection ~ 5450 10250
Connection ~ 8250 10250
Wire Wire Line
	3250 10450 3250 10900
Wire Wire Line
	3250 10900 6050 10900
Wire Wire Line
	6050 10900 6050 10450
Connection ~ 3250 10450
Connection ~ 6050 10450
Wire Wire Line
	3100 700  3100 1050
Connection ~ 3100 1050
Wire Wire Line
	3100 2050 1300 2050
Wire Wire Line
	9500 2900 8250 2900
Connection ~ 8250 2900
Wire Wire Line
	8250 2900 8250 3250
Connection ~ 13100 4450
Wire Wire Line
	9500 4450 9500 10900
Wire Wire Line
	9500 10900 6050 10900
Connection ~ 9500 4450
Connection ~ 6050 10900
Wire Wire Line
	2550 4800 2550 10900
Wire Wire Line
	2550 10900 3250 10900
Connection ~ 2550 4800
Connection ~ 3250 10900
Wire Wire Line
	10950 4450 11250 4450
Wire Wire Line
	11250 3700 11250 4450
Connection ~ 11250 4450
Wire Wire Line
	11250 4450 11750 4450
$EndSCHEMATC
