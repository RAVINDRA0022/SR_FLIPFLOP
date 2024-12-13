`timescale 1ns / 1ps

module sr_flipflop(
    output reg q,
    output reg qbar,
    input s,
    input r,
    input clk
    );

    always @(posedge clk) begin
        if (s == 0 && r == 0) begin
            // No change
            q <= q; 
            qbar <= qbar;
        end
        else if (s == 0 && r == 1) begin
            // Reset state
            q <= 1'b0; 
            qbar <= 1'b1;
        end
        else if (s == 1 && r == 0) begin
            // Set state
            q <= 1'b1; 
            qbar <= 1'b0;
        end
        else if (s == 1 && r == 1) begin
            // Invalid state
            q <= 1'bx; 
            qbar <= 1'bx;
        end
    end
endmodule
