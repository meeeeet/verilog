`timescale 1ns/1ns
module clktb;
wire clk_out;
reg clk;

clk_div uut(clk,clk_out);

initial begin
    clk=0;
    forever begin
        #5 clk=~clk;
    end
end
initial begin
      $dumpfile("wave.vcd");
      $dumpvars(0,clktb);
      #200 $finish;
end

endmodule