module tb_11 (
    
);
    reg in,clk;
    wire out;
    
    seq_11 uut(in,clk,out);

    //clock
    initial begin
        clk=0;
        forever begin
            #10 clk=~clk;
        end

    end

    always begin
        in=0;
        #11 in=1;
        #10 in=0;
        #10 in=1;
        #12 in=1;
        #14 in=0;
	#10 in=0;
	#11 in=1;
	#10 in=1;
	#13 in=1;
	#10 in=0;
	
	
	
        #10 $finish;
    end

    initial begin
        $monitor("clk=%b in=%b out=%b",clk,in,out);
    end
endmodule
