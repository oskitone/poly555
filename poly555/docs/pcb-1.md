---
id: pcb-1
title: "PCB Step 1: On and Off"
sidebar_label: "Step 1: On and Off"
---

## Goal

Get power to the board and switch the main LED on and off.

## Components

- Sliding toggle switch \* 1
- 9v battery snap \* 1
- 220 resistor \* 1
- Power indicator LED \* 1

## Steps

:::tip
Double check to make sure you've got the [correct LED color](pcb-0#leds) before soldering!
:::

1. Solder the **sliding toggle switch** to **S21** on the back of the PCB. There's no polarity to this component, so either way is fine as long as it's on the back side.
2. Feed the **battery snap**'s wires through the relief hole above **BAT**, then solder its wires into place: red for + and black for -.
3. Solder a **220 resistor** to **R81**.
4. Solder the **LED** to **D21**, making sure to match its outline.

### It should look like this when done

![It should look like this](https://dummyimage.com/600x400)

## Test it

Connect your battery and slide the switch back and forth. You should see the LED turn on and off!

If you have the enclosure bottom handy, you can also try inserting the PCB into it. The switch should fit nicely into its cavity and be exposed on the other side, and the screw holes should align with their counterparts.

### Troubleshooting

- Check solder joints
- Make sure battery still has power
- Use a multimeter to confirm power is getting from battery to switch to R81
