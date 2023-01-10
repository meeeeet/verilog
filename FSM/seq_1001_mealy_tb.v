/* -------------------------------------------------------------------------- */
/*               Testbench file of 1001 Sequence detector(mealy)              */
/* -------------------------------------------------------------------------- */
module seq_1001_mealy_tb;
    reg in,clk;
    wire out;

    seq_1001_mealy uut(in,clk,out);

/* ---------------------------- clock generation ---------------------------- */
    initial begin
        clk=0;
        forever #10 clk=~clk;
    end

/* -------------------------------- testcase -------------------------------- */
    initial begin
        in=0;
        #20 in=1;
        #20 in=0;
        #20 in=0;
        #20 in=1;
        #20 in=0;
        #20 in=1;
        #20 in=0;
        #20 in=0;
        #20 in=1;
        #20 in=1;
        #30 $finish;
    end
    
/* --------------------------------- output --------------------------------- */
    initial
    $monitor("Time=%t  in=%b   out=%b",$time,in,out);

endmodule