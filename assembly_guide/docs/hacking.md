---
id: hacking
title: "Appendix: Hacking"
sidebar_label: Hacking
description: Hacking ideas for the POLY555
image: /img/hacking/gain-cap.jpg
---

:::warning
Do these at your own risk, hacker! You could very well break your POLY555!
:::

Your POLY555 can be hacked! Here are some ideas:

- You know the timers are tuned with their trimpots, but **how can we make them a different octave?** Try swapping their 4.7uF cap out to a higher value, maybe 10uF — higher values = lower frequency. You’ll probably want to play with the 100ohm resistor too; it sums with the trimpot and provides a “ceiling” that prevents you from tuning too high. Google the frequency formula for a 555 astable with 50/50 duty cycle for the math on how it all works.
- If you have a switching audio jack, **you could rig up an audio output** that’s separate from the speaker. Good luck on mounting it inside the enclosure, though; there's not a ton of spare room!
- **Want more volume?**
  - According to the [LM386 datasheet](https://www.ti.com/lit/ds/symlink/lm386.pdf) it has a default gain of 20 (26 dB), but, "if a capacitor is put from pin 1 to 8... the gain will go up to 200 (46 dB)".
  - If your kit came with a spare 4.7uF capacitor, try that or any similar value. [![Amp gain cap](/img/hacking/gain-cap.jpg)](/img/hacking/gain-cap.jpg)
  - The 9.2.2 schematic in the datasheet has the cap's positive lead on pin 1, but polarity seems to not matter much in practice.
