module siso(si,so,clk,rst);
input si,clk,rst;
output reg so;

reg [2:0]temp;

always @ (posedge clk or negedge rst)
begin
    if (rst==0)
        so=0;
    else
    begin
        temp[0]<=si;
        temp[1]<=temp[0];
        temp[2]<=temp[1];
        so<=temp[2];
    end
end
endmodule