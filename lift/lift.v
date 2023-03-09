/* -------------------------------------------------------------------------- */
/*                          verilog file for task-2_4                         */
/* -------------------------------------------------------------------------- */
module lift (
    clk,
    req_floor,
    lift_state,
    reset
);

input clk,reset;
input [1:0] req_floor;
output reg [1:0]lift_state;


parameter idle = 2'b00,
          up = 2'b10,
          down = 2'b01;


reg [1:0]current_floor;
reg [2:0]count;


// initial begin
//     lift_state=idle;
//     current_floor=2'b00;
// end

always @(negedge clk or negedge reset) begin

if (reset==1)
begin
    lift_state=idle;
    current_floor=2'b00;
    count=3'b001;
end

else
begin
    case (lift_state)
        idle: begin
                count=count+1;
                if (req_floor>current_floor)
                    begin
                        lift_state=up;
                        current_floor=req_floor;
                    end
                else if (req_floor<current_floor)
                    begin
                        lift_state=down;
                        current_floor=req_floor;
                    end
                else 
                    begin
                        lift_state=idle;
                    end
                    
                if (count>=3'b101) begin
                    current_floor=2'b00;
                end
        end


        up : begin
            count=1;
            if (req_floor<current_floor)
                begin
                    lift_state=down;
                    current_floor=req_floor;
                end
            else if (req_floor>current_floor)
                begin
                    lift_state=up; 
                    current_floor=req_floor;
                end
            else 
                begin
                    lift_state=idle;
                end
        end


        down : begin
            count=1;
            if(req_floor>current_floor)
                begin
                    lift_state=up;
                    current_floor=req_floor;
                end
            else if(req_floor<current_floor)
                begin
                    lift_state=down;
                    current_floor=req_floor;
                end
            else 
                begin
                    lift_state=idle;
                end
        end
    endcase
end
end

endmodule
