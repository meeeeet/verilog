
//design - D-flipflop negetive edge trigger
//modeling - gate level


//main module
module d_ff_gate_level(D,CLK,Q,NQ);
	input D,CLK;
	output Q,NQ;
	
	wire X,Y;
	ff master(D,CLK,X,Y); //master 
	wire clkn;
	
	not clk_not(clkn,CLK);
	ff slave(X,clkn,Q,NQ); //slave
endmodule


//d_flipflop module
module ff(d,clk,q,nq);
	input d,clk;
	output q,nq;
	wire x,y,dn;
	
	nand n1(x,d,clk);
	not n(dn,d);
	nand n2(y,dn,clk);
	nand n3(q,x,nq);
	nand n4(nq,y,q);
endmodule



	
	
