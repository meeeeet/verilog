module mod1(d,clk,q,nq);
	input d,clk;
	output q,nq;
	wire x1,y1,dn;
	
	nand n1(x,d,clk);
	not n(dn,d);
	nand n2(y,dn,clk);
	nand n3(q,x,nq);
	nand n4(nq,y,q);
endmodule

module d_ff(D,CLK,Q,NQ);
	input D,CLK;
	output Q,NQ;
	
	wire X,Y;
	mod1 master(D,CLK,X,Y);
	wire clkn;
	not clk_not(clkn,CLK);
	
	mod1 slave(X,clkn,Q,NQ);
endmodule
	
	
