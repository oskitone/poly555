---
id: debugging
title: "Appendix: Debugging"
sidebar_label: Debugging
---

Stuck? Happens to the best of us. Try these general debugging steps:

- Turn the boards over and check all solder joints. A majority of problems are caused by insufficient or errant soldering. Familiarize yourself with what a good joint looks like in the [Adafruit Guide To Excellent Soldering](https://learn.adafruit.com/adafruit-guide-excellent-soldering)
- Are all chips in the right orientation? Each has a notch/dimple that should match the footprint outline on the PCB.
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
- **The LEDs light up when pressing keys but no sounds come out**<br />
    1. Confirm the speaker itself isn't broken
        * On the POLY555, you can try skipping the amp circuit by pulling the 386 out of its socket and connecting its pin 5 (the amp's output that would normally go to the big capacitor at C64 and then the speaker) to pin 3 (the 555's output) of one of the 555s. It won't be loud (because it's not amplified anymore), but, if the speaker isn't broken, there should be a low rumble.
        * Alternatively, you can also try hooking the POLY555's speaker up to the headphone output of another small music device.
    2. Confirm the 386 and volume pot aren't broken
        * With the 386 chip back in its socket, try shorting the left two pins of the volume pot at RV21.
        * If it's LOUD when playing, that means the 386 is working but the volume pot is broken. Swap it with a spare.
        * If it's still muted but the test above confirmed the speaker works, the 386 might be fried or its circuit needs some re-solder work.
- **The high notes are too low and can't be tuned any higher**<br />
  Try changing the battery!

## Something else?

[Contact me](https://www.oskitone.com/contact)! The more I hear about what problems folks run into, the better I can make the assembly guide! :)
