`include "one_bit_adder.v"

module tb;
    reg [7:0] A,B;
    wire [7:0] R;
    wire c_out; 

    eight_bit_adder adder(A,B,R, C_out);

    initial begin
    A =0;
    B =0; 
    #2;

    $monitor("a = %d, B = %d, R = %d, Carry = %d", A,B,R,C_out);
    repeat(20) begin
        A = $random;
        B = $random; 
        #15;  
    end

    end 
endmodule