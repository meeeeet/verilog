module mux(d0,d1,d2,d3,sel1,sel2,f);
	input d0,d1,d2,d3,sel1,sel2;
	output f;
	
	wire [7:0]x;
	wire f1,f2;
	
	not n1(x[0],sel1);
	and a1(x[1],x[0],d0);
	and a2(x[2],d1,sel1);
	or o1(f1,x[1],x[2]);
	
	and a3(x[3],x[0],d2);
	and a4(x[4],d3,sel1);
	or o2(f2,x[3],x[4]);
	
	not n2(x[5],sel2);
	and a5(x[6],x[5],f1);
	and a6(x[7],sel2,f2);
	
	or o3(f,x[7],x[6]);
	
	

endmodule
