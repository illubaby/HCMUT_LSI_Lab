module led_sequence (
    input clk,          // Clock input
    input reset,        // Reset input
    output reg [5:0] led // Outputs for the 6 LEDs
);

// Define a counter
reg [2:0] counter;

// Counter logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 0; // Reset the counter
        led <= 6'b000000; // Turn off all LEDs
    end else begin
        counter <= counter + 1;
        led <= (1 << counter) - 1; // Turn on LEDs up to the current counter
    end
end

endmodule
