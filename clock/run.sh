
iverilog clktb.v clk_div.v
vvp a.out
gtkwave wave.vcd
rm a.out
rm wave.vcd
