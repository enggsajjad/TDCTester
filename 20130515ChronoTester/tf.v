`timescale 1ns/1ns

module tf();

// DATE:     15:24:59 02/10/2011 
// MODULE:   testcounter
// DESIGN:   testcounter
// FILENAME: tf.v
// PROJECT:  TEST_CIRCUIT
// VERSION:  


// Inputs
    reg clk;
    reg sw1;
    reg sw2;


// Outputs
    wire teststart;
    wire teststop;
    wire [6:0] led;


// Bidirs


// Instantiate the UUT
    testcounter uut (
        .clk(clk), 
        .sw1(sw1), 
        .sw2(sw2), 
        .teststart(teststart), 
        .teststop(teststop), 
        .led(led)
        );


// Initialize Inputs
   

        initial begin
            clk = 0;
            sw1 = 1;
            sw2 = 1;
	        #1000	sw2 = 0;
			  #100 sw2=1;

			  #600_1000	sw1 = 0;
			  #100 sw1=1;
        end

    

 always 
 #20 clk =~clk;
endmodule

