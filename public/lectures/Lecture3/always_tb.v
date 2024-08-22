/* flip flop --> reg (used for memory) */

module simple(input a,b, output reg c);

    // assign c = a^b;
    wire temp; 
    assign temp = a^b;

    // initial begin
    //     c = temp; // c = temp_0
    // end
    // assign c = a^b; // works because c was wire type... assign is used only for wire
    initial begin
        c =1'b0;
    end
    
    always @(a or b) begin //this block trrigers evefry time the value of temp changes
        if (c==1'b0) begin
            c = a^b;
        end else begin
            c=a&b;
        end 
    end

    
endmodule

module tb;
    reg a,b; 
    wire c;

    simple simp(a,b,c);

    initial begin
        a=1;
        b=1; 

        $monitor("a=%b, b=%b, c=%b", a,b,c);

        #5;
        a=0; b=1;
        #5;
        a=0; b=0;
        #5;
        a=1;  b=0;
    end
    endmodule