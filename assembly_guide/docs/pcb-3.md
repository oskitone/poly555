---
id: pcb-3
title: "PCB Step 3: Make Some Noise"
sidebar_label: "Step 3: Make Some Noise"
---

## Goal

Finish the timer circuit, add the amp circuit, and test the speaker.

## Components

- Timer circuit
  - 100k resistor \* 1
  - 100 resistor \* 1
  - 10k resistor \* 1
  - .1uF ceramic capacitor \* 1
  - 4.7uF electrolytic capacitor \* 1
  - 10nF ceramic capacitor \* 1
  - 1k trimmer potentiometer \* 1
  - IC socket \* 1
  - 555 timer chip \* 1
- Amp circuit
  - .1uF ceramic capacitor \* 1
  - 47nF ceramic capacitor \* 1
  - 10 resistor \* 1
  - IC socket \* 1
  - 220uF electrolytic capacitor \* 1
  - 1k trimmer potentiometer \* 1
  - 100 resistor \* 1
  - speaker \* 1
  - 386 amp chip \* 1

## Steps

1. Finish that first timer circuit
   1. Solder the **100k resistor** to **R2**.
   2. Solder a **100 resistor** to **R3**.
   3. Solder the **10k resistor** to **R4**.
   4. Solder a **.1uF ceramic capacitor** to **C1**.
   5. Solder the **4.7uF electrolytic capacitor** to **C2**.
   6. Solder the **10nF ceramic capacitor** to **C3**.
   7. Solder a **1k trimmer potentiometer** into **RV1**.
   8. Solder an **IC socket** into **U1**.
      - The legs of the socket may be bent from shipping. Make sure they're all straight and intact when inserting into PCB and before soldering. De-soldering a damaged socket is no fun! Do this for all the IC sockets for the rest of the assembly process.
2. Solder the amp circuit
   1. Solder a **.1uF ceramic capacitor** to **C62**.
   2. Solder the **47nF ceramic capacitor** to **C63**.
   3. Solder **10 resistor** to **R83**.
   4. Solder an **IC socket** into **U22**.
   5. Solder the **220uF electrolytic capacitor** to **C64**
   6. Solder a **1k trimmer potentiometer** into **RV21**.
   7. Solder a **100 resistor** to **R82**.
   8. Solder the **speaker**.
      1. Strip about 1/8" of the insulation off wire's ends.
      2. If necessary, solder wires to speaker. The lighter wire goes to + and the darker wire goes to -.
      3. Just like you did for the battery snap, feed wires through the relief hole above **SPK**, then solder them into place: lighter wire to + and darker to -.
3. Insert IC chips
   1. Insert the **555 timer chip** into its socket at **U1**, making sure it's in the right orientation: a notch or dimple at the top of the chip should match the notch in the footprint outline on the PCB.
   2. Insert the **386 amp chip** into its socket at **U22**, again making sure its in the right orientation. You'll do this for all chips throughout assembly.

### It should look something like this when done

[![It should look something like this when done](/img/pcb-3.jpg)](/img/pcb-3.jpg)

:::note remember
The components' brands and colors for PCB, [LEDs](pcb-0.md#leds), and wires may look different from yours, and that's okay! What's important is that the part types and values are in the right spots.
:::

## Test it

1. With the **battery** attached, turn the power switch on. You should hear a little "boomp" noise from the **speaker** as it's powered by the amp.
2. Press **S1** again. In addition to the LED being lit, you should now hear an audible tone out of the speaker!
3. Try adjusting the pot at **RV1**. Turning it clockwise should make the frequency go up, and vice-versa.
4. Try the same on the volume pot at **RV21**. Clockwise should make the sound quieter, and counter-clockwise will be louder.

### Troubleshooting

- [Do all the usual debugging steps like checking solder joints, etc.](debugging.md)
- Check to see that the volume potentiometer at **RV21** isn't turned all the way down.

## How does it work?

1. First, the **555 timer** circuit
   1. The **.1uF ceramic capacitor** at **C1** is what's called a "bypass cap" and reduces voltage fluctuations as the chip pulls in power.
   2. The frequency of the timer is set by the **4.7uF electrolytic capacitor** at **C2**, the **100k resistor** at **R2**, the **100 resistor** at **R3**, and the **1k trimmer potentiometer** (aka "variable resistor") at **RV1**. **R3** and **RV1** are connected serially and their values sum together &mdash; the range of available resistances is, roughly, 100 to 1100.
   3. The **10nF ceramic capacitor** at **C3** ties the 555's "control voltage" pin to ground. You may see other 555 oscillator circuits that use an analog voltage on this pin to control its frequency, but, since ours is tuned with the pot at **RV1**, we just bring it down to ground, which will always be 0v.
   4. When the switch at **S1** is pressed, power is supplied to its LED and this 555 chip. A square wave outputs from its pin 3 and goes through the **10k resistor** at **R4** before heading off to the amp circuit. This resistor is a "mixer" and prevents the other timers' outputs from interfering with each other.
2. Next, the **386** amp
   1. The timers' output mixing resistors all connect at one of the pins of our volume pot, the **1k trimmer potentiometer** at **RV21**, which is wired as a voltage divider. Depending on where the pot is set, a certain amount of sound is either dumped to ground or sent off to be amplified.
   2. The **100 resistor** at **R82** connects across two of the pins of the volume pot and changes the sweep of the pot from linear to something closer to logarithmic, which is what our ears expect to hear. <!-- TODO: explain better! -->
   3. The **.1uF ceramic capacitor** at **C62** is another bypass cap and helps to prevent static noise from the amp.
   4. The **10 resistor** at **R83** and **47nF ceramic capacitor** at **C63** act as a "snubber" to suppress the amp from triggering itself into oscillation.
   5. Output from the amp goes through the **220uF electrolytic capacitor** at **C64** before connecting to the **speaker**.
