`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2024 11:26:54 AM
// Design Name: 
// Module Name: Zybo_Z7_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Zybo_Z7_top 
#(
    parameter LED_ADDR = 32'h00001000,
    parameter SWC_ADDR = 32'h00001004,
    parameter BTN_ADDR = 32'h00001008,
    parameter NUM_INSTR = 40
)
(
    input wire sysclk,  // 125 MHz
    input wire r_btn,
    input wire [2:0] btn,
    input wire [3:0] sw,
    
    output wire [3:0] led,
    inout wire [7:0] ja,
    inout wire [7:0] jc,
    inout wire [7:0] jd,
    inout wire [7:0] je,
    
    // when sdcard_pwr_n = 0, SDcard power on
    output wire sdcard_pwr_n,
    // signals connect to SD bus
    output wire sdclk,
    inout sdcmd,
    input  wire sddat0,
    output wire sddat1, sddat2, sddat,
    output wire [3:0] card_status,
    output wire [1:0] card_type,
    output wire [1:0] filesystem_type,
    output wire file_found
 
    );

    // Registers
    reg [31:0] instructions [0:NUM_INSTR];
    reg [31:0] current_instr;
    reg [31:0] instr_index;
    reg [31:0] read_index;
    reg [31:0] pc;
    reg[1:0] state;
    reg reg_inst_write_sel;
    reg [1:0] inst_trans;
    reg rst;
    reg [3:0] rst_counter;
    
    // Instruction Memory Wires
    wire [31:0] inst_rdata;
    wire inst_ready;
    wire inst_resp;
    wire [2:0] inst_burst;
    wire [3:0] inst_prot;
    wire [2:0] inst_size;
    wire [31:0] inst_write; 
    wire inst_mast_lock;

    wire [31:0] inst_addr_out;
    wire [31:0] inst_addr_in;
    
    wire inst_write_sel_out;
    wire inst_write_sel_in;
    
    wire [1:0] inst_trans_in;
    wire [1:0] inst_trans_out;
    
    // Main Memory Wires
    wire [31:0] mem_read_data;
    wire [31:0] mem_write_data; 
    wire [31:0] mem_addr;
    
    wire mem_ready;
    wire mem_resp;
    wire [2:0] mem_burst;
    wire [3:0] mem_prot;
    wire [2:0] mem_size;
    wire mem_mast_lock;    
    wire mem_write_sel;    
    wire [1:0] mem_trans;
    
    // Memory-Mapped IO registers
    reg [3:0] led_reg;
    //reg [3:0] swc_reg;
    //reg [2:0] btn_reg;
    
    //assign inst_addr_in = pc;
    assign inst_write = current_instr;
    assign inst_write_sel_in = reg_inst_write_sel;
    assign inst_trans_in = inst_trans;
    
    // IO assignments
    assign led = led_reg;
    //assign scw_reg = sw;
    //assign btn_reg = btn;
    
    // SD card assignments
    assign sdcard_pwr_on = 1'b0;    // keep SD Card powered on
    assign {sddat1, sddat2, sddat3} = 3'b111;  // Prevent SD card from entering SPI mode

    // may need to implement clock divider, example is running at 50MHz
    
    // sd file reader
    wire outen; // When outen = 1, a byte of file content is read from outbyte
    wire [7:0] outbyte; // byte of file content
    
    sd_file_reader #(
        .FILE_NAME_LEN(14), // length of the file name in bytes (ASCII)
        .FILE_NAME ("my_program.mem"),  // file name to be read
        .CLK_DIV (1) // need to go from 125MHZ to 50MHz  
    ) u_sd_file_reader (
        .rstn(rst),
        .clk(sysclk), // need to be 50MHz
        .sdclk(sdclk),
        .sdcmd (sdcmd),
        .sddat0(sddat0),
        .card_stat (card_status),  // card initialize status
        .card_type (card_type), // 0 = unknown, 1 = SDv1, 2 = SDv2, 3 = SDHCv2
        .filesystem_type (filesystem_type), // 0 = unassigned, 1 = unknown, 2 = FAT16, 3 = FAT32
        .file_found (file_found), 
        .outen (outen),
        .outbyte (outbyte)
    );
    
    ecen5593_startercode_ca_top cpu (
    .CLK(sysclk),
    .RST(rst),
    .if_code_HRDATA(inst_rdata),
    .if_code_HREADY(inst_ready),
    .if_code_HRESP(inst_resp),
    .ldst_HRDATA(mem_read_data),
    .ldst_HREADY(mem_ready),
    .ldst_HRESP(mem_resp),
    .if_code_HADDR(inst_addr_out),
    .if_code_HBURST(inst_burst),
    .if_code_HMASTLOCK(inst_mast_lock),
    .if_code_HPROT(inst_prot),
    .if_code_HSIZE(inst_size),
    .if_code_HTRANS(inst_trans_out),
    .if_code_HWRITE(inst_write_sel_out),
    .ldst_HADDR(mem_addr),
    .ldst_HBURST(mem_burst),
    .ldst_HMASTLOCK(mem_mast_lock),
    .ldst_HPROT(mem_prot),
    .ldst_HSIZE(mem_size),
    .ldst_HTRANS(mem_trans),
    .ldst_HWDATA(mem_write_data),
    .ldst_HWRITE(mem_write_sel)
    );
    
    ahb3lite_sram1rw inst_mem (
    .HRESETn(rst),
    .HCLK(sysclk),
    .HSEL(1'b1),
    .HADDR(inst_addr_in),
    .HWDATA(inst_write),
    .HRDATA(inst_rdata),
    .HWRITE(inst_write_sel_in),
    .HSIZE(inst_size),
    .HBURST(inst_burst),
    .HPROT(inst_prot),
    .HTRANS(inst_trans_in),
    .HREADYOUT(inst_ready),
    .HREADY(inst_ready),
    .HRESP(inst_resp)
    );
    
    ahb3lite_sram1rw main_mem (
    .HRESETn(rst),
    .HCLK(sysclk),
    .HSEL(1'b1),
    .HADDR(mem_addr),
    .HWDATA(mem_write_data),
    .HRDATA(mem_read_data),
    .HWRITE(mem_write_sel),
    .HSIZE(mem_size),
    .HBURST(mem_burst),
    .HPROT(mem_prot),
    .HTRANS(mem_trans),
    .HREADYOUT(mem_ready),
    .HREADY(mem_ready),
    .HRESP(mem_resp)
    );

    // Load instructions from file
    initial begin
//        $readmemh("my_program.mem", instructions);
    
        current_instr = 0;
        inst_trans = 2'b10;
        reg_inst_write_sel = 1;
        instr_index = 0;
        read_index = 0;
        pc = 4096;
        rst = 1;
        rst_counter = 0;
    end
    
    // Load instructions from the SD Card
    reg [31:0] buffer; // temp buffer to hold one instruction
    reg [2:0] byte_count = 0; // counts bytes in intruction
    reg file_done = 0;
    
    always @(posedge sysclk)
    begin
        if(rst) begin
            read_index <= 0;
            byte_count <= 0;
            buffer <= 0;
            file_done <= 0;
         end else if(outen) begin
            // collect four bytes to create one 32-bit instruction
            buffer <= (buffer << 8) | outbyte; // shift buffer and or in new byte
            byte_count <= byte_count + 1;
            
            // check if a full instruction has been read
            if(byte_count == 4) begin
                instructions[read_index] <= buffer;
                read_index = read_index + 1;
                byte_count <=0; // reset for next instruction
                
                // handle when all instructions have been read
                if (read_index == NUM_INSTR) begin
                    file_done <= 1;
                end
            end
         end
    end
    
    assign inst_addr_in = (state == 2) ? inst_addr_out : pc;

    // State machine
    always @ (posedge sysclk)
    begin
        if (r_btn == 0) begin
            read_index <= 0;
            byte_count <= 0;
            buffer <= 0;
            state <= 0;
        end else begin    
            case (state)
                // INSTRUCTION COPY
                0:
                    if(file_done) begin
                        rst_counter = 0;
                        rst <= r_btn;
                        reg_inst_write_sel <= 1;
                        inst_trans = 2'b10;
                        // Load instructions from memory
                        if (instr_index < NUM_INSTR) begin
                            // Read instruction into memory
                            current_instr <= instructions[instr_index][31:0];
                            instr_index <= instr_index + 2'b1;
                            pc <= pc + 4;
                        end else begin
                            // All instructions loaded, switch to RUN_STATE
                            state <= 1;
                            reg_inst_write_sel <= 0;
                            current_instr <= 0;
                        end
                    end
                // RESET CPU
                1:
                    begin
                        if (rst_counter < 2) begin
                            rst <= 1;
                            rst_counter = rst_counter + 1;
                        end else if (rst_counter < 4)begin
                            rst <= 0;
                            rst_counter = rst_counter + 1;
                        end else begin 
                            state <= 2;
                        end
                    end
                // RUNTIME
                2:
                    begin
                        rst <= r_btn;
                        // Handle signal passing
                        reg_inst_write_sel = inst_write_sel_out;
                        pc <= inst_addr_out;
                        inst_trans = inst_trans_out;
                        
                        //led_reg = inst_addr_in[5:2];
                        
                        // Handle memory-mapped IO
                        if (mem_addr == LED_ADDR && mem_write_sel == 1) begin
                            led_reg <= mem_write_data[3:0];
                        end
                        /*
                        if (mem_addr == BTN_ADDR && mem_write_sel == 1) begin
                            btn_reg <= mem_write_data[3:0];
                        end
                        
                         if (mem_addr == SWC_ADDR && mem_write_sel == 1) begin
                            swc_reg <= mem_write_data[3:0];
                        end
                        */
                    end
                default: state <= 2'b0;
            endcase
        end
    end

endmodule
