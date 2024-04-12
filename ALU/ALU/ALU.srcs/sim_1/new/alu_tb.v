`timescale 1ns / 1ps

module alu_tb;

// Declare signals to connect to the ALU
reg [7:0] A, B;
reg [3:0] control;
wire [7:0] result;
wire ZERO;

// Instantiate the ALU (Unit Under Test)
alu uut (
    .A(A),
    .B(B),
    .control(control),
    .result(result),
    .ZERO(ZERO)
);

// Initial block to apply test vectors
initial begin
    // Initialize inputs
    A = 0; B = 0; control = 0;

    // Monitor changes on specified signals
    $monitor("Time = %t, Control = %b, A = %d, B = %d, Result = %d, ZERO = %b", 
             $time, control, A, B, result, ZERO);

    // Apply test vectors
    // Test ADD
    #10 A = 8'd10; B = 8'd15; control = 4'b0010; // A + B
    // Test SUB
    #10 A = 8'd25; B = 8'd10; control = 4'b0110; // A - B
    // Test AND
    #10 A = 8'b10101010; B = 8'b11001100; control = 4'b0000; // A & B
    // Test OR
    #10 A = 8'b10101010; B = 8'b01010101; control = 4'b0001; // A | B
    // Complete the simulation
    #10 $finish;
end

endmodule
