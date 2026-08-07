# AHB-Lite Based Multi-Slave Bus Interconnect on FPGA Using Verilog HDL

## Overview

This project implements an **AHB-Lite (Advanced High-performance Bus Lite) Multi-Slave Bus Interconnect** on the **Digilent Nexys A7 FPGA** using **Verilog HDL**. The design consists of an AHB Master communicating with multiple AHB Slaves through an Address Decoder and Multiplexer. Two peripherals are implemented as AHB slaves:

- Seven-Segment Display Slave
- PWM (Pulse Width Modulation) Slave

The project demonstrates AHB-Lite bus transactions, address decoding, peripheral interfacing, and FPGA-based hardware implementation.

---

## Features

- AHB-Lite Master
- AHB Address Decoder
- AHB Multiplexer
- Seven-Segment Display Slave
- PWM Slave
- Seven-Segment Display Driver
- Seven-Segment Decoder
- PWM Generator
- FPGA Hardware Verification
- Modular Verilog HDL Design

---

## Hardware Used

- FPGA Board : Digilent Nexys A7-100T
- FPGA Device : Xilinx Artix-7
- Tool : Xilinx Vivado
- Language : Verilog HDL

---

## Project Architecture

```
                 +------------------+
                 |    AHB Master    |
                 +---------+--------+
                           |
                           |
                 +---------v--------+
                 |  Address Decoder |
                 +---------+--------+
                           |
           +---------------+---------------+
           |                               |
           |                               |
   +-------v-------+               +-------v-------+
   | 7-Segment     |               | PWM           |
   | AHB Slave     |               | AHB Slave     |
   +-------+-------+               +-------+-------+
           |                               |
           |                               |
+----------v---------+            +---------v---------+
| Seven Segment      |            | PWM Generator     |
| Driver & Decoder   |            |                   |
+--------------------+            +-------------------+
```

---

## Address Map

| Address | Slave |
|----------|-------------------------|
| 0x20 | Seven-Segment Display Slave |
| 0x30 | PWM Slave |

---

## Seven-Segment Display Operation

Set the address to **0x20** and provide a 4-bit data value.

| Data | Display |
|------|----------|
|0000|0|
|0001|1|
|0010|2|
|0011|3|
|0100|4|
|0101|5|
|0110|6|
|0111|7|
|1000|8|
|1001|9|
|1010|A|
|1011|b|
|1100|C|
|1101|d|
|1110|E|
|1111|F|

---

## PWM Operation

Set the address to **0x30**.

| Data | Duty Cycle |
|------|------------|
|00|25%|
|01|50%|
|10|75%|
|11|100%|

---

## Repository Structure

```
AHB-Lite-Multi-Slave-Bus-Interconnect
│
├── RTL
│   ├── ahb_master.v
│   ├── ahb_decoder.v
│   ├── ahb_multiplexer.v
│   ├── ahb_7seg_slave.v
│   ├── ahb_pwm_slave.v
│   ├── seven_segment_driver.v
│   ├── seven_segment_decoder.v
│   ├── pwm_generator.v
│   └── top_module.v
│
├── Constraints
│   └── NexysA7.xdc  
│
├── Images
│   ├── Block_Diagram.png
│   ├── SevenSegment_Output.jpg
│   └── PWM_Output.jpg
│
└── README.md
```

---

## Results

- Successfully implemented on Digilent Nexys A7 FPGA.
- Verified AHB-Lite write transactions.
- Seven-segment display correctly displays hexadecimal values (0–F).
- PWM output successfully generates multiple duty cycles.
- Verified hardware functionality using on-board switches, push buttons, seven-segment display, and PWM output.

---

## Applications

- FPGA-Based Embedded Systems
- AMBA Bus Design
- Digital System Design
- VLSI Design
- Peripheral Interface Design
- FPGA Prototyping

---

## Future Enhancements

- Add UART Slave
- Add GPIO Slave
- Add Timer Peripheral
- Add AHB Read Transactions
- Support Multiple Additional Slaves
- Add Interrupt Controller


