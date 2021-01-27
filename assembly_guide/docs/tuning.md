---
id: tuning
title: Tuning
sidebar_label: Tuning
---

:::tip
The timer circuits are independant, so you can tune their notes in any order.
:::

![Tuning the POLY555](/img/tuning.jpg)

1. If it's already assembled, remove **enclosure top** and **keys**
2. Turn on your chromatic tuner or app and place it by the speaker. Turn the POLY555's volume up so the tuner can hear it.
3. Holding any **S\*** switch, adjust its respective **RV\*** trim pot with a small flathead screwdriver until its note is correct. See frequency table below.

## Frequency table

| Switch | Trim Pot | Note | Frequency |
| ------ | -------- | ---- | --------- |
| S1     | RV1      | F3   | 174.61    |
| S2     | RV2      | F#3  | 185.00    |
| S3     | RV3      | G3   | 196.00    |
| S4     | RV4      | G#3  | 207.65    |
| S5     | RV5      | A3   | 220.00    |
| S6     | RV6      | A#3  | 233.08    |
| S7     | RV7      | B3   | 246.94    |
| S8     | RV8      | C4   | 261.63    |
| S9     | RV9      | C#4  | 277.18    |
| S10    | RV10     | D4   | 293.66    |
| S11    | RV11     | D#4  | 311.13    |
| S12    | RV12     | E4   | 329.63    |
| S13    | RV13     | F4   | 349.23    |
| S14    | RV14     | F#4  | 369.99    |
| S15    | RV15     | G4   | 392.00    |
| S16    | RV16     | G#4  | 415.30    |
| S17    | RV17     | A4   | 440.00    |
| S18    | RV18     | A#4  | 466.16    |
| S19    | RV19     | B4   | 493.88    |
| S20    | RV20     | C5   | 523.25    |

## Using an oscilloscope

Referring to the [schematics](schematics), we can see the 555s' outputs converge on RV21.

Attach your oscilloscope probe to its left leg to view the raw square waves before they get sent to the 386. Ground is RV21's right leg, on the speaker, and a bunch of other places!
