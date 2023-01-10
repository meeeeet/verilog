/* -------------------------------------------------------------------------- */
/*               Testbench file of 1001 Sequence detector(moore)              */
/* -------------------------------------------------------------------------- */
module seq_1001_moore_tb;
    reg in,clk;
    wire out;

    seq_1001_moore test(in,clk,out);

/* ---------------------------- clock generation ---------------------------- */
    initial begin
        clk=0;
        forever begin
            #10 clk=~clk;
        end
    end
    
/* -------------------------------- testcase -------------------------------- */
    initial begin
        $monitor("time=%t in=%b out=%b",$time,in,out);
        in = 0;
        #20 in=0;
        #20 in=1;
        #20 in=0;
        #20 in=0;
        #20 in=1;
        #20 in=1;
        #20 in=1;
        #20 in=0;
        #20 in=0;
        #20 in=1;
        #20 in=0;
        #20 in=0;
        #20 in=1;
        #20 in=1;
        #20 $finish;
    end

endmodule