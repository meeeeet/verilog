/* -------------------------------------------------------------------------- */
/*                          Testbench of lock.v file                          */
/* -------------------------------------------------------------------------- */


module lock_tb;
    wire [3:0]digit_1,digit_2,digit_3,digit_4;
    reg reset;
    reg clk;
    wire out;
    wire buzzer;
    wire [2:0]count;
    wire [15:0]cp;
    reg [15:0]digit;

    assign {digit_1,digit_2,digit_3,digit_4}=digit;



    lock test(digit_1,digit_2,digit_3,digit_4,
    reset,
    clk,
    out,
    buzzer,
    count,
    cp);

    //clock
    initial begin
        reset=0;
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end

    initial begin
        digit=16'h ABCD;
        #8 reset=1;
        #3 reset=0;
        #10 digit=16'h 10A1;
        #10 digit=16'h 10A1;
        #10 digit=16'h 10AF;
        #10 digit=16'h 1CAF;
        #10 digit=16'h ABCD;
        #10 digit=16'h A0AF;
        #10 digit=16'h 9999;
        #5 reset=1;
        #5 reset=0;
        #10 digit=16'h 1234;
        #10 digit=16'h 10AF;
        #10 digit=16'h 19AF;
        #10 digit=16'h 1AAF;
        #10 digit=16'h AB1F;
        #10 digit=16'h 9999;
        #10 digit=16'h A9AA;
        #10 digit=16'h A0AC;
        #10 digit=16'h ADAA;
        #10 digit=16'h A01A;
        #10 $finish;

    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,lock_tb);
        $monitor("%b %b %b %b %b %d ",digit_1,digit_2,digit_3,digit_4,out,count);
    end
endmodule
