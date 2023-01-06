module d_ff_gate_level_tb;

reg d,clk;
wire q,nq;

d_ff_gate_level uut(d,clk,q,nq);
initial
begin
d=1'b0;
clk=1'b0;
forever #10 clk=~clk;
end

initial
begin
#7 d=1;
#10 d=0;
#6 d=1;
#9 d=0;
#10 d=1;
end

initial
#80 $stop;

endmodule

