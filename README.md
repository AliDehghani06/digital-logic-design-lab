# Digital Logic Design Lab

A collection of laboratory experiments developed for the **Digital Logic Design Laboratory** course, covering digital circuits, clock generation, HDL/RTL design, FPGA implementation, finite state machines, serial communication, simulation, synthesis, and waveform generation.

---

## 📖 Overview

This repository contains the implementations, simulation files, FPGA design files, and laboratory reports developed throughout the Digital Logic Design Laboratory course.

The experiments cover a progression from **basic hardware-based clock generation and digital circuits** to **HDL-based RTL design, FPGA implementation, finite state machines, serial transmission, and a programmable waveform generator**.

The repository is organized by laboratory session, with each lab containing its corresponding design files and documentation.

For detailed explanations of the theory, design procedure, implementation steps, simulation results, and experimental observations, please refer to the **`Description.pdf`** and **`Report.pdf`** files provided in each laboratory directory.

---

## 🧪 Laboratory Experiments

### Lab 1 — Clock Generation Using ICs and Analog Components

The first laboratory focuses on generating clock signals using discrete hardware components and integrated circuits.

Topics include:

* Ring Oscillator
* LM555 Timer
* Schmitt Trigger Oscillator
* Experimental clock generation
* Frequency variation using different component values

The laboratory includes circuit schematics and the corresponding experimental documentation.

**Documentation:**

* [`Description.pdf`](lab1/docs/Description.pdf)
* [`Report.pdf`](lab1/docs/Report.pdf)

---

### Lab 2 — Clock Generation Using HDL and FPGA Design

The second laboratory introduces hardware description languages and FPGA-based digital design.

The experiments cover:

#### HDL-Based Clock Generation

* Behavioral modeling
* RTL-based design
* Delay-based HDL modeling
* Simulation and verification

#### FPGA Design

* Synchronous counter as a frequency divider
* T Flip-Flop
* Seven-segment display
* FPGA implementation using Quartus
* RTL and post-compilation simulation

The laboratory also includes designs implemented using schematic-based FPGA development and HDL modules.

**Documentation:**

* [`Description.pdf`](lab2/docs/Description.pdf)
* [`Report.pdf`](lab2/docs/Report.pdf)

---

### Lab 3 — Serial Transmitter

The third laboratory focuses on designing a serial transmitter using RTL and finite-state-machine concepts.

The design is developed through several building blocks:

* One-Pulser
* Serial Transmitter
* Orthogonal Finite State Machine (OFSM)
* Seven-Segment Display
* RTL simulation
* FPGA synthesis
* Pre-synthesis simulation
* Post-synthesis simulation

The final design demonstrates the complete flow from RTL description to FPGA-oriented implementation and verification.

The laboratory also documents the use of **Quartus II** for:

* Project creation
* Compilation
* Pin assignment
* FPGA programming
* Timing analysis
* Resource examination

**Documentation:**

* [`Description.pdf`](lab3/docs/Description.pdf)
* [`Report.pdf`](lab3/docs/Report.pdf)

---

### Lab 4 — Programmable Waveform Generator

The fourth laboratory develops a more complete digital waveform-generation system.

The design is divided into several stages:

#### Waveform Generator

A digital waveform generation module based on a **Direct Digital Synthesis (DDS)** approach.

#### Frequency Selector

A module for selecting the desired output frequency.

#### Amplitude Selector

A module for controlling the output waveform amplitude.

#### Total Design

Integration of the individual components into a complete programmable waveform generator.

The final design combines:

* DDS
* Waveform generation
* Frequency selection
* Amplitude selection
* FPGA implementation
* RTL simulation
* Post-synthesis simulation

**Documentation:**

* [`Description.pdf`](lab4/docs/Description.pdf)
* [`Report.pdf`](lab4/docs/Report.pdf)

---

## 🛠️ Tools and Technologies

The experiments were developed and simulated using a combination of hardware and digital-design tools.

### Hardware & ICs

* 74LS04
* LM555 Timer
* Schmitt Trigger circuits
* Digital counters
* FPGA development board

