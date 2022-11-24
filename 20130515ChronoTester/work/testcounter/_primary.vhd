library verilog;
use verilog.vl_types.all;
entity testcounter is
    port(
        teststop        : out    vl_logic;
        teststart       : out    vl_logic;
        clkout          : out    vl_logic;
        sw4             : in     vl_logic;
        sw3             : in     vl_logic;
        sw2             : in     vl_logic;
        sw1             : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        led             : out    vl_logic_vector(4 downto 0)
    );
end testcounter;
