ADuC832 LED Control Projects ✨💡

Welcome to the ADuC832 LED Control Projects repository! This collection features a series of assembly programs for controlling LED patterns on the ADuC832 V3/4 board. Each project demonstrates different LED behaviors like blinking, running lights, and interactive patterns using various assembly instructions.

## Hardware Setup (Photo)

![ADuC832 V4 board setup]![IMG_20251230_200608](https://github.com/user-attachments/assets/57455ca7-e9ea-4171-917f-760a10561b36)

Files Overview 📂📑

exercise1.asm: A simple program that reads switches (P0) and displays the data on LEDs (P2). Continuously updates the LED display. 🔄💡

exercise2.asm: Flashing LEDs without delay. The LEDs alternate between "0" and "1", creating a basic blinking effect. 💡🔁

exercise3.asm: LEDs with added delays, creating a more noticeable blinking effect between the on and off states. ⏳💡

exercise4.asm: Running light pattern. LEDs light up in a left-to-right sequence, controlled by switches (P0), which adjust the speed of the effect. 🏃‍♂️💡

exercise5.asm: A complex running light pattern with a series of shifting LED states, creating a moving light effect. 🌈💡

exercise6.asm: LED blinking with alternating fast and slow patterns. The LEDs blink 3 times fast, then 3 times slowly, and repeat the cycle. ⚡💡

exercise7.asm: "Knight Rider" LED pattern, where LEDs light up in sequence and reverse. Adjustable speed via delay. 🎬💡

exercise8.asm: Displays a "Star Trek-like" LED pattern using values stored in a lookup table. The sequence repeats with a controlled delay. 🚀💡

exercise9.asm: Usage of the "cjne" instruction. Displays a running light stored in a lookup table and checks for a "forbidden code" to detect the table's end. 🔍💡

exercise10.asm: Displays two 8-bit counters (one counts up, the other counts down). Shows the counters' values in both BCD and HEX on the display. 🔢💡

exercise11.asm: Displays two 16-bit counters (one counts up, the other counts down). Prints their values in BCD and HEX on the display. 🔢💡

exercise12.asm: Displays a real-time clock on the LCD that counts in hh:mm:ss. The clock starts from 23:59:56 and uses software delay for timing. ╰️💡

exercise13.asm: Prints team members' names on the display, exploring background and front color adjustments. 🖍️💡

exercise14.asm: Displays an 8-bit counter on the display that increments every time a button (P0.7) is pressed, with debounce handling. 🖲️💡

exercise15.asm: Demonstrates the use of jb and jnb instructions. Switches (P0.4–P0.7) are used to select one out of four different running LED light patterns in real time. The selected pattern can be changed while the program is running. 🔀💡

exercise16.asm: Introduces basic ADC (Analog-to-Digital Converter) usage. Reads an analog input from a potentiometer and displays the raw ADC value on the LCD after basic processing. 🎛️📟

exercise17.asm: Implements a digital voltmeter using the ADC. Converts the analog input into a voltage value (0.000 V to 4.998 V) and displays the result in volts on the LCD. ⚡📟

exercise18.asm: Reads temperature sensor (LM335) data using the ADC and displays the sensor output in hexadecimal format on the LCD. 🌡️🔢

exercise19.asm: Extends ADC usage to convert LM335 sensor readings into Kelvin temperature values and displays them on the LCD. 🌡️📟

exercise20.asm: Displays a real-time clock (hh:mm:ss) on the LCD using the TIC (Timer Interval Counter). The clock starts from a predefined time and runs continuously without interrupts. ⏰📟

exercise21.asm: Uses interrupts to control multiple tasks. An ISR updates a running LED light every second, while the main program displays a decimal counter (00–99) on the LCD with a software delay. ⏱️💡📟

exercise22.asm: Combines clock display and interrupt-driven LED control. The main program shows a real-time clock on the LCD, while the ISR toggles LEDs at a variable speed controlled by a potentiometer. ⏰🎛️💡

exercise23.asm: Runs a “running light” (LED chase) continuously with no delay in the main loop, while an RTC (TIC) interrupt service routine updates and prints the clock (HH:MM:SS) on the LCD every ½ second. 💡🔁⏱️📟

Embedded Systems Fundamentals 💻🔧

This repository is designed for learning and experimenting with Embedded Systems Fundamentals, especially using microcontrollers like the ADuC832 V3/4. It covers basic concepts essential for understanding and working with embedded systems, including:

Microcontroller Programming: All programs are written in assembly language, allowing for low-level control of the hardware. Understanding assembly language is critical for efficient programming in embedded systems. 📚💻

Port Configuration and Control: The programs interact with ports (P0 and P2) on the ADuC832 microcontroller, demonstrating basic I/O operations, which are foundational in embedded systems. 🔌🔧

Delay Functions: The use of delay functions (e.g., delaya0k05s) to control timing and sequencing of operations helps demonstrate how embedded systems manage time-dependent behaviors. ⏳🕹️

LED Control and Patterns: The programs generate various LED patterns using simple logic and looping, a common use case in embedded systems to display statuses or debug information visually. 💡✨

Switch Input and Control: Some of the exercises use switches (P0) to control the behavior of the LEDs, showing how embedded systems interact with user inputs. 🖲️👆

Looping and Conditional Operations: The programs use looping structures (like ljmp, djnz) and conditional operations to execute tasks repeatedly or based on certain conditions, which is a key characteristic of embedded system operations. 🔄⚙️

Requirements 🖥️🔧

ADuC832 V3/4 board 🖥️

Assembler and IDE compatible with ADuC832 to assemble and run the programs ⚙️

Functionality 🎮🔧

Each program demonstrates different LED control techniques such as blinking, running lights, and sequential patterns. The delay function delaya0k05s provides time delays of 0.05 seconds, which can be modified to adjust the speed. ⚡💡

Notes 📋

LEDs are connected to P2, and switches are connected to P0 on the ADuC832 board. 💡🔌

The programs are written in assembly for the ADuC832 microcontroller and utilize its specific instruction set. 📝⚙️

The programs are designed to be simple, yet versatile, showcasing fundamental microcontroller operations. 💡🔧

