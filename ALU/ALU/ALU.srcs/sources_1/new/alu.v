module ALU(
    input [7:0] A, // 8-bit input A
    input [7:0] B, // 8-bit input B
    input [3:0] control, // 4-bit control signal
    output reg [7:0] result, // 8-bit result
    output ZERO // 1-bit ZERO flag
);

// Calculate the ZERO flag as an output, high when result is 0
assign ZERO = (result == 8'b0) ? 1'b1 : 1'b0;

always @(A, B, control) begin
    case (control)
        4'b0010: result = A + B; // ADD operation
        4'b0110: result = A - B; // SUB operation
        4'b0000: result = A & B; // AND operation
        4'b0001: result = A | B; // OR operation
        default: result = 8'bx; // For undefined control signals, result is 'don't care'
    endcase
end

endmodule
