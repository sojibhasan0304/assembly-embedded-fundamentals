# ADuC V3/V4 Assembly Exercises

A small collection of **8051/ADuC V3/V4 assembly** exercises for learning basic embedded I/O using the ADuC board.

![IMG_20251230_200608](https://github.com/user-attachments/assets/477c5372-85bc-4361-b4b2-6b539b1742f8)

## What’s inside

These programs focus on reading switches (P0) and controlling LEDs (P2), plus adding delays.

### Exercises
- **exercise1.asm** — Read switches on **P0** and write directly to LEDs on **P2**.
- **exercise2.asm** — Blink LEDs (ON/OFF). Uses delay routine.
- **exercise3.asm** — Blink LEDs with a configurable delay (delay depends on value in **A** register).
- **exercise4.asm** — Variable delay blink: delay is read from switches (**P0 → A**).
- **exercise5.asm** — Running light pattern on LEDs with delays.

## Requirements
- ADuC V3/V4 board (or compatible setup)
- Keil / Read51 (or your course IDE)
- `aducgd1.inc` include file available on your system

## Notes about the include file
All exercises use:
```asm
#include "c:\aducgd1.inc"
