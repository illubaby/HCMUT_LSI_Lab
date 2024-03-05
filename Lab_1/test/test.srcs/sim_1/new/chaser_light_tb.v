`timescale 1ns / 1ps

module led_sequence_tb;

// Testbench signals
reg clk;
reg reset;
wire [5:0] led;

// Instantiate the module to be tested
led_sequence uut (
    .clk(clk),
    .reset(reset),
    .led(led)
);

// Clock generation (50MHz example)
always #10 clk = ~clk; // Toggle clock every 10ns -> 50MHz

// Test sequence
initial begin
    // Initialize signals
    clk = 0;
    reset = 1; // Apply reset
    #100;      // Wait 100ns
    reset = 0; // Release reset
    
    // Wait and observe LED behavior
    #1000; // Wait 1000ns to observe the LEDs
    
    // Add more test cases as needed
    
    $finish; // End simulation
end

endmodule
