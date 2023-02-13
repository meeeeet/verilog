/* -------------------------------------------------------------------------- */
/*                          Testbench of lock.v file                          */
/* -------------------------------------------------------------------------- */


module lock_tb;
    reg [3:0]digit;
    reg reset;
    reg clk;
    wire out;
    wire buzzer;
    wire [2:0]count;
    wire [3:0]cp;

    reg start;
    wire [3:0]ci;

  



    lock test(digit,
    start,
    reset,
    clk,
    out,
    buzzer,
    count,
    cp,ci);

    //clock
    initial begin
        reset=1;
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end

    initial begin
        digit=4'b1010;
        #20 digit=4'b 1011;
        #10 digit=4'b 1111;
        #10 digit=4'b 1101;
        #10 digit=4'b 1100;
        #10 digit=4'b 0000;
        #8 digit=4'b 1010;
        //#10 digit=4'b 1111;
        #6 digit=4'b 1111;
        #10 digit=4'b 1011;
        #10 digit=4'b 0001;
        #10 digit=4'b 1010;
        #10 digit=4'b 1101;
        #10 digit=4'b 0010;
        #10 digit=4'b 1111;
        #10 digit=4'b 1010;
        #10 digit=4'b 1110;
        #10 digit=4'b 0011;
        #10 digit=4'b 0000;
        #10 $finish;

    end
    initial
    begin
        start=1'b1;
        #3 start=1'b0;
        #2 start=1'b1;
        #60 reset=0;
        #2 reset=1;
        #20 reset=0;
        #1 reset=1;

    end
    initial begin
        #135 reset=0;
        #1 reset=1;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,lock_tb);
        $monitor("%b  %b %d ",digit,out,count);
    end
endmodule
