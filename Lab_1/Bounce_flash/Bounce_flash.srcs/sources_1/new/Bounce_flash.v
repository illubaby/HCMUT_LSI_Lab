`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 04:06:17 PM
// Design Name: 
// Module Name: Bounce_flash
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


module Bounce_flash(
    input clk,      
    input reset,
    input flick,
    output reg [15:0] lamps
    //output reg [4:0] dbg
    );

// Define states
// State declaration
parameter INIT = 3'd0,
          TURN_ON_TO_5 = 3'd1,
          TURN_OFF_TO_0 = 3'd2,
          TURN_ON_TO_10 = 3'd3,
          TURN_OFF_TO_5 = 3'd4,
          TURN_ON_TO_15 = 3'd5,
          TURN_OFF_TO_0_AGAIN = 3'd6,
          BLINK = 3'd7;

// State variables
reg [1:0] flick_active; 
reg [2:0] current_state = INIT;
reg [2:0] next_state;
reg [4:0] lamp_counter; // Counter to keep track of the current lamp
// Asynchronous reset
always @(posedge clk or posedge reset or posedge flick) begin
    if (!reset) begin
        current_state <= INIT;
        lamp_counter <= 0;
        lamps <= 16'b0;
        //dbg <= 3'b0;
    end else begin
        //dbg <= 3'b0;
        
         case (current_state)
            INIT: begin
                lamps <= 16'b0;
                current_state <= TURN_ON_TO_5;
            end
            TURN_ON_TO_5: begin
            //dbg <= lamp_counter;
                if (lamp_counter < 6) begin
                lamp_counter<=lamp_counter+1;
                lamps <= (1 << lamp_counter) - 1;                
                end else begin
                    lamps <= 16'b11111;
                    current_state <= TURN_OFF_TO_0;
                end
            end
            TURN_OFF_TO_0: begin
                if (lamp_counter > 0) begin
                    lamp_counter <= lamp_counter - 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    current_state <= TURN_ON_TO_10;
                    lamp_counter <= 0;
                end
            end
            TURN_ON_TO_10: begin
            //dbg <=lamp_counter; 
            if (flick && lamp_counter == 5) begin
                flick_active <= 1;
                end                       
            if ( flick_active == 1) begin                                     
                if (lamp_counter > 0) begin
                    lamp_counter <= lamp_counter - 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    current_state <= TURN_ON_TO_10;
                    flick_active <= 0;
                    lamps <= 16'b0;
                end                                    
            end else             
            if (lamp_counter < 11) begin
                    lamp_counter <= lamp_counter + 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    lamps <= 16'b1111111111;
                    current_state <= TURN_OFF_TO_5;
                end
            end
            TURN_OFF_TO_5: begin
                if (lamp_counter > 5) begin
                    lamp_counter <= lamp_counter - 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    current_state <= TURN_ON_TO_15;
                    lamp_counter <= 5; // Set counter to 5 for next state
                end
            end
            TURN_ON_TO_15: begin
            //dbg <=flick_active; 
            if (flick && lamp_counter == 10) begin
                flick_active <= 1;
                end                       
            if ( flick_active == 1) begin                                     
                if (lamp_counter > 5) begin
                    lamp_counter <= lamp_counter - 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    current_state <= TURN_ON_TO_15;
                    flick_active <= 0;
                    lamps <= 16'b11111;
                end                                    
            end else  
             if (lamp_counter < 16) begin
                    lamp_counter <= lamp_counter + 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    current_state <= TURN_OFF_TO_0_AGAIN;
                end
            end
            TURN_OFF_TO_0_AGAIN: begin
                if (lamp_counter > 0) begin
                    lamp_counter <= lamp_counter - 1;
                    lamps <= (1 << lamp_counter) - 1;
                end else begin
                    current_state <= BLINK;
                    lamps <= 16'b0;
                end
            end
            
            BLINK: begin
                lamps <= 16'hFFFF; // Turn all lamps ON
                #5; // Wait for a brief moment
                lamps <= 16'b0; // Turn all lamps OFF
                current_state <= INIT; 
            end
        endcase    
                
    end
end
// kickback logic
endmodule