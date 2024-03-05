`timescale 1ns / 1ps

module Bounce_flash_tb;

reg clk;
reg reset;
reg flick;
wire [15:0] lamps;
wire [4:0] dbg;
// Instantiate the Unit Under Test (UUT)
Bounce_flash uut (
    .clk(clk), 
    .reset(reset), 
    .flick(flick), 
    .lamps(lamps),
    .dbg(dbg)
);

initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    flick = 0;

    // Wait 100 ns for global reset to finish
    #100;
    
    reset = 0; // Release the reset
    #800;
    
    flick = 1; // Simulate a flick input
    #150;
    flick = 0; // End flick input
    #200;
    flick = 1; // End flick input
    #250;
    flick = 0;
    #250;
    // Add more test cases here to simulate different scenarios
    // For example, test the behavior of the lamp counter incrementing,
    // state transitions, etc.

    // Finish simulation
    $finish;
end

// Clock generator
always #5 clk = ~clk; // Toggle clock every 5ns (100MHz clock)

endmodule
