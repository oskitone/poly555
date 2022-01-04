---
id: pcb-2
title: "PCB Step 2: Timer LED Power"
sidebar_label: "Step 2: Timer LED Power"
---

## Goal

Get power to one of the timer circuits and light its LED

## Components

- .22uF ceramic capacitor \* 1
- 7805 voltage regulator \* 1
- Tactile switch \* 1
- 1/4" screw \* 1
- Nut \* 1
- 220 resistor \* 1
- Natural key LED \* 1

## Steps

:::tip
Double check to make sure you've got the [correct LED color](pcb-0#leds) before soldering!
:::

1. Solder the **.22uF ceramic capacitor** to **C61**.
2. Solder the **7805 voltage regulator** to **U21**. <!--TODO: pictures for these would be great! -->
   1. It will _lay flat against its outline_ on the back of the PCB, with its text facing outwards, its tab pressed firmly against the exposed copper rectangle on ther PCB, and its legs bent into their holes. To help hold it there while soldering, attach its tab to the PCB with the **screw and nut**. _It's important that there's no visible gap between 7805's tab and the copper plate on the PCB_.
   2. Solder its legs on the front of the PCB.
   3. Solder its tab to the copper plate on the back of the PCB by applying solder to the sides of the tab where it meets the copper plate. You may need to use a higher temperature on your soldering iron and/or apply additional flux if using a non-flux solder.
   4. Remove the screw and nut for later use.
3. Solder a **tactile switch** into **S1**, making sure it's perfectly flat against the PCB.
   - A trick I like to do is to solder just one of its legs to hold it in place, then remelt the solder while pushing it in from the other side.
4. Solder a **220 resistor** to **R1**.
5. Solder the **LED** to **D1**, making sure to match its outline.

### It should look something like this when done

[![It should look something like this when done](/img/pcb-2.jpg)](/img/pcb-2.jpg)

:::note remember
The components' brands and colors for PCB, [LEDs](pcb-0#leds), and wires may look different from yours, and that's okay! What's important is that the part types and values are in the right spots.
:::

## Test it

With the battery attached and power switch on, press S1. You should see the LED at D1 turn on!

### Troubleshooting

- [Do all the usual debugging steps like checking solder joints, etc.](debugging)
- Use a multimeter to confirm 7805 has 9v going in and 5v coming out, then confirm that's going from the button to R1 when pressed.
