
`timescale 1ns/1ps
module sipo_tb;
reg si,clk,rst;
wire [3:0]so;

sipo uut(si,so,clk,rst);

initial begin
    rst=1;
    si=0;
    clk=0;
    forever #10 clk=~clk;
end

initial
begin
    $dumpfile("test.vcd");
    $dumpvars(0,sipo_tb);
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