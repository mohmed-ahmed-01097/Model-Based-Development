# Model-Based-Development

## Overview

This repository is dedicated to my studies and projects related to Model-Based Development (MBD). Model-Based Development is an approach to system development where models serve as the primary artifacts throughout the development process. This README provides an overview of the contents of the repository and guidance on how to navigate through the different components.

---
# Program Progress

```text
1. MBD Concepts Module                              ████████████████████  100% ✅(Completed)
2. MATLAB Basics Module                             ████████████████████  100% ✅(Completed)
3. Simulink Basics Module                           ████████████████████  100% ✅(Completed)
4. Arduino Simulink Interface Module                ████████████████████  100% ✅(Completed)
5. PID Controller Design Module                     ████████████████████  100% ✅(Completed)
6. MATLAB Scripting Module                          ████████████████████  100% ✅(Completed)
7. System Modeling & Model Architecture Module      █░░░░░░░░░░░░░░░░░░░   10% 🔄(In Progress)
8. Stateflow Design Module                          ░░░░░░░░░░░░░░░░░░░░    0% ⏳(Waiting)
9. C Programming Overview Module                    ░░░░░░░░░░░░░░░░░░░░    0% ⏳(Waiting)
10. Embedded Coder Module                           ░░░░░░░░░░░░░░░░░░░░    0% ⏳(Waiting)
11. Graduation Project (Battery Management System)  ░░░░░░░░░░░░░░░░░░░░    0% ⏳(Waiting)
```

✅ **Completed** 🔄 **In Progress** **⏳ Orange Circle** 🚧 **Blocked**

---

## Table of Contents

1. [Introduction to Model-Based Development](#introduction-to-model-based-development)
2. [Projects](#projects)
3. [Folder Structure](#folder-structure)
4. [Getting Started](#getting-started)
5. [Contributing](#contributing)
6. [License](LICENSE.md)

---

## Introduction to Model-Based Development

Model-Based Development (MBD) is a methodology that uses models as the core artifacts in the development process. It involves creating abstract representations of a system and using these models for analysis, design, and implementation. This section provides a brief introduction to MBD and its benefits.

## Projects

### [Project 1: [MATLAB Module]](projects/project1 MATLAB Module/)

* [Simple Robotics Simulation application](projects/project1 MATLAB Module/Simple Robotics Simulation application)
  * Users can input the lengths of two links into the Simple Robotics Simulation application to watch the robot move over a set simulation duration. Two arms draw an ellipse.
* [Plot Flags](projects/project1 MATLAB Module/Plot Flags)
  * design two national flags using MATLAB’s plotting capabilities..

### [Project 2: [Simulink Module]](projects/project2 Simulink Module/)

* [Mass Spring Damper System](projects/project2 Simulink Module/Mass Spring Damper System)
  * Modeling the Mass Spring with the Damper.
* [SEDC Motor](projects/project2 Simulink Module/SEDC Motor)
  * Representing the electrical and mechanical components of the separately excited DC motor system.
* [Simple Pendulum Motion](projects/project2 Simulink Module/Simple Pendulum Motion) 
  * Simulating the motion of a simple pendulum using MATLAB and Simulink.
* [Simple RC Circuit](projects/project2 Simulink Module/Simple RC Circuit)
  * model and simulate a simple RC (Resistor-Capacitor) circuit. 
* [Temperature Control System](projects/project2 Simulink Module/Temperature Control System)
  * design a temperature control system using MATLAB/Simulink, and then explore code generation and deployment using MATLAB's Embedded Coder with the Quick Start tool.
* [Automated Irrigation Control System](projects/project2 Simulink Module/Automated Irrigation Control System)
  * design an automated irrigation control system using MATLAB/Simulink and explore code generation and deployment with MATLAB's Embedded Coder and the Quick Start tool.
* [Energy Management Strategy](projects/project2 Simulink Module/Energy Management Strategy)
  * design an Energy Management Strategy (EMS) model for distributing power demand among a battery, ultracapacitor, and fuel cell, ensuring positive power output and efficient load distribution.

### [Project 3: [Arduino Module]](projects/project3 Arduino Module/)

* [Traffic Light](projects/project3 Arduino Module/Traffic Light)
  * simulate a complex traffic light system using Arduino and LEDs.
* [IO Interface](projects/project3 Arduino Module/IO Interface)
  * small examples using LEDs, Buttons, and Potentiometer, to cover the Digital Input/Output , PWM and Analog Read Concepts.
* [DC Motor](projects/project3 Arduino Module/DC Motor)
  * simulate a DC Motor Control (ON/OFF, Direction, and Speed).
* [Car Blinker](projects/project3 Arduino Module/Car Blinker)
  * design a Simulink model for a Car Blinker.

### [Project 3: [PID Control Module]](projects/project4 PID Control Module/)

* [First Order](projects/project4 PID Control Module/First Order)
  * model a first-order system, analyze its time response, and observe the effects of different system parameters on its behavior.
* [Second Order](projects/project4 PID Control Module/Second Order)
  * model a second-order system, analyze its time response, and observe the effects of different system parameters on its behavior.
* [Open-Closed Loop](projects/project4 PID Control Module/Open-Closed Loop)
  * illustrate the distinction between open-loop and closed-loop systems without incorporating controllers using MATLAB and Simulink.
* [PID_Control](projects/project4 PID Control Module/PID_Control)
  * comprehend and compare the functionalities of P-Controller, I-Controller, and D-Controller through MATLAB and Simulink simulations using a First/Second-order system.

### [Project 3: [MATLAB Script Module]](projects/project5 MATLAB Script Module/)

* [Add Two Numbers](projects/project4 PID Control Module/Add Two Numbers)
  * programmatically create a model that contains “Add Two Numbers” block with mask.
* [PID Control](projects/project4 PID Control Module/PID Control)
  * create a MATLAB script that generates a Simulink model for a simple PID control system.

...

## Folder Structure

- `/projects`: Contains subdirectories for each individual project.
  - `/project1`: MATLAB Module.
  - `/project2`: Simulink Module.
  - `/project3`: Arduino Module.
- `/docs`: Additional documentation related to the projects or MBD concepts.
- `/scripts`: Any scripts or tools used in the development process.
- `/examples`: Code examples or model files that illustrate specific concepts.
