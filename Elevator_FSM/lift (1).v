module fsm(input wire clk, reset, up_button, down_button, doors_closed, top_floor, ground_floor,
           output reg [2:0] state, output reg motor_on, output reg motor_direction, output reg fan_on);

  // State encoding
  parameter Ground = 3'b000, Starting_up = 3'b001, Going_up = 3'b010, Top = 3'b011, Starting_down = 3'b100, Going_down = 3'b101;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= Ground;
      motor_on <= 0;
      fan_on <= 0;
    end
    else begin
      case (state)
        Ground: begin
          if (up_button) begin
            state <= Starting_up;
            motor_on <= 1;
            motor_direction <= 1; // Upward
            fan_on <= 1;
          end
          else state <= Ground;
        end
        Starting_up: begin
          if (doors_closed) state <= Going_up;
          else state <= Starting_up;
        end
        Going_up: begin
          if (top_floor) begin
            state <= Top;
            motor_on <= 0;
          end
          else state <= Going_up;
        end
        Top: begin
          if (down_button) begin
            state <= Starting_down;
            motor_on <= 1;
            motor_direction <= 0; // Downward
            fan_on <= 1;
          end
          else state <= Top;
        end
        Starting_down: begin
          if (doors_closed) state <= Going_down;
          else state <= Starting_down;
        end
        Going_down: begin
          if (ground_floor) begin
            state <= Ground;
            motor_on <= 0;
          end
          else state <= Going_down;
        end
      endcase
    end
  end
endmodule
