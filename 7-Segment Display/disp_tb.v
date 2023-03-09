module disp_tb;
wire [0:6]out;
reg [3:0]in;

wire [0:6]o;

assign o=~out;
bcd_to_dis test(in,out);
reg [3:0]i;
initial begin
    in=4'd0;
    for (i = 0; i<=8; i=i+1) begin
        #10 in=in+1;
    end
end
initial
begin
    $monitor("%d %d  %d",in,out,o);
end
endmodule