module seq_101 (
    in,clk,out
);
    input in,clk;
    output out;
    reg [1:0]state;

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;


always @(negedge clk ) begin
    case (state)

        s0: begin
            if (in) state=s1;
            else state=s0;
        end

        s1: begin
            if (!in) state=s2;
            else state=s1;
        end

        s2: begin
            if (in) state=s0;
            else state=s0;
        end
    endcase
end

assign out=(state==s2 && in==1) ? 1:0;
endmodule
