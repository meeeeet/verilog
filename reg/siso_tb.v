

module siso_tb;
reg si,clk,rst;
wire so;

siso uut(si,so,clk,rst);

initial begin
    rst=1;
    si=0;
    clk=0;
    forever #10 clk=~clk;
end

initial
begin
  #8 si=1;
  #10 si=1;
  #10 si=0;
  #10 si=1;
  #10 si=0;
  #10 si=1;
  #10 si=1;
  #10 si=0;
  //#10 rst=0;
  #10 si=1;
  #10 si=1;
  #10 si=0;
  #10 si=1;
  #30 $finish;
end

initial
begin
  $monitor("%b %b %b %b",clk,rst,si,so);
end

endmodule