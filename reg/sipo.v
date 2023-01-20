module sipo(si,so,clk,rst);
input si,clk,rst;
output reg [3:0] so;
always @ (posedge clk or negedge rst)
begin
    if (rst==0)
        so=4'b0000;
    else
    begin
        so[0]<=si;
        so[1]<=so[0];
        so[2]<=so[1];
        so[3]<=so[2];
    end
end
endmodule