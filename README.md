![IMG_20251230_200608](https://github.com/user-attachments/assets/ddc5b768-48b0-4116-b294-25a2aaa7dd15)# ADuC V3/V4 Assembly Exercises

A set of simple **8051/ADuC V3/V4 assembly** exercises for learning basic embedded I/O: reading switches and controlling LEDs (with delays).

## Hardware Setup (Photo)

![ADuC board setup]![IMG_20251230_200608](https://github.com/user-attachments/assets/57455ca7-e9ea-4171-917f-760a10561b36)


*Laptop + ADuC V3/V4 board connected via USB during testing.*

## Files

- **exercise1.asm** — Reads switch values from **P0** and outputs them to LEDs on **P2**.
- **exercise2.asm** — LED blinking (ON/OFF) using a delay routine.
- **exercise3.asm** — LED blinking with delay controlled by the **A register**.
- **exercise4.asm** — Variable delay blink using switch input (**P0 → A**).
- **exercise5.asm** — Running light pattern on LEDs with delays.

## Notes

All exercises include:
```asm
#include "c:\aducgd1.inc"

#include "c:\aducgd1.inc"
