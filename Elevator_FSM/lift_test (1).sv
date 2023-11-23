program lift_test(lift_intf intf);
lift_env env;
initial begin
env = new(intf);
env.gen.repeat_count = 200;
env.run();
end
endprogram