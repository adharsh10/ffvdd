class lift_bfm;
virtual lift_intf intf;
mailbox gen2bfm;
int no_transactions;
function new(virtual lift_intf intf,mailbox gen2bfm);
this.intf = intf;
this.gen2bfm = gen2bfm;
endfunction
task reset;

wait(intf.rst);
$display("Reset Initiated");
intf.bfm_cb.up_button <= 0;
intf.bfm_cb.down_button <= 0;
intf.bfm_cb.doors_closed <= 0;
intf.bfm_cb.top_floor <= 0;
intf.bfm_cb.ground_floor <= 0;
wait(!intf.rst);
$display("Reset finished");
endtask



task main;
forever begin
lift_trans trans;
gen2bfm.get(trans);
$display("Transaction No. = %0d", no_transactions);
intf.bfm_cb.up_button <= trans.up_button;
intf.bfm_cb.down_button <= trans.down_button;
intf.bfm_cb.doors_closed <= trans.doors_closed;
intf.bfm_cb.top_floor <= trans.top_floor;
intf.bfm_cb.ground_floor <= trans.ground_floor;
repeat(2)@(posedge intf.clk);
trans.state = intf.bfm_cb.state;
trans.motor_on= intf.bfm_cb.motor_on;
trans.motor_direction= intf.bfm_cb.motor_direction;
trans.fan_on= intf.bfm_cb.fan_on;
trans.display();
no_transactions++;
end
endtask
endclass
