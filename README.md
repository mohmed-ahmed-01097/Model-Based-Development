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
7. System Modeling & Model Architecture Module      ████████████████████  100% ✅(Completed)
8. Stateflow Design Module                          ████████████████████  100% ✅(Completed)
9. Embedded Coder Module                            ████████████████████  100% ✅(Completed)
10. C Programming Overview Module                   ████████████████████  100% ✅(Completed)
11. Graduation Project (Battery Management System)  ░░░░░░░░░░░░░░░░░░░░    0% 🔄(In Progress)
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

### [Project 1: [MATLAB Module]](projects/project1%20MATLAB%20Module/)

* [Simple Robotics Simulation application](projects/project1%20MATLAB%20Module/Simple%20Robotics%20Simulation%20application)
  * Users can input the lengths of two links into the Simple Robotics Simulation application to watch the robot move over a set simulation duration. Two arms draw an ellipse.
* [Plot Flags](projects/project1%20MATLAB%20Module/Plot%20Flags)
  * design two national flags using MATLAB’s plotting capabilities..

### [Project 2: [Simulink Module]](projects/project2%20Simulink%20Module/)

* [Mass Spring Damper System](projects/project2%20Simulink%20Module/Mass%20Spring%20Damper%20System)
  * Modeling the Mass Spring with the Damper.
* [SEDC Motor](projects/project2%20Simulink%20Module/SEDC%20Motor)
  * Representing the electrical and mechanical components of the separately excited DC motor system.
* [Simple Pendulum Motion](projects/project2%20Simulink%20Module/Simple%20Pendulum%20Motion) 
  * Simulating the motion of a simple pendulum using MATLAB and Simulink.
* [Simple RC Circuit](projects/project2%20Simulink%20Module/Simple%20RC%20Circuit)
  * model and simulate a simple RC (Resistor-Capacitor) circuit. 
* [Temperature Control System](projects/project2%20Simulink%20Module/Temperature%20Control%20System)
  * design a temperature control system using MATLAB/Simulink, and then explore code generation and deployment using MATLAB's Embedded Coder with the Quick Start tool.
* [Automated Irrigation Control System](projects/project2%20Simulink%20Module/Automated%20Irrigation%20Control%20System)
  * design an automated irrigation control system using MATLAB/Simulink and explore code generation and deployment with MATLAB's Embedded Coder and the Quick Start tool.
* [Energy Management Strategy](projects/project2%20Simulink%20Module/Energy%20Management%20Strategy)
  * design an Energy Management Strategy (EMS) model for distributing power demand among a battery, ultracapacitor, and fuel cell, ensuring positive power output and efficient load distribution.

### [Project 3: [Arduino Module]](projects/project3%20Arduino%20Module/)

* [Traffic Light](projects/project3%20Arduino%20Module/Traffic%20Light)
  * simulate a complex traffic light system using Arduino and LEDs.
* [IO Interface](projects/project3%20Arduino%20Module/IO%20Interface)
  * small examples using LEDs, Buttons, and Potentiometer, to cover the Digital Input/Output , PWM and Analog Read Concepts.
* [DC Motor](projects/project3%20Arduino%20Module/DC%20Motor)
  * simulate a DC Motor Control (ON/OFF, Direction, and Speed).
* [Car Blinker](projects/project3%20Arduino%20Module/Car%20Blinker)
  * design a Simulink model for a Car Blinker.

### [Project 4: [PID Control Module]](projects/project4%20PID%20Control%20Module/)

* [First Order](projects/project4%20PID%20Control%20Module/First%20Order)
  * model a first-order system, analyze its time response, and observe the effects of different system parameters on its behavior.
* [Second Order](projects/project4%20PID%20Control%20Module/Second%20Order)
  * model a second-order system, analyze its time response, and observe the effects of different system parameters on its behavior.
* [Open-Closed Loop](projects/project4%20PID%20Control%20Module/Open-Closed%20Loop)
  * illustrate the distinction between open-loop and closed-loop systems without incorporating controllers using MATLAB and Simulink.
* [PID_Control](projects/project4%20PID%20Control%20Module/PID_Control)
  * comprehend and compare the functionalities of P-Controller, I-Controller, and D-Controller through MATLAB and Simulink simulations using a First/Second-order system.

### [Project 5: [MATLAB Script Module]](projects/project5%20MATLAB%20Script%20Module/)

* [Add Two Numbers](projects/project5%20MATLAB%20Script%20Module/Add%20Two%20Numbers)
  * programmatically create a model that contains " Add Two Numbers " block with mask.
* [PID Control](projects/project5%20MATLAB%20Script%20Module/PID%20Control)
  * create a MATLAB script that generates a Simulink model for a simple PID control system.

### [Project 6: [System Modeling Module]](projects/project6%20System%20Modeling%20Module/)

Create the Model, and MIL & SIL Test Harness of this systems.

* [Accelerator Pedal Position Sensor](projects/project6%20System%20Modeling%20Module/Accelerator%20Pedal%20Position%20Sensor)
  * a critical component in modern automotive systems, providing input to the
    engine control unit (ECU) about the driver's intended acceleration.
