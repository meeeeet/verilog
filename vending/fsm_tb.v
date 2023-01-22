`timescale 1ns/1ns
module fsm_tb ();
    
    reg rst;
    reg [1:0]in;
    wire out;
    reg clk;
    parameter rs1=2'b01,
              rs2=2'b10,
              rs5=2'b11,
              rs0=2'b00;

    fsm uut(in,rst,out,clk);


    initial begin
        rst=1;
        in=2'b00;
        clk=0;
        forever begin
            #3 clk=~clk;
        end
    end

    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0,fsm_tb);
        #1  in=rs0;
        #5 in=rs1;
        #5 in=rs1;
        #5 in=rs2;
        #5 in=rs2;
        #5 in=rs0;
        #5 in=rs0;
        #5 in=rs5;
        #5 in=rs1;
        #5 in=rs0;
        #5 in=rs2;
        #5 in=rs5;
        #5 in=rs0;
        #5 in=rs1;
        #5 in=rs1;
        #5 in=rs1;
        #5 in=rs0;
        #5 in=rs1;
        #5 $finish;
        
    end
    
endmodule