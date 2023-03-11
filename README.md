# 16-Bit Arithmetic Logic Unit & Tester

### SUTD CSD 2023 Computation Structures 1D ALU Project.

### Team 16:

- Shwetha Suresh Iyer
- Nada Khan Suratee
- Kishen s/o Durairajoo
- Aisiri Deb Barma
- Tan Hao Yi
- Natalie Ang Zi Yi



## Introduction

We implemented a 16-bit arithmetic logic unit (ALU) and its tester in Alchitry Au FPGA.



## Features

This is the instruction set for the ALU.

| ALUFN[5:0] | Operation              | Module       |
| ---------- | ---------------------- | ------------ |
| 00 00X0    | ADD                    | adder16      |
| 00 00X1    | SUBTRACT               | adder16      |
| 00 0100    | MULTIPLY               | multiplier16 |
| 00 0101    | FLOOR DIVISION         | multiplier16 |
| 01 0001    | NOR                    | boolean16    |
| 01 0110    | XOR                    | boolean16    |
| 01 0111    | NAND                   | boolean16    |
| 01 1000    | AND                    | boolean16    |
| 01 1001    | XNOR                   | boolean16    |
| 01 1010    | 'X'                    | boolean16    |
| 01 1110    | OR                     | boolean16    |
| 10 0000    | SHIFT LEFT             | shifter16    |
| 10 0001    | SHIFT RIGHT            | shifter16    |
| 10 0011    | SHIFT RIGHT ARITHMETIC | shifter16    |
| 11 001X    | CMPEQ                  | comparator16 |
| 11 010X    | CMPLT                  | comparator16 |
| 11 011X    | CMPLE                  | comparator16 |

> NOTE: The symbol X represents a bit whose value is insignificant, whether it is 0 or 1. This implies that the value of the X bit is not relevant or important to us.


## Testing

For the ALU tester, we also have two modes: manual and automatic.

> These are the in-built buttons of the Alchitry IO shield:
>
> - `io_button[0]` is the up/top button.
> - `io_button[1]` is the centre/middle button.
> - `io_button[2]` is the down/bottom button.
> - `io_button[3]` is the left button.
> - `io_button[4]` is the right button.

To switch between automatic and manual testing mode, press `io_button[2]`.

Pressing `io_button[0]` will trigger an error-catching state that serves the purpose of intentional error handling/checking. Regardless of the mode of testing, pressing the `io_button[0]` will cause an error.

- Procedure for Manual Testing
  - Select the associated OPCODE by using `io_dip[2][5:0]`.
  - Select the corresponding X and Y values by using `{io_dip[1], io_dip[0]}`. 
  - Press `io_button[1]` to confirm the selected input values of X and Y accordingly and switch between inputting X, inputting Y and displaying the OUTPUT. 
  - The `{io_led[1], io_led[0]}` will display the input values X and Y in real-time during their respective states. 
  - The values of `io_dip[2][7:6]` will display the current state 
    > 10 when inputting X, 01 when inputting Y, and 11 when displaying OUTPUT.
  - When the 7-segments display an "O" (i.e. at OUTPUT state), `{io_led[1], io_led[0]}` will display the resulting output of the ALU.

- Procedure for Automatic Testing
  - During automatic testing mode, the FSM will continuously cycle through the different test cases listed in the `auto_tester.luc` module. 
  - The 7-segments will cycle through this sequence for each test case: "X", INPUT_X, "Y", INPUT_Y, "O", EXPECTED_OUTPUT. 
  - As the automatic tester progresses through the pre-defined test cases, `io_led[2][5:0]` will display the current OPCODE function/instruction being tested. 
  - If an error is encountered, the letter "E" will be displayed on the 7-segments at the end of that test case. If the tester manages to go through all of the test cases successfully without any errors, the 7-segments will display a letter "d".
