module fulladder(sum,carry,a,b,c);
	input a,b,c;
	output sum,carry;
	
	wire x,y,z;
	
	xor a1(sum,a,b,c); //sum
	and a2(x,a,b);
	and a3(y,b,c);
	and a4(z,c,a);
	
	or a5(carry,x,y,z);
	
endmodule
