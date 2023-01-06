module d_ff_tb;

reg d,clk,rst;
wire q;

d_ff uut (clk,d,rst,q);

initial
begin
clk=0;
d=1'b0;
rst=1'b0;
forever #10 clk=~clk;
end

always
 #14 d=~d;

always
begin
#50 rst=1'b1;
#15 rst=1'b0;
end

initial 
#100 $stop;
endmodule
