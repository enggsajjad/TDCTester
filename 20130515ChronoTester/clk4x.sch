VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL clk
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL clk2x
        SIGNAL XLXN_6
        SIGNAL clkdiv
        SIGNAL XLXN_8
        SIGNAL XLXN_25
        SIGNAL XLXN_27
        SIGNAL XLXN_26
        SIGNAL XLXN_12
        SIGNAL clk4x
        PORT Input clk
        PORT Output clkdiv
        PORT Output clk4x
        BEGIN BLOCKDEF clkdll
            TIMESTAMP 2001 5 5 15 22 1
            LINE N 384 -512 320 -512 
            LINE N 384 -448 320 -448 
            LINE N 384 -384 320 -384 
            LINE N 0 -448 64 -448 
            LINE N 0 -512 64 -512 
            LINE N 0 -128 64 -128 
            LINE N 384 -128 320 -128 
            LINE N 384 -192 320 -192 
            LINE N 384 -256 320 -256 
            LINE N 384 -320 320 -320 
            LINE N 64 -432 80 -448 
            LINE N 80 -448 64 -464 
            LINE N 64 -496 80 -512 
            LINE N 80 -512 64 -528 
            RECTANGLE N 64 -576 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF ibufg
            TIMESTAMP 2001 2 2 12 53 1
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2001 2 2 12 51 12
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 2 2 12 52 44
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2001 2 2 12 53 52
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 clkdll
            BEGIN ATTR LOC "dll0"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
            BEGIN ATTR CLKDV_DIVIDE 16
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE Float
            END ATTR
            PIN CLKFB clk2x
            PIN CLKIN clkdiv
            PIN RST XLXN_26
            PIN CLK0
            PIN CLK180
            PIN CLK270
            PIN CLK2X XLXN_2
            PIN CLK90
            PIN CLKDV
            PIN LOCKED XLXN_25
        END BLOCK
        BEGIN BLOCK XLXI_2 clkdll
            BEGIN ATTR LOC "dll1"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
            BEGIN ATTR CLKDV_DIVIDE 16
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE Float
            END ATTR
            PIN CLKFB clk4x
            PIN CLKIN clk2x
            PIN RST XLXN_27
            PIN CLK0
            PIN CLK180
            PIN CLK270
            PIN CLK2X XLXN_8
            PIN CLK90
            PIN CLKDV
            PIN LOCKED
        END BLOCK
        BEGIN BLOCK XLXI_3 ibufg
            PIN I clk
            PIN O clkdiv
        END BLOCK
        BEGIN BLOCK XLXI_4 bufg
            BEGIN ATTR LOC "gclkbuf0"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
            PIN I XLXN_2
            PIN O clk2x
        END BLOCK
        BEGIN BLOCK XLXI_5 gnd
            PIN G XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_6 bufg
            BEGIN ATTR LOC "gclkbuf1"
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
            END ATTR
            PIN I XLXN_8
            PIN O clk4x
        END BLOCK
        BEGIN BLOCK XLXI_9 inv
            PIN I XLXN_25
            PIN O XLXN_27
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 864 1344 R0
            BEGIN DISPLAY 152 -632 ATTR LOC
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
            BEGIN DISPLAY 60 -704 ATTR CLKDV_DIVIDE
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE XLXI_2 1888 1344 R0
            BEGIN DISPLAY 120 -664 ATTR LOC
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
            BEGIN DISPLAY 16 -736 ATTR CLKDV_DIVIDE
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        INSTANCE XLXI_3 432 864 R0
        BEGIN INSTANCE XLXI_4 1376 1120 R0
            BEGIN DISPLAY 0 -64 ATTR LOC
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH clk
            WIRE 400 832 432 832
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1248 1088 1376 1088
        END BRANCH
        INSTANCE XLXI_5 640 1392 R0
        BEGIN BRANCH clk2x
            WIRE 800 896 864 896
            WIRE 800 896 800 1360
            WIRE 800 1360 1648 1360
            WIRE 1600 1088 1648 1088
            WIRE 1648 1088 1648 1360
            WIRE 1648 832 1888 832
            WIRE 1648 832 1648 1088
        END BRANCH
        BEGIN BRANCH clkdiv
            WIRE 640 928 720 928
            WIRE 640 928 640 1632
            WIRE 640 1632 1008 1632
            WIRE 656 832 720 832
            WIRE 720 832 864 832
            WIRE 720 832 720 928
        END BRANCH
        BEGIN INSTANCE XLXI_6 2336 1136 R0
            BEGIN DISPLAY 0 -64 ATTR LOC
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH XLXN_8
            WIRE 2272 1088 2288 1088
            WIRE 2288 1088 2288 1104
            WIRE 2288 1104 2336 1104
        END BRANCH
        INSTANCE XLXI_9 1328 1264 R0
        BEGIN BRANCH XLXN_25
            WIRE 1248 1216 1280 1216
            WIRE 1280 1216 1280 1232
            WIRE 1280 1232 1328 1232
        END BRANCH
        BEGIN BRANCH XLXN_27
            WIRE 1552 1232 1712 1232
            WIRE 1712 1216 1712 1232
            WIRE 1712 1216 1888 1216
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 704 1216 704 1264
            WIRE 704 1216 864 1216
        END BRANCH
        BEGIN BRANCH clk4x
            WIRE 1808 896 1888 896
            WIRE 1808 896 1808 1360
            WIRE 1808 1360 2624 1360
            WIRE 2560 1104 2624 1104
            WIRE 2624 1104 2624 1360
            WIRE 2624 1104 2960 1104
        END BRANCH
        IOMARKER 400 832 clk R180 28
        IOMARKER 1008 1632 clkdiv R0 28
        IOMARKER 2960 1104 clk4x R0 28
    END SHEET
END SCHEMATIC
