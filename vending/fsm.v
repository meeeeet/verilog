module fsm(in,rst,out,clk);
    input [1:0]in;
    input rst;
    output out;
    input clk;
    reg out;

    reg [2:0]state;

    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b100,
              s4 = 3'b101,
              rs1=2'b01,
              rs2=2'b10,
              rs5=2'b11;

    always @(negedge clk)
    begin
        if (rst==1)
            begin
            case (state)
                s0 : begin
                    if (in==rs1) begin
                        state=s1; 
                        out=0;
                    end
                    else if(in==rs2) begin
                        state=s2; 
                        out=0;
                        end
                    else if(in==rs5) begin
                        state=s0; 
                        out=1;
                        end
                    else begin
                        state=s0; 
                        out=0;
                        end
                end 

                s1 : begin
                    if (in==rs1) begin
                        state=s2; 
                        out=0;
                        end
                    else if(in==rs2) begin
                        state=s3; 
                        out=0;
                        end
                    else if(in==rs5) begin
                        state=s1; 
                        out=1;
                        end
                    else begin
                        state=s0; 
                        out=0;
                        end
                end 

                s2 : begin
                    if (in==rs1) begin
                        state=s3; 
                        out=0;
                        end
                    else if(in==rs2) begin
                        state=s4; 
                        out=0;
                        end
                    else if(in==rs5) begin
                        state=s2; 
                        out=1;
                        end
                    else begin
                        state=s0; 
                        out=0;
                        end
                end 

                s3 : begin
                    if (in==rs1) begin
                        state=s4; 
                        out=0;
                        end
                    else if(in==rs2) begin
                        state=s0; 
                        out=1;
                        end
                    else if(in==rs5) begin
                        state=s3; 
                        out=1;
                        end
                    else begin
                        state=s0; 
                        out=0;
                        end
                end 

                s4 : begin
                    if (in==rs1) begin
                        state=s0; 
                        out=1;
                        end
                    else if(in==rs2) begin
                        state=s1; 
                        out=1;
                        end
                    else if(in==rs5) begin
                        state=s4; 
                        out=1;
                        end
                    else begin
                        state=s0; 
                        out=0;
                        end
                end 
                default: state=s0;
            endcase
        end
        
        else
        begin
            out=0;
            state=s0;
        end
        
    end
endmodule