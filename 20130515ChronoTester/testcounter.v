module testcounter(clk,sw1,sw2,sw3, sw4, teststart,teststop1,teststop2,
						teststop3,teststop4,led,clkout);
    input clk;
	// input rst;
    input sw1;
	 input sw2;
	 input sw3;
	 input sw4;

//	 input range;
	 output [4:0] led;
    output teststart;
    output teststop1;
	 output teststop2;
	 output teststop3;
	 output teststop4;

	 output clkout;
	

reg [27:0] test1=0;
reg [3:0] test2=0;
	
reg [27:0] value=0;

reg [21:0] shift1=0;
reg [21:0] shift2=0;
reg [2:0] cnt=0;

reg teststart1=0;
reg teststop=0;
reg [4:0] ledreg=0;
wire rst;
wire sw1;
wire teststart;
wire sw3_sync;
wire sw2_sync;
wire clk4x;
wire clk1x;

////////////////////////////
parameter s0=0, s1=1,s2=2,s3=3;
reg [1:2] cs;
reg trig_pulse;
reg inc;
reg rst1;
reg rst2;
reg [3:0] pulse_cnt;
reg [26:0] delay_cnt;
wire time_5sec;

//////////////////////////////////


// Instantiate the UUT
/*
   clk4x UUT (
		.clk(clk), 	
		.clkdiv(clk1x    ), 
		.clk4x( clk4x   )
   );
  */
assign clkout=trig_pulse;//clk4x;
assign clk4x=clk;
assign teststart =  teststart1;

assign teststop1  =  teststop;
assign teststop2 =   teststop;
assign teststop3 =   teststop;
assign teststop4 =   teststop;
assign rst=0;


// Switches
 always  @(posedge clk4x or posedge rst)
 if(rst)
 	shift1<=0;
 else	 if (~sw3)	//triggering
  shift1<=22'h0fffff;//h0fffff
 else	if (shift1==5)
  shift1<=shift1;
 else
 	shift1<=shift1-1;

assign sw3_sync = (shift1==10)?1:0;

//////////////////////////////////


always  @(posedge clk4x or posedge rst)
 if (rst)
 	test1<=0;
 else if(trig_pulse)
 	test1<=0;
//else if (test1==26'h2_00_00_00)
else if (test1==28'h0_C0_00_00)
  test1<=test1;
 else
 	test1<=test1+1;

/////////////////////////////////////////

always  @(posedge clk4x or posedge rst)
 if (rst)
 	delay_cnt<=0;
 else if(rst1)
 	delay_cnt<=0;
 else	
  delay_cnt<=delay_cnt+1;
 

assign  time_5sec=delay_cnt[26]&delay_cnt[25];


always  @(posedge clk4x or posedge rst)
 if (rst)
 	pulse_cnt<=0;
 else if(rst2)
   pulse_cnt<=0;
 else	if(inc) 
  pulse_cnt<=pulse_cnt+1;
 else
 	pulse_cnt<=pulse_cnt;

always @(posedge clk4x or posedge rst)
if(rst)
	begin
	cs<=s0;
	trig_pulse<=0;
	inc <=0;
	rst1<=1;
	rst2<=1;
	end

else

begin
case(cs)
s0:	begin 
		trig_pulse<=0;
		inc<=0;
		rst1<=1;
		rst2<=1;
		
		if(sw3_sync==1) 
			cs <= s1 ;
		else 
			cs <= s0;
				 
		end

s1:	begin
		
		trig_pulse<=1;
		
		if(sw4==0) 
			cs <=s2;
		else
			cs <=s0; 	 
		
		end

s2:	begin
			trig_pulse<=0;
			inc<=0;
			rst1<=0;
			rst2<=0;
			if(time_5sec==1)
				begin
				cs<=s3;
				rst1<=1;
				end

			else
				cs<=s2;
		end

s3:	begin
      trig_pulse<=1;
		inc<=1;
		
		if(pulse_cnt==8)
			cs<=s0;
		else
			cs<=s2;
		end

default: cs<=s0;
endcase
end
///////////////////////////////////////////////////////
 
always @(negedge clk4x or posedge rst)
if(rst)
	teststart1<=0;
else if (test1==80)
	teststart1<=1;
else if (test1==90)//85
	teststart1<=0;
else
	teststart1<=teststart1;

always @(negedge clk4x or posedge rst)
if(rst)
	teststop<=0;
else if (test1==value+80)
	teststop<=1;
else if (test1==value+90)//85
	teststop<=0;

////////////////////////////////////////////////

// Switches

 always  @(posedge clk4x or posedge rst)
 if(rst)
 	shift2<=0;
 else	 if (~sw2)	 //time interval setting
  shift2<=22'h0fffff;
 else	if (shift2==5)
  shift2<=shift2;
 else
 	shift2<=shift2-1;

assign sw2_sync = (shift2==10)?1:0;

									  
always @(negedge clk4x or posedge rst)
if (rst)
	cnt<=0;
else if (cnt==5)
	cnt<=0;
else if (sw2_sync)
	cnt<= cnt + 1;		
else 
	cnt<=cnt;

always @ (cnt or   sw1)
case ({~sw1,cnt})	 /// range select i.e
0:	value<=25;       //100;    //25;//1us
1:	value<=125; //500;//125;//5us
2:	value<=250;//1000;//250;//10us
3:	value<=1250;//5000;//1250;//50us
4:	value<=2250;//9000; //2250;//90us

8:	 value<=25_000;//100_000;//25_000;//1ms
9:	 value<=125_000;//500_000;//125_000;//5ms
10: value<=250_000;//1000_000;//250_000;//10ms
11: value<=1250_000;//5000_000;//1250_000;//50ms
12: value<=2250_000;//9000_000;//2250_000;//90ms
default:	value<=25;//100;//25;
endcase

always @ (cnt)
case (cnt)
0:	ledreg<= 5'b00001;
1:	ledreg<= 5'b00010;
2:	ledreg<= 5'b00100;
3:	ledreg<= 5'b01000;
4:	ledreg<= 5'b10000;
default:	ledreg<= 5'b00001;
endcase

assign led[0] = ledreg[0]& (~delay_cnt[24]);
assign led[1] = ledreg[1]&(~delay_cnt[24]);
assign led[2] = ledreg[2]&(~delay_cnt[24]);
assign led[3] = ledreg[3]&(~delay_cnt[24]);
assign led[4] = ledreg[4]&(~delay_cnt[24]);



endmodule
