# Strategy MUX4:1

## Establishing common ground - Strategy definitions
----------

The verification strategy must accomplish the definition of three elements:
* Verification requirements - which metrics will be verified
    - Functional
    - Power
    - Area
    - Performance
    - Safety
    - Security
* Verification technologies - how the evaluation will be performed
    - Simulation
    - Formal
    - Emulation
    - FPGA prototype
* Verification abstractions - the abstraction level of design
    - IP/Unit
    - Cluster
    - SoC


## Verification Requirements
----------
The strategy for the verification plan to the mux block will cover the functional correctness for the following operations:
*  Input selection
*  Output range for each input

## Verification Tecnologies
----------
The verification process will be executed by the simulation of the design in the Cadence XCelium Simulator.


## Verification Abstractions
----------
The verification process will be executed on the MUX4:1 block mounted on testbench top without any other block or structure attached. 


[Back to Main](readme.md)