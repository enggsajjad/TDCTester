#include<reg2051.h>
#include<intrins.h> 
sbit relay = P1^3;
sbit UP_DWN  = P1^4;
sbit CLK = P1^5;
bit rxflag;
unsigned char rxChr;

void Delay25ms(void)
{
	TL0 = 0x4C;//25ms
	TH0 = 0x00;
	TR0 = 1;
	while(!TF0);
	TR0 = 0;
	TF0 = 0;
}
void PrintChar(unsigned char c)
{

	TI=1;
	while (!TI);	TI=0;	SBUF = c;
	while (!TI);	TI=0;
}
void PrintString(char *s)
{
	while (*s)
	{
		PrintChar(*s);
		s++;
	}
}
void main(void)
{
	SCON = 0x50;
	TMOD = 0x21;
	TL1 = 0xFD;
	TH1 = 0xFD;
	TR1 = 1;
	ES	  	= 1;
	EA   	= 1;
	PrintChar('A');
	PrintChar('A');
	PrintChar('A');
	while(1)
	{
	 	if(rxflag)
	 	{
	 	 	rxflag = 0;
	 	 	switch(rxChr)
	 	 	{
	 	 		case 'a':
			 	 	relay = 1;
					Delay25ms();
					Delay25ms();
					relay =0;
					break;
				case 'u':
					UP_DWN = 1;
					break;
				case 'd':
					UP_DWN = 0;
					break;
				case 'b':
					CLK = 0;
					Delay25ms();
					CLK =1;
					break;
				default:
					//PrintChar(rxChr);
					break;
			}//sw
	 	}//rxflag
	}//while
}//main
void Serial() interrupt 4
{
	if (RI)
	{
		RI = 0;
  		rxChr = SBUF;
  		rxflag = 1;
  	}//End if
}



