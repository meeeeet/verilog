//design - D_flipflop with negetive egde trigger
//modeling - behavioral

module d_ff(clk,d,rst,q);
	input clk,d,rst;
	output q;
	reg q;

always @ (negedge clk or posedge rst)
begin
 if (rst==1'b0)
	q=d;
else
q=1'b0;
end


endmodule