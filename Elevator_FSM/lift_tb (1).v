module fsm_test;

  // Inputs
  reg clk;
  reg reset;
  reg up_button;
  reg down_button;
  reg doors_closed;
  reg top_floor;
  reg ground_floor;

  // Outputs
  wire [2:0] state;
  wire motor_on;
  wire motor_direction;
  wire fan_on;

  // Instantiate the Unit Under Test (UUT)
  fsm uut (
    .clk(clk), 
    .reset(reset), 
    .up_button(up_button), 
    .down_button(down_button), 
    .doors_closed(doors_closed), 
    .top_floor(top_floor), 
    .ground_floor(ground_floor), 
    .state(state), 
    .motor_on(motor_on), 
    .motor_direction(motor_direction), 
    .fan_on(fan_on)
  );

  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 0;
    up_button = 0;
    down_button = 0;
    doors_closed = 0;
    top_floor = 0;
    ground_floor = 1;

    // Wait 100 ns for global reset to finish
    #100;
    
    // Deassert reset
    reset = 1;
    #100;
    
    // Press the up button
    up_button = 1;
    #100;
    
    // Close the doors
    doors_closed = 1;
    #100;
    
    // Release the up button
    up_button = 0;
    #100;
    
    // Reach the top floor
    top_floor = 1;
    #100;
    
    // Press the down button
    down_button = 1;
    #100;
    
    // Close the doors
    doors_closed = 1;
    #100;
    
    // Release the down button
    down_button = 0;
    #100;
    
    // Reach the ground floor
    ground_floor = 1;
    #100;
  end
  
  // Generate clock
  always #10 clk = ~clk;

endmodule