### Hardware Description Languages

* Verilog HDL
* RTL design

### FPGA & EDA Tools

* Intel Quartus II
* ModelSim

### Design Concepts

* Digital Logic Design
* Clock Generation
* Oscillators
* RTL Modeling
* Finite State Machines
* Frequency Division
* Serial Communication
* Seven-Segment Displays
* FPGA Design
* Synthesis
* Timing Analysis
* Direct Digital Synthesis (DDS)

---

## 📁 Repository Structure

The repository is organized according to the laboratory sessions:

```text
digital-logic-design-lab/
│
├── lab1/
│   ├── circuit design files
│   └── docs/
│       ├── Description.pdf
│       └── Report.pdf
│
├── lab2/
│   ├── HDL designs
│   ├── FPGA designs
│   ├── ModelSim files
│   ├── Quartus projects
│   └── docs/
│       ├── Description.pdf
│       └── Report.pdf
│
├── lab3/
│   ├── RTL modules
│   ├── testbenches
│   ├── ModelSim files
│   ├── Quartus projects
│   └── docs/
│       ├── Description.pdf
│       └── Report.pdf
│
├── lab4/
│   ├── waveform generator
│   ├── frequency selector
│   ├── amplitude selector
│   ├── ModelSim files
│   ├── Quartus projects
│   └── docs/
│       ├── Description.pdf
│       └── Report.pdf
│
└── README.md
```

The individual experiment directories contain the source code, testbenches, schematic designs, FPGA project files, simulation-related files, and other resources associated with each experiment.

---

## 📚 Documentation

Each laboratory contains two main documentation files:

### `Description.pdf`

Contains the laboratory instructions and the required tasks and experiments.

### `Report.pdf`

Contains the completed laboratory report, including the implementation details, results, simulations, and observations.

For a more detailed understanding of any particular experiment, it is recommended to refer directly to the corresponding **laboratory description and report**.

> **The README provides a high-level overview of the repository, while the individual laboratory reports contain the detailed technical documentation and experimental results.**

---

## 🎯 Learning Objectives

Through these experiments, the following concepts and practical skills were developed:

* Understanding practical clock-generation techniques
* Working with digital ICs and analog components
* Designing digital systems using Verilog HDL
* Understanding RTL-based hardware modeling
* Creating and verifying testbenches
* Designing synchronous digital circuits
* Implementing frequency dividers
* Designing finite state machines
* Implementing serial communication systems
* Interfacing with seven-segment displays
* Developing FPGA-based digital systems
* Using Quartus II for synthesis and FPGA implementation
* Using ModelSim for RTL and post-synthesis simulation
* Examining timing and resource utilization
* Integrating multiple RTL modules into a larger hardware system
* Understanding the principles of Direct Digital Synthesis

---

## 🔬 Design Flow

Several of the HDL/FPGA experiments follow a typical digital hardware design flow:

```text
Specification
     │
     ▼
RTL / HDL Design
     │
     ▼
Testbench Development
     │
     ▼
Pre-Synthesis Simulation
     │
     ▼
Synthesis / Compilation
     │
     ▼
Post-Synthesis Simulation
     │
     ▼
FPGA Implementation
     │
     ▼
Timing & Resource Analysis
```

This workflow provides practical experience with the transition from a behavioral/RTL hardware description to an FPGA-implemented digital system.

---

## 🎓 Academic Context

This repository contains coursework developed as part of a **Digital Logic Design Laboratory** course.

The experiments are presented as an academic record of the design, implementation, simulation, and analysis work performed during the laboratory sessions.

The detailed laboratory instructions and completed reports are included in each lab directory for reference.

---

## 👤 Author

**Ali Dehghani**

Computer Engineering
University of Tehran

---

## 📌 Notes

* The repository is primarily intended for **educational and documentation purposes**.
* Some directories contain files automatically generated by ModelSim and Quartus II during compilation, synthesis, and simulation.
* The corresponding laboratory reports should be consulted for complete experimental details, theoretical background, implementation procedures, and results.
