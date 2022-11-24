library verilog;
use verilog.vl_types.all;
entity glbl is
    generic(
        roc_width       : integer := 100000;
        toc_width       : integer := 0
    );
end glbl;
