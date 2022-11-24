library verilog;
use verilog.vl_types.all;
entity clk4x is
    port(
        clk             : in     vl_logic;
        clkdiv          : out    vl_logic;
        clk4x           : out    vl_logic
    );
end clk4x;
