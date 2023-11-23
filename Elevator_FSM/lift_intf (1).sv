interface lift_intf(input logic clk,rst);


logic up_button;
logic down_button;
logic doors_closed;
logic top_floor;
logic ground_floor;
logic [2:0] state;
logic motor_on;
logic motor_direction;
logic fan_on;

clocking bfm_cb @(posedge clk);
default input #1 output #1;
output up_button;
output down_button;
output doors_closed;
output top_floor;
output ground_floor;
input state;
input motor_on;
input motor_direction;
input fan_on;
endclocking

clocking monitor_cb @(posedge clk);
default input #1 output #1;
input up_button;
input down_button;
input doors_closed;
input top_floor;
input ground_floor;
input state;
input motor_on;
input motor_direction;
input fan_on;
endclocking
modport BFM (clocking bfm_cb, input clk,rst);
modport MONITOR (clocking monitor_cb, input clk, rst);
endinterface
