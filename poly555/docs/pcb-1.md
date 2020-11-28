---
id: pcb-1
title: "PCB Step 1: On and Off"
sidebar_label: "Step 1: On and Off"
---

## Components

- Sliding toggle switch \* 1
- 9v battery snap \* 1
- 220 resistor \* 1
- LED \* 1

### Which LED?

You'll have 21 LEDs total in your kit in 3 different colors:

- 1 for the power indicator
- 12 for the natural keys
- 8 for the accidental keys

We're wiring up the power indicator, so grab the color that you only have one of.

## Steps

1. Solder the **sliding toggle switch** to **S21** on the back of the PCB. There's no polarity to this component, so either way is fine as long as it's on the back side.
2. Feed the **battery snap**'s wires through the relief hole above **BAT**, then solder its wires into place: red for + and black for -.
3. Solder a **220 resistor** to **R81**.
4. Solder the **LED** to **D21**, making sure to match its outline.

## Test it

Connect your battery and slide the switch back and forth. You should see the LED turn on and off!

If you have the enclosure bottom handy, you can also try inserting the PCB into it. The switch should fit nicely into its cavity and be exposed on the other side, and the screw holes should align with their counterparts.

### Troubleshooting

- Check solder joints
- Make sure battery still has power
- Use a multimeter to confirm power is getting from battery to switch to R81
