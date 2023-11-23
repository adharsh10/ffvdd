class lift_trans;
rand bit up_button;
rand bit down_button;
rand bit doors_closed;
rand bit top_floor;
rand bit ground_floor;
bit [2:0] state;
bit reg motor_on;
bit reg motor_direction;
bit reg fan_on;
function void display();
$display(" ");
$display("\t up_button = %0b, \t down_button = %0b, \t doors_closed = %0b, \t top_floor = %0b,\t ground_floor = %0b, \t state = %0b, \t motor_on = %0b, \t motor_direction = %0b, \t fan_on = %0b", up_button,down_button,doors_closed,top_floor,ground_floor,state,motor_on,motor_direction,fan_on);
$display(" ");

endfunction
endclass
