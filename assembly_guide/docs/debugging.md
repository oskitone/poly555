---
id: debugging
title: "Appendix: Debugging"
sidebar_label: Debugging
---

Stuck? Happens to the best of us. Try these general debugging steps:

- Turn the boards over and check all solder joints. A majority of problems are caused by insufficient or errant soldering. Familiarize yourself with what a good joint looks like in the [Adafruit Guide To Excellent Soldering](https://learn.adafruit.com/adafruit-guide-excellent-soldering)
- Make sure battery still has power. The 7805 voltage regulator needs at least 7v to work.
- Using a multimeter’s voltage meter, check power at the battery, the switch, the 7805, the switches, and the IC chips. Refer to the schematics to make sure the power is getting to the appropriate IC pins.
- If there’s buzzing, check for any metal scraps stuck to the speaker’s magnet.
- Like arcade console buttons, the tactile switches are mechanical and will eventually wear out over time and vigorous usage. Substitute for a new button (google “6x6x6 tactical switch”).

## Troubleshooting

- **A note is stuck on**<br />
  The key mounting screw(s) may be too tight. Try loosening until the note turns off.
- **A note turns off when pressing another near it**<br />
  The key mounting screw(s) may be too loose. Try tightening.
- **A note and its LED are acting funny**<br />
  Power isn't getting to the circuit correctly. Check its button's soldering. If the circuit responds to pushing the button down in different ways (like softly vs gently, at certain angles), rather than just on or off, the button may need replacing.
- **A note is acting funny but its LED is fine**<br />
  Since the LED lights, the timer circuit is getting power, so it must be its components. Check solder joints and components for damage. Try swapping its 555 with a known-good note.
