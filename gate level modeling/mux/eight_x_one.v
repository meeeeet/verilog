module eight_x_one(i,sel,y);
	input [7:0]i;
	input [2:0]sel;
	output y;
	wire [1:0]xx;
	four_x_one f1(i[3:0],sel[1:0],xx[0]);
	four_x_one f2(i[7:4],sel[1:0],xx[1]);
	two_x_one m1(xx[0],xx[1],sel[2],y);
	
endmodule
