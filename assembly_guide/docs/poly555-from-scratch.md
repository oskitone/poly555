---
id: poly555-from-scratch
title: "Appendix: POLY555 from Scratch"
sidebar_label: POLY555 from Scratch
---

:::note
This appendix is for folks making their POLY555 from scratch without buying the [kit](https://www.oskitone.com/product/poly555-synth-diy-kit).
:::

:::caution under construction
More so than the other parts of the assembly guide, _this_ part is especially a work-in-progress.
:::

## BOM

### Electronics

:::note
Some components may have a different designation in Kicad's BOM.
:::

| Designator                                                                                                          | Package                                | Quantity | Designation   |
| ------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | -------- | ------------- |
| BT1                                                                                                                 | PinHeader 1x02_P2.54mm Vertical        | 1        | 9v snap       |
| C59, C56, C53, C50, C47, C44, C41, C38, C35, C32, C29, C26, C23, C20, C17, C14, C11, C8, C5, C2                     | CP_Radial D5.0mm_P2.00mm               | 20       | 4.7uF         |
| C60, C3, C6, C9, C12, C15, C18, C21, C24, C27, C30, C33, C36, C39, C42, C45, C48, C51, C54, C57                     | C_Disc D5.0mm_W2.5mm_P5.00mm           | 20       | 10nF          |
| C61                                                                                                                 | C_Disc D5.0mm_W2.5mm_P5.00mm           | 1        | .22uF         |
| C62, C1, C4, C7, C10, C13, C16, C19, C22, C25, C28, C31, C34, C37, C40, C43, C46, C49, C52, C55, C58                | C_Disc D5.0mm_W2.5mm_P5.00mm           | 21       | .1uF          |
| C63                                                                                                                 | C_Disc D5.0mm_W2.5mm_P5.00mm           | 1        | 47nF          |
| C64                                                                                                                 | CP_Radial D8.0mm_P3.50mm               | 1        | 220uF         |
| D21, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16, D17, D18, D19, D20                      | LED\_ D5.0mm                           | 21 \*    | LED           |
| LS1                                                                                                                 | Speaker                                | 1        | SC700208      |
| R2, R6, R10, R14, R18, R22, R26, R30, R34, R38, R42, R46, R50, R54, R58, R62, R66, R70, R74, R78                    | Resistor L6.3mm_D2.5mm                 | 20       | 100k          |
| R4, R8, R12, R16, R20, R24, R28, R32, R36, R40, R44, R48, R52, R56, R60, R64, R68, R72, R76, R80                    | Resistor L6.3mm_D2.5mm                 | 20       | 10k           |
| R79, R75, R71, R67, R63, R59, R55, R51, R47, R43, R39, R35, R31, R27, R23, R19, R15, R11, R7, R3, R82               | Resistor L6.3mm_D2.5mm                 | 21       | 100           |
| R81, R1, R5, R9, R13, R17, R21, R25, R29, R33, R37, R41, R45, R49, R53, R57, R61, R65, R69, R73, R77                | Resistor L6.3mm_D2.5mm                 | 21       | 220           |
| R83                                                                                                                 | Resistor L6.3mm_D2.5mm                 | 1        | 10            |
| RV21, RV1, RV2, RV3, RV4, RV5, RV6, RV7, RV8, RV9, RV10, RV11, RV12, RV13, RV14, RV15, RV16, RV17, RV18, RV19, RV20 | Trim pot                               | 21       | 1k            |
| S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20                           | SW_TH_Tactile_Omron_B3F-10xx, 6mm tall | 20       | 6x6x6 tactile |
| S21                                                                                                                 | Slide switch                           | 1        | SS12D02       |
| U1, U2, U3, U4, U5, U6, U7, U8, U9, U10, U11, U12, U13, U14, U15, U16, U17, U18, U19, U20                           | DIP-8_W7.62mm                          | 20       | 555           |
| U21                                                                                                                 | TO-220F-3 Horizontal_TabDown           | 1        | L7805         |
| U22                                                                                                                 | DIP-8_W7.62mm                          | 1        | LM386         |

_\* 21 LEDs total in 3 colors: 1 for on/off indicator, 12 for natural notes, 8 for accidental_

### Other

| Name       | Value                | Count | Notes                 |
| ---------- | -------------------- | ----- | --------------------- |
| Socket     | DIP-8                | 21    | For 555s and 386      |
| Plexiglass | 136mm x 92mm x 2.5mm | 1     | 2mm and 3mm also work |
| 1" screw   | 4-40 1" long         | 4     |                       |
| 1/4" screw | 4-40 1/4" long       | 2     |                       |
| Square nut | 4-40                 | 6     |                       |

## Parts

Almost all components on the POLY555 are [jelly bean parts](https://en.wiktionary.org/wiki/jellybean_part), except...

### 555s

Considerations:

- Low voltage options are better for battery performance.
- Voltage regulator's output should fall within supply voltage. This likely won't be a problem.
- Frequency range needs to cover the full spectrum of [notes](tuning).

#### Tested

| Model                   | Observed frequency range \* |
| ----------------------- | --------------------------- |
| [TLC555CP][tlc555] \*\* | 147.1 - 769.2               |
| [LMC555CN][lmc555] \*\* | 147.1 - 877.2               |
| [LM555CN][lm555cn]      | 73.42 - 862.1               |

[tlc555]: https://www.ti.com/lit/ds/symlink/tlc555.pdf
[lmc555]: https://www.ti.com/lit/ds/symlink/lmc555.pdf
[lm555cn]: https://www.ti.com/lit/ds/symlink/lm555.pdf

_\* With default component values from [schematics](schematics)._

_\*\* Kits ship with one of these._

If using a different 555, breadboard the timer circuit first to determine its range, [adjusting the other components](hacking) if necessary to get to the desired note range. The downside to a wider frequency range is that it's harder to tune!

### Tactile switches

These are common enough. Make sure actuator height is 6mm, otherwise you'll be editing `BUTTON_HEIGHT`.

### Speaker

The speaker is a [SC700208](https://dbunlimitedco.com/images/product_images/2D-Drawings/SC700208-1.pdf), measuring 71mm x 41mm x 25mm. Its shape is some kind of standard; there are others that are nearly identical, like the S15X25VA.

Crucially, the depth of the cone and magnet diameter fit perfectly into the enclosure. The mounting screw holes are currently unused, though I may change that in future versions.

Using a speaker with different dimensions will necessitate modifying the enclosure to fit.

### Trimpots

IDK what the model is called but they look like this and are readily available in bulk on eBay:

[![Example trimpots](/img/trimpots.jpg)](/img/trimpots.jpg)

It is not the Bourns 3306 series.

Since it's used for both the tuners and the volume control, you may need to modify the volume wheel to fit if using a different pot.
