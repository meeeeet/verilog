module four_x_one(i,sel,y);
	input [3:0]i;
	input [1:0]sel;
	output y;
	
	wire [1:0]xx;
	two_x_one m1(i[0],i[1],sel[0],xx[0]);
	two_x_one m2(i[2],i[3],sel[0],xx[1]);
	two_x_one m3(xx[0],xx[1],sel[1],y);
endmodule

	
	
