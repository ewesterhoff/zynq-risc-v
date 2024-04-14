.section .text
.globl _start

_start:
    # Set up LED address
    lui a0, %hi(0x00001000)     # Load upper 20 bits of LED_ADDR into a0
    addi a0, a0, %lo(0x00001000) # Add lower 12 bits of LED_ADDR to a0

loop:
    # Turn on LED
    li t0, 1         # Load immediate 1 into t0
    sw t0, 0(a0)     # Store value of t0 (1) at LED address

    # Delay
    li t1, 5000      # Load immediate 5000 into t1
delay_loop:
    addi t1, t1, -1  # Decrement t1
    bnez t1, delay_loop # Branch to delay_loop if t1 != 0

    # Turn off LED
    li t0, 0         # Load immediate 0 into t0
    sw t0, 0(a0)     # Store value of t0 (0) at LED address

    # Delay
    li t1, 5000      # Load immediate 5000 into t1
delay_loop_off:
    addi t1, t1, -1  # Decrement t1
    bnez t1, delay_loop_off # Branch to delay_loop_off if t1 != 0

    # Repeat loop infinitely
    j loop

.end

