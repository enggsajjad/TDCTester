`timescale 1ns/1ns

module tf2();

// DATE:     09:29:52 10/05/2011 
// MODULE:   testcounter
// DESIGN:   testcounter
// FILENAME: tf2.v
// PROJECT:  TEST_CIRCUIT
// VERSION:  


// Inputs
    reg clk;
    reg sw1;
    reg sw2;
    reg sw3;
    reg sw4;
	 reg rst;


// Outputs
    wire teststart;
    wire teststop;
    wire [4:0] led;
    wire clkout;


// Bidirs


// Instantiate the UUT
    testcounter uut (
        .clk(clk), 
		  .rst(rst),
        .sw1(sw1), 
        .sw2(sw2), 
        .sw3(sw3), 
        .sw4(sw4), 
        .teststart(teststart), 
        .teststop(teststop), 
        .led(led), 
        .clkout(clkout)
        );


// Initialize Inputs
           initial begin
            clk = 0;
            sw1 = 1;
            sw2 = 1;
            sw3 = 1;
            sw4 = 0;
				rst =0;
				#100 rst=1;
				#100 rst=0;
			  #1000	sw3 = 0;
			  #100 sw3=1;

			  #1000_000	sw3 = 0;
			  #100 sw3=1;

        end

            

 always 
 #20 clk =~clk;


endmodule

