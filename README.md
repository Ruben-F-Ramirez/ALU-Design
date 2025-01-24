# 16-Bit Arithmetic Logic Unit (ALU) Design

This repository contains the implementation and simulation of a 16-bit Arithmetic Logic Unit (ALU) using VHDL. The ALU supports arithmetic, logical, and shift operations, with a clear and structured design to facilitate learning and development in digital circuit design.

## Overview

The 16-bit ALU performs operations based on two 16-bit inputs (`A` and `B`), a 1-bit mode selector, and a 3-bit opcode. The design includes:
- **Arithmetic operations**: Multiplication, addition, subtraction, and incrementation.
- **Logical operations**: AND, OR, NAND, NOR, XOR, XNOR, NOT A, and NOT B.
- **Shift operations**: Logical shifts (left and right) and rotations (left and right).

### Block Diagram

A block diagram illustrating the ALU architecture is included in the documentation. Key components include:
- Arithmetic Unit
- Logic Unit
- Shifter Unit
- ALU Controller
- 16-bit 2:1 multiplexers

## Features

- **Modular Design**: The ALU is composed of distinct components, each handling specific operations.
- **VHDL Implementation**: All components and testbenches are written in VHDL.
- **Test Benches**: Comprehensive testbenches simulate and verify the functionality of each unit.
- **Scalability**: The modular nature of the design allows for future enhancements.

### Supported Operations

| Mode | Opcode | Operation       |
|------|--------|-----------------|
| 0    | 000    | A NOR B         |
| 0    | 001    | A NAND B        |
| 0    | 010    | A OR B          |
| 0    | 011    | A AND B         |
| 0    | 100    | A XOR B         |
| 0    | 101    | A XNOR B        |
| 0    | 110    | NOT A           |
| 0    | 111    | NOT B           |
| 1    | 000    | A * B (8-bit)   |
| 1    | 001    | A + B           |
| 1    | 010    | A - B           |
| 1    | 011    | Increment A     |
| 1    | 100    | Shift Left      |
| 1    | 101    | Shift Right     |
| 1    | 110    | Rotate Left     |
| 1    | 111    | Rotate Right    |

## Repository Contents

- `control_unit.vhdl`: VHDL implementation of the ALU control unit.
- `alu.vhdl`: Main ALU design integrating all components.
- `arithmetic_unit.vhdl`: Implementation of the arithmetic operations.
- `logic_unit.vhdl`: Implementation of logical operations.
- `shift_unit.vhdl`: Implementation of shift and rotate operations.
- `and_gate.vhdl`: Simple AND gate for internal logic.
- `mux_2_1.vhdl`: 2-to-1 multiplexer design.
- Test benches:
  - `control_unit_tb.vhdl`
  - `alu_tb.vhdl`
  - `and_gate_tb.vhdl`
- Simulation waveforms and outputs.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/16-bit-alu.git
2. Open the project in your preferred VHDL IDE or simulator.
3. Compile and simulate the test benches to validate functionality.
4. Modify or extend the design as needed.

## Test and Simulation

Each unit is tested with a dedicated test bench. The `alu_tb.vhdl` file verifies the complete ALU functionality. Waveform outputs for logical, arithmetic, and shift operations are included for reference.

## Future Enhancements

- Support for additional arithmetic and logical operations.
- Enhanced test coverage for edge cases.
- Integration with larger digital systems.

## Contributions

Contributions to this project are welcome! Please fork the repository, make your changes, and submit a pull request. Ensure that your code is well-documented and includes test cases for any new functionality.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Author

Ruben Ramirez  
---

Feel free to contribute or raise issues for improvements!

