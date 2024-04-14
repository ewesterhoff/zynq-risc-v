def convert_to_machine_code(disassembled_code):
    machine_code = []
    for line in disassembled_code.split('\n'):
        parts = line.strip().split()
        if len(parts) < 2 or parts[0] == ';':
            continue
        hex_values = parts[1:5]  # Extract hex values
        if len(hex_values) == 4:
            machine_code.append(''.join(hex_values[::-1]))  # Reverse and append
    return machine_code

# Read disassembled code from file
with open('disas.txt', 'r') as file:
    disassembled_code = file.read()


# Convert to machine code
machine_code = convert_to_machine_code(disassembled_code)

# Save machine code to file
with open('my_program.mem', 'w') as file:
    for code in machine_code:
        file.write('0x' + code + '\n')