* [Simple Wiper Control System](projects/project6%20System%20Modeling%20Module/Simple%20Wiper%20Control%20System)
  * manages the operation of windshield wipers in vehicles to ensure visibility in adverse weather.

* [Throttle Position Sensors](projects/project6%20System%20Modeling%20Module/Throttle%20Position%20Sensors)
  * manages the Measurement of throttle Position in vehicles to control the flow of the fuel.
* [Series RLC Resonant Circuit](projects/project6%20System%20Modeling%20Module/Series%20RLC%20Resonant%20Circuit)
  * simulate the resonant circuit and display the current waveform as we change the frequency
    dynamically.
* [Counter Up/Down](projects/project6%20System%20Modeling%20Module/Counter%20UpDown)
  * Implement a counter in Simulink that increments on each rising edge of a signal representing a button press and resets to zero when another button is pressed.

* [Zero-Cross Detection](projects/project6%20System%20Modeling%20Module/Zero-Cross%20Detection)
  * implementing a zero-cross detection system using Enabled Subsystem.
* [Comprehensive PMSM Control](projects/project6%20System%20Modeling%20Module/Comprehensive%20PMSM%20Control)
  * Implement and analyze an advanced control system for a Permanent Magnet Synchronous Motor (PMSM) using Simulink.
  * Implement Flux, Position, and Electrical Speed Observer to include rotor position and electrical speed estimation.
  * Implement the ABC to Alpha-Beta transformation block.

### [Project 7: [Stateflow Design Module]](projects/project7%20Stateflow%20Design%20Module/)

* [LED_Toggle](projects/project7%20Stateflow%20Design%20Module/LED_Toggle)
  
  * build state machine to model the blink led every 0.5 sec application
  
* [Traffic_Light](projects/project7%20Stateflow%20Design%20Module/Traffic_Light)
  
  * implement the traffic light with two State machine:
    * Normal State (Stop State - Go State - Prepare to Stop State)
    * Fault State (On state - Off State)
  
* [Zero-Cross Detection](projects/project7%20Stateflow%20Design%20Module/Zero-Cross%20Detection)
  
  * Implemented a state machine for zero-cross detection.
  
* [Up/Down Counter](projects/project7%20Stateflow%20Design%20Module/Up_Down%20Counter)
  
  - Developed a Simulink counter that increments on each rising edge of a button press and resets when triggered by another signal.
  
* [Solar Panel Tracker](projects/project7%20Stateflow%20Design%20Module/Solar%20Panel%20Tracker)
  
  * Design and simulate a solar panel tracking system utilizing four Light Dependent Resistor (LDR) sensors and a servo motor to optimize the solar panel's orientation for maximum sunlight exposure.
  
* [Accelerator Pedal Position Sensor](projects/project7%20Stateflow%20Design%20Module/Accelerator%20Pedal%20Position%20Sensor)
  
  * Design and simulate the Accelerator Pedal Position Sensor Logic using Flow Chart.
  
* [Cruise Control System](projects/project7%20Stateflow%20Design%20Module/Cruise%20Control%20System)
  
  * model the dynamic behavior of a vehicle's speed control system, considering various operating modes, user inputs, fault detection, and enhanced cruise control operation.
  
* [Cell Balancing](projects/project7%20Stateflow%20Design%20Module/Cell%20Balancing)
  
  * Explored both passive and active cell balancing techniques to improve battery management efficiency.
  
  ### [Project 8: [Embedded Coder Module]](projects/project8%20Embedded%20Coder%20Module/)
  
  * [Traffic Jam Assistant](projects/project8%20Embedded%20Coder%20Module/Traffic_Jam_Assistant)
    * Developed a model to manage stop-and-go traffic, integrating adaptive cruise control (ACC) and lane keeping features.
  * [Vehicle Direction Detection](projects/project8%20Embedded%20Coder%20Module/Vehicle_Direction_Detection)
    * Created a system that uses camera input to determine vehicle direction and enhance autonomous driving functions.
  * [Adaptive Cruise Control](projects/project8%20Embedded%20Coder%20Module/Adaptive_Cruise_Control)
    * Designed and simulated an ACC feature to automatically adjust vehicle speed based on surrounding traffic conditions.
  * [Lane Changing Assistant](projects/project8%20Embedded%20Coder%20Module/Lane_Changing_Assistant)
    * Developed a model to support safe lane changes using radar and camera inputs, complete with a comprehensive display unit.
  
  ...
  
  ## Folder Structure
  
  - `/projects`: Contains subdirectories for each individual project.
    - `/project1`: MATLAB Module.
    - `/project2`: Simulink Module.
    - `/project3`: Arduino Module.
    - `/project4`: PID Control Module.
    - `/project5`: MATLAB Script Module.
    - `/project6`: System Modeling Module.
    - `/project7`: Stateflow Design Module.
    - `/project8`: Embedded Coder Module.

- `/docs`: Additional documentation related to the projects or MBD concepts.
- `/scripts`: Any scripts or tools used in the development process.
- `/examples`: Code examples or model files that illustrate specific concepts.
