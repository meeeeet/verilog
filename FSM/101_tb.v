module 101_tb;
    reg in,clk;
    wire out;

initial begin
    clk=0;
    forever #10 clk=~clk;
end

initial
begin
    
end

endmodule