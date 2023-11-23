class lift_cov;
lift_trans trans = new();
covergroup cov_inst;
option.per_instance = 1;
DIR:coverpoint trans.dir {bins arm = {0,1};}
ENABLE: coverpoint trans.enable {bins trigger = {0,1};}
up_button: coverpoint trans.up_button {bins up_button = { [0: 4294967295]}; }  
down_button: coverpoint trans.down_button {bins down_button = { [0: 4294967295]}; }
doors_closed: coverpoint trans.doors_closed {bins doors_closed = { [0: 4294967295]}; }  
top_floor: coverpoint trans.top_floor {bins top_floor = { [0: 4294967295]}; }  
ground_floor: coverpoint trans.ground_floor {bins ground_floor = { [0: 4294967295]}; }   
state: coverpoint trans.state {bins state = { [0: 4294967295]}; } 
motor_on: coverpoint trans.motor_on {bins motor_on = { [0: 4294967295]}; }
motor_direction: coverpoint trans.motor_direction {bins motor_direction = { [0: 4294967295]};
fan_on: coverpoint trans.fan_on {bins fan_on = { [0: 4294967295]}; 
endgroup
function new();
cov_inst = new;
endfunction
task main;
cov_inst. sample();
endtask
endclass
