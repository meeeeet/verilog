module ha(f1,f2,i0,i1,sel);
	input i0,i1,sel;
	output f1,f2;
	
	wire x,y,z,w;
	not a1(x,sel);
	and a2(y,i0,x);
	and a3(z,i1,sel);
	or a4(f1,y,z);
endmodule
