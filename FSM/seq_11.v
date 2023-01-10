module seq_11 (
    in,clk,out
);
    input in,clk;
    output out;
    reg state;
    reg out;

    initial begin
    state=0;
    end

    always @(negedge clk) begin
        case (state)
            0: if(in==1) 
                begin
                state=1; out=0;
                end
                else 
                begin
                state=0; out=0;
                end
       
            1:  
            begin if (in==1) 
                begin
                state=1; out=1;
                end
                else 
                begin
                state=0; out=0;
                end 
            end
        endcase
    end

endmodule