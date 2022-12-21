//2x1 multiplexer module
module two_x_one(d0,d1,sel,y);
	input d0,d1,sel;
	output y;

	assign y=(d0&(~sel))|(d1&sel);
endmodule

//as dddj
