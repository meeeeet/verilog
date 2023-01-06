module fulladder_tb;
  reg a,b,c;
  wire sum,carry;
  
  full_adder uut(a,b,c,sum,carry);
  
  initial 
begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
end
  always
  #10 a=~a;

  	always
  #20 b=~b;
  
  always
  #40 c=~c;
  
  initial 
  #80 $stop;

endmodule
