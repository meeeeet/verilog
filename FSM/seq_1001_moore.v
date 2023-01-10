/* -------------------------------------------------------------------------- */
/*                 1001 sequence detector using moore machine                 */
/* -------------------------------------------------------------------------- */

module seq_1001_moore (
    in,clk,out
);
    
/* ---------------------------- port declaration ---------------------------- */
    input in,clk;
    output out;

/* ---------------------------- state assignment ---------------------------- */
    reg [2:0]state;
    parameter s0=3'b000,
              s1=3'b001,
              s2=3'b010,
              s3=3'b011,
              s4=3'b100;
    
/* ------------------------- state tarnsition logic ------------------------- */
    initial begin
        state=s0;
    end

    assign out= (state==s4) ? 1:0;

    always @(negedge clk ) begin
        case (state)
            s0 : begin
                if (in) state=s1;
                else state=s0;
            end
             s1 : begin
                if (!in) state=s2;
                else state=s1;
            end
             s2 : begin
                if (!in) state=s3;
                else state=s0;
            end
             s3 : begin
                if (in) state=s4;
                else state=s0;
            end
             s4 : begin
                if (in) state=s1;
                else state=s2;
            end
        endcase
    end
endmodule