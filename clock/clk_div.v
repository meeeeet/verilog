module clk_div(clk,clk_out);
    input clk;
    output [1:0]clk_out;


    reg [1:0]count=2'b11;

    always @(negedge clk) begin
        if (count==2'b01)
        count=2'b11;
        else
            count=count-1;
    end

    assign clk_out=count;

endmodule