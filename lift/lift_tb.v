module lift_tb;
reg clk;
reg [1:0]floor;
wire [1:0]lift_state;
reg reset;


lift test(clk,floor,lift_state,reset);

initial begin
    clk=1'b0;
    forever begin
        #10 clk=~clk;
    end

end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,lift_tb);
    reset=1;
    #1 reset=0;
    #1 floor=0;
    #20 floor=1;
    #20 floor=3;
    #20 floor=2;
    #20 floor=1;
    #100 floor=2;
    #20 floor=1;
    #20 floor=1;
    #20 floor=3;
    #20 floor=2;
    #20 floor=1;
    #20 floor=3;
    #20 floor=2;
    #20 floor=1;
    #20 $finish;
end

initial begin
    //$monitor("%b    %d    %b",count,req_floor,lift_state);
    $monitor("%d  %b",floor,lift_state);
end
    
endmodule