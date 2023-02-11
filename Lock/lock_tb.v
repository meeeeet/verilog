/* -------------------------------------------------------------------------- */
/*                          Testbench of lock.v file                          */
/* -------------------------------------------------------------------------- */


module lock_tb;
    wire digit_1,digit_2,digit_3,digit_4;
    reg reset;
    reg clk;
    wire out;
    wire buzzer;
    wire [2:0]count;
    wire [3:0]cp;
    reg [3:0]digit;

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
        digit=4'b0000;
        #8 reset=1;
        #3 reset=0;
        #10 digit=4'b 1011;
        #10 digit=4'b 1111;
        #10 digit=4'b 1101;
        #10 digit=4'b 1100;
        #10 digit=4'b 0000;
        #10 digit=4'b 1010;
        #10 digit=4'b 1111;
        #5 reset=1;
        #5 reset=0;
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

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,lock_tb);
        $monitor("%b %b %b %b %b %d ",digit_1,digit_2,digit_3,digit_4,out,count);
    end
endmodule
