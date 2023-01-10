/* -------------------------------------------------------------------------- */
/*                 1001 Sequence detector using mealy machine                 */
/* -------------------------------------------------------------------------- */

module seq_1001_mealy (
    in,
    clk,
    out
);
/*---------port declaration---------*/
    input in,clk;                             
    output reg out;
    reg [1:0]state;

/*---------state assignment-------------*/
    parameter s0 = 2'b00,                  
              s1 = 2'b01,
              s2 = 2'b10,
              s3 = 2'b11;

/*--------State tarnsition logic--------*/
    initial begin
        state=s0;
    end
    always @(negedge clk ) begin         
        case (state)
            s0 : begin
                if (in) begin state=s1; out=0; end
                else begin state=s0; out=0; end
            end

            s1 : begin
                if (!in) begin state=s2; out=0; end
                else begin state=s1; out=0; end
            end

            s2 : begin
                if (!in) begin state=s3; out=0; end
                else begin state=s1; out=0; end
            end

            s3 : begin
                if (in) begin state=s1; out=1; end
                else begin state=s0; out=0; end
            end
        endcase
    end
   

endmodule
