# Final Project Proposal - a RISC-V Processor for ZYNQ
#### Taylore Todd & Emma Westerhoff

## Overview
We will implement the RISC-V ISA within a soft-core processor on the Zybo Z7 Development Board (Zynq XC7Z010). This will be a simple CPU that is capable of running C programs compiled offline and booted off of the micro-SD card. It will be a 5-stage pipeline processor. It will access some of the peripherals on the Zybo board, including LED0-3, BTN0-3, and SWITCH0-3. It will provide a UART output over the USB port. 

## ISA Selection
We will start by implementing the RV32E instruction set, as it is a reduced instruction set optimized for embedded programming. 

## Methodology
1. We will start by implementing a basic 5-stage pipelined CPU in VHDL; Instruction Fetch, Instruction Decode, Execute, Memory Access, Register Write-Back. 
    - We will write tests for each instruction using Vivado Testbenches. 
2. We will connect / exercise the mentioned peripherals.
    - We will write tests for each type of peripheral using Vivado Testbenches.
3. We will test loading code onto the board. This will include copying compiled code off of the MicroSD card into memory and executing it.
    - We will manually write simple code to execute, and exercise some peripherals in the tested code. 
4. We will define / connect the startup procedure. This will include defining program setup and software initialization. 
    - We will compile simple code to exercise the LEDs to blink slowly depending on switch state. The blinking will be defined by software NOPs. 
5. We will connect the UART interface.
    - We will compile code to report the status of input peripherals like the buttons and switches via the UART interface.

## Benchmarking
??

## Deliverables / Demonstrations
We will provide a final written report detailing the implementation, and a demonstration of C-programs running on the board. We will closely detail any lacking functionality.

## Possible Extensions
The work outlined above is what we hope to be the minimum viable product, but is not novel. As we learn more throughout the semester, we would like to implement at least one, if not several, of the following extensions. They are in no particular order.

- Upgrading to the RV32I instruction set, which will include GPR 16-32, and add support for floating point operations. 
- Augmenting/accelerating the floating point capabilities of the processor by adding an FPU to the design
- Implementing a simple branch predictor
- Implementing timers & interrupts
- Implementing more complex peripherals like HDMI OUT or Ethernet communication.

## Resources
- [RISC V Instruction Set Manual](https://riscv.org/wp-content/uploads/2016/06/riscv-spec-v2.1.pdf)
