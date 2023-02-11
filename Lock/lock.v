
/* -------------------------------------------------------------------------- */
/*                                 Main module                                */
/* -------------------------------------------------------------------------- */
module lock(
    digit_1,digit_2,digit_3,digit_4,
    reset,
    clk,
    out,
    buzzer,
    count,
    cp
);

    input [3:0]digit_1,digit_2,digit_3,digit_4;
    input reset,clk;
    output out,buzzer;

    wire [15:0]current_pass;
    wire [2:0]wrong_attempt;
    wire [15:0]pass_serial;

    //assign current_pass=16'b0001000100011010;
    output [2:0]count; //verification purpose
    output [15:0]cp; //verification purpose
    assign count=wrong_attempt; //verification purpose
    assign cp=current_pass; //verification purpose

    hextobin h1(digit_1,digit_2,digit_3,digit_4,pass_serial,clk);

    compare cmp(clk,pass_serial,current_pass,reset,wrong_attempt,out);

    update u1(current_pass,pass_serial,clk,reset);

    buzzer_ctrl buzz(wrong_attempt,buzzer,out);


endmodule


/* -------------------------------------------------------------------------- */
/*                                 submodules                                 */
/* -------------------------------------------------------------------------- */


/* --------- module for comparing input password with saved password -------- */
module compare(
    clk,pass_in,current_pass,reset,wrong_attempt,out
);
    input [15:0] pass_in;
    input [15:0] current_pass;
    input clk,reset;
    output reg out;
    output reg [2:0]wrong_attempt;

    always @(negedge clk or posedge reset) begin

        if(reset==1)begin
            out=0;
            wrong_attempt=3'b000;
        end

        else if(pass_in==current_pass) begin
            out=1;
            wrong_attempt=3'b000;
        end

        else begin
            wrong_attempt=wrong_attempt+1;
            out=0;
        end

    end
endmodule


/* --- PISO to convert all 4-digit hex input into binary in serial manner --- */
module hextobin (
    digit_1,digit_2,digit_3,digit_4,
    pass_serial,clk
);

    input [3:0]digit_1,digit_2,digit_3,digit_4;
    input clk;
    output reg [15:0]pass_serial;
    always @(negedge clk ) begin

        pass_serial[3:0]=digit_1;
        pass_serial[7:4]=digit_2;
        pass_serial[11:8]=digit_3;
        pass_serial[15:12]=digit_4;

    end

endmodule


/* ------------------ module for store and update password ------------------ */
module  update(
    current_pass,
    pass_serial,
    clk,
    reset
);
    input [15:0]pass_serial;
    input clk,reset;
    output reg [15:0]current_pass;

    always @(negedge clk ) begin
        if (reset==1) begin
            current_pass=pass_serial;
        end
    end

endmodule


/* ------------------ control module for controling buzzer ------------------ */
module buzzer_ctrl(wrong_attempt,buzzer,out);
    input [2:0]wrong_attempt;
    input out;
    output reg buzzer;

    always @ (wrong_attempt or out)
    begin
        if (wrong_attempt>3'b011 && out==0)
        begin
            buzzer=1;
        end
        else
            buzzer=0;
    end
endmodule
