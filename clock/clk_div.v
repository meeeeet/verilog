module clk_div(clk,clk_out);
    input clk;
    output clk_out;

    reg count=0;
    always @(negedge clk ) begin
        count=count+1;
    end
    assign clk_out=count;

endmodule