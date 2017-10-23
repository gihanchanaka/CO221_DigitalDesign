//CO221 - Digital Design 
// Project - Phase 2: Verilog implementation of the ALU
// March, 2017
// Test bed for the simple ALU

// Group no.: A6 
// Members:  	E/14/158 Gihan Chanaka Jayatilaka
//				E/14/222 Rahal Medawatta
//				E/14/198 Shashintha Maduraj

// Top level stimulus module
// This module can be directly used in your design
module testbed;

	reg [2:0] A,B;
	reg load1,load2,run;
	wire [3:0] C; 
	reg [3:0] op_code;

	//A and B are the two 3-bit inputs coming from switches
	//C is the 3-bit output that comes from the accumulator once run is set to high
	//load1 is the load signal for operand 1 register
	//load2 is the load signal for operand 2 register
	//op_code selects the operator
		// op_code=4'b0000 - Addition
		// op_code=4'b0001 - Bitwise XOR
		// op_code=4'b0010 - Multiplication
		// op_code=4'b0011 - Shift Left
		// op_code=4'b0100 - Shift Right
		// op_code=4'b0101 - Bitwise AND
		// op_code=4'b0110 - Bitwise OR
		// op_code=4'b0111 - Bitwise NAND
		// op_code=4'b1000 - Bitwise NOR
		// op_code=4'b1001 - One bit shift left
		// op_code=4'b1010 - One bit shift right

	//you don't have to model switches or the LEDs in Verilog

	// Instatiation of the ALU module
	ALU mu_alu(C,A,B,load1,load2,op_code,run);

	initial
	begin

		//generate files needed to plot the waveform
		//you can plot the waveform generated after running the simulator by using gtkwave
		$dumpfile("wavedata.vcd");
	    $dumpvars(0,testbed);

		//You should simulate the ALU for the given inputs
		// Input 1: A=5, B=2
		// Input 2: A=2, B=5
		//You should add another test case of your own as well
		//Out of the given op_codes and $display statements, you should select only those
		//corresponging to your implementation and erase others
	
		//A = 5 and B = 2
		A=7'd5; B=3'd7; 
		

		#5 load1=1'b1;
		#5 load1=1'b0;
		#5 load2=1'b1;
		#5 load2=1'b0;



		#5 op_code=4'b0000;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%d + %d = %d",A,B,C);
		#5 op_code=4'b0001;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ^ %b = %b",A,B,C);
		#5 op_code=4'b0011; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 2 = %b",A,C);
		#5 op_code=4'b0100; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b >> 2 = %b",A,C);
		#5 op_code=4'b0101;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b & %b = %b",A,B,C);
		#5 op_code=4'b0110;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b | %b = %b",A,B,C);
		#5 op_code=4'b0111;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~& %b = %b",A,B,C);
		#5 op_code=4'b1000; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~| %b = %b",A,B,C);
		#5 op_code=4'b1001; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 1 = %b",A,C);
		#5 op_code=4'b1010; 
		#5 run=1'b1;
		#5 run=1'b0;
		#5000  $display("%b >> 1 = %b\n",A,C);
		
		//A = 2 and B = 5
		#5 A=3'd2; B=3'd2; 
		#5 load1=1'b1;
		#5 load1=1'b0;
		#5 load2=1'b1;
		#5 load2=1'b0;
		#5 op_code=4'b0000;
		#5 run=1'b1;
		#5 run=1'b0;
		#500  $display("%d + %d = %d",A,B,C);
		#5 op_code=4'b0001;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ^ %b = %b",A,B,C);
		#5 op_code=4'b0011; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 2 = %b",A,C);
		#5 op_code=4'b0100; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b >> 2 = %b",A,C);
		#5 op_code=4'b0101;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b & %b = %b",A,B,C);
		#5 op_code=4'b0110;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b | %b = %b",A,B,C);
		#5 op_code=4'b0111;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~& %b = %b",A,B,C);
		#5 op_code=4'b1000; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~| %b = %b",A,B,C);
		#5 op_code=4'b1001; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 1 = %b",A,C);
		#5 op_code=4'b1010; 
		#5 run=1'b1;
		#5 run=1'b0;
		#5000 $display("%b >> 1 = %b\n",A,C);
		
		//Add your test case here.

		//A = 3 and B = 6
		A=7'd3; B=3'd6; 
		

		#5 load1=1'b1;
		#5 load1=1'b0;
		#5 load2=1'b1;
		#5 load2=1'b0;



		#5 op_code=4'b0000;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%d + %d = %d",A,B,C);
		#5 op_code=4'b0001;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ^ %b = %b",A,B,C);
		#5 op_code=4'b0011; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 2 = %b",A,C);
		#5 op_code=4'b0100; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b >> 2 = %b",A,C);
		#5 op_code=4'b0101;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b & %b = %b",A,B,C);
		#5 op_code=4'b0110;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b | %b = %b",A,B,C);
		#5 op_code=4'b0111;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~& %b = %b",A,B,C);
		#5 op_code=4'b1000; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~| %b = %b",A,B,C);
		#5 op_code=4'b1001; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 1 = %b",A,C);
		#5 op_code=4'b1010; 
		#5 run=1'b1;
		#5 run=1'b0;
		#5000  $display("%b >> 1 = %b\n",A,C);
		
		//A = 6 and B = 3
		#5 A=3'd6; B=3'd3; 
		#5 load1=1'b1;
		#5 load1=1'b0;
		#5 load2=1'b1;
		#5 load2=1'b0;
		#5 op_code=4'b0000;
		#5 run=1'b1;
		#5 run=1'b0;
		#500  $display("%d + %d = %d",A,B,C);
		#5 op_code=4'b0001;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ^ %b = %b",A,B,C);
		#5 op_code=4'b0010; 
		#5 op_code=4'b0011; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 2 = %b",A,C);
		#5 op_code=4'b0100; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b >> 2 = %b",A,C);
		#5 op_code=4'b0101;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b & %b = %b",A,B,C);
		#5 op_code=4'b0110;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b | %b = %b",A,B,C);
		#5 op_code=4'b0111;
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~& %b = %b",A,B,C);
		#5 op_code=4'b1000; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b ~| %b = %b",A,B,C);
		#5 op_code=4'b1001; 
		#5 run=1'b1;
		#5 run=1'b0;
		#500 $display("%b << 1 = %b",A,C);
		#5 op_code=4'b1010; 
		#5 run=1'b1;
		#5 run=1'b0;
		#5000 $display("%b >> 1 = %b\n",A,C);
		
		$finish;	
		
	end

endmodule

module ALU(C,A,B,load1,load2,op_code,run);
	input [2:0] A;
	input [2:0] B;
	input load1;
	input load2;
	input [3:0] op_code;
	input run;
	output [3:0] C;

	wire [2:0] savedA;
	wire [2:0] savedB;
	wire [3:0] toStroreToC;
	ThreeBitRegister registerA(savedA,A,load1);
	ThreeBitRegister registerB(savedB,B,load1);



	wire [3:0] addition;
	wire [3:0] shiftRightOneBit;
	wire [3:0] shiftLeftOneBit;
	wire [3:0] bitWiseXOR;
	wire [3:0] bitWiseAND;
	wire [3:0] bitWiseOR;
	wire [3:0] bitWiseNAND;
	wire [3:0] bitWiseNOR;
	wire [3:0] shiftRightTwoBit;
	wire [3:0] shiftLeftTwoBit;

	FourBitFullAdder myFourBitFullAdder(addition,savedA,savedB);
	OneBitRightShiftRegister myOneBitShiftRightRegister(shiftRightOneBit,savedA,run);
	BitWiseXORThreeBit myBitWiseXORThreeBit(bitWiseXOR,savedA,savedB);
	BitWiseANDThreeBit myBitWiseANDThreeBit(bitWiseAND,savedA,savedB);
	BitWiseORThreeBit myBitWiseORThreeBit(bitWiseOR,savedA,savedB);
	BitWiseNANDThreeBit myBitWiseNANDThreeBit(bitWiseNAND,savedA,savedB);
	BitWiseNORThreeBit myBitWiseNORThreeBit(bitWiseNOR,savedA,savedB);
	OneBitLeftShiftRegister myOneBitLeftShiftRegister(shiftLeftOneBit,savedA,run);
	TwoBitRightShiftRegister myTwoBitRightShiftRegister(shiftRightTwoBit,savedA,run);
	TwoBitLeftShiftRegister myTwoBitLeftShiftRegister(shiftLeftTwoBit,savedA,run);


	MultiplexerTenOptionFourBit myMulti(toStroreToC,addition,bitWiseXOR,0,shiftLeftTwoBit,shiftRightTwoBit,bitWiseAND,bitWiseOR,bitWiseNAND,bitWiseNOR,shiftLeftOneBit,shiftRightOneBit,op_code);
	FourBitRegister registerC(C,toStroreToC , run);
endmodule



module XORgate(ans,a,b);
	output ans;
	input a,b;
	wire aNOT,bNOT,i,j;

	not(aNOT,a);
	not(bNOT,b);
	and(i,a,bNOT);
	and(j,aNOT,b);
	or(ans,i,j);
endmodule


module SR_latch(Q,NOT_Q,S,R,NOT_CLEAR);
	input S,R,NOT_CLEAR;
	output Q,NOT_Q;
	nand (Q,S,NOT_Q);
	nand (NOT_Q,R,Q,NOT_CLEAR);
endmodule



module D_latch(Q,D,Enable,NOT_CLEAR);
	input D,Enable,NOT_CLEAR;
	output Q;
	wire [5:0] i;//Intermediate wires

	not (i[0],D);
	nand (i[1],D,Enable);
	nand (i[2],i[0],Enable);
	
	SR_latch mySR_latch(i[3],i[4],i[1],i[2],NOT_CLEAR);

	assign Q=i[3];

endmodule



module D_flipFlop(Q,D,CLOCK,NOT_CLEAR);
	input D,NOT_CLEAR,CLOCK;
	output Q;
	wire [10:0] i;//Intermeidate wires

	D_latch master(i[0],D,CLOCK,NOT_CLEAR);
	not (i[1],CLOCK);
	D_latch slave(i[2],i[0],i[1],NOT_CLEAR);
	assign Q=i[2];

endmodule

module OneBitRegister(Q,D,CLOCK,CLEAR);
	input D,CLOCK,CLEAR;
	output Q;
	wire i;
	not(i,CLEAR);
	D_flipFlop myD_flipFlop(Q,D,CLOCK,i);
endmodule

module ThreeBitRegister(savedValue,inputValue,loadSignal);
	input [2:0] inputValue;
	input loadSignal;
	output [2:0] savedValue;
	wire i,NOT_SIGNAL;
	
	not(i,loadSignal);
	and(NOT_SIGNAL,i,loadSignal);

	OneBitRegister reg_1(savedValue[2],inputValue[2],loadSignal,NOT_SIGNAL);
	OneBitRegister reg_2(savedValue[1],inputValue[1],loadSignal,NOT_SIGNAL);
	OneBitRegister reg_3(savedValue[0],inputValue[0],loadSignal,NOT_SIGNAL);


endmodule

module FourBitRegister(savedValue,inputValue,loadSignal);
	output [3:0] savedValue;
	input loadSignal;
	input [3:0] inputValue;

	OneBitRegister reg_1(savedValue[3],inputValue[3],loadSignal,0);
	OneBitRegister reg_2(savedValue[2],inputValue[2],loadSignal,0);
	OneBitRegister reg_3(savedValue[1],inputValue[1],loadSignal,0);
	OneBitRegister reg_4(savedValue[0],inputValue[0],loadSignal,0);
endmodule

module T_flipFlop(Q,T,CLOCK,NOT_CLEAR);
	input T,CLOCK,NOT_CLEAR;
	output Q;
	wire i;
	D_flipFlop myD_flipFlop(Q,i,CLOCK,NOT_CLEAR);
	XORgate myXORgate(i,T,Q);

endmodule



module OneBitHalfAdder(carryOut,sum,a,b);
	output carryOut,sum;
	input a,b;

	and(carryOut,a,b);
	XORgate myXORgate(sum,a,b);

endmodule


module OneBitFullAdder(carryOut,sum,a,b,carryIn);
	output carryOut,sum;
	input a,b,carryIn;
	wire i,j,k;

	OneBitHalfAdder myOneBitHalfAdder_1(i,j,a,b);
	OneBitHalfAdder myOneBitHalfAdder_2(k,sum,carryIn,j);
	or(carryOut,k,i);

endmodule


module FourBitFullAdder(sum,a,b);
	input [2:0] a;
	input [2:0] b;
	output [3:0] sum;
	wire [1:0] i;

	OneBitFullAdder myOneBitFullAdder_0(i[0],sum[0],a[0],b[0],0);
	OneBitFullAdder myOneBitFullAdder_1(i[1],sum[1],a[1],b[1],i[0]);
	OneBitFullAdder myOneBitFullAdder_2(sum[3],sum[2],a[2],b[2],i[1]);
endmodule


module Multiplexer(answer,a,b,controlSignal);
	output answer;
	input a,b,controlSignal;
	wire controlSignalInverted,a_,b_;
	not(controlSignalInverted,controlSignal);
	and(a_,a,controlSignalInverted);
	and(b_,b,controlSignal);
	or(answer,a_,b_);

endmodule


module MultiplexerElevelOption(answer,inLine,controlSignal);
	output answer;
	input [10:0] inLine;
	input [3:0] controlSignal;
	wire [3:0] controlSignalInverted;
	wire [10:0] i;

	not(controlSignalInverted[0],controlSignal[0]);
	not(controlSignalInverted[1],controlSignal[1]);
	not(controlSignalInverted[2],controlSignal[2]);
	not(controlSignalInverted[3],controlSignal[3]);

	and(i[0],inLine[0],controlSignalInverted[3],controlSignalInverted[2],controlSignalInverted[1],controlSignalInverted[0]);
	and(i[1],inLine[1],controlSignalInverted[3],controlSignalInverted[2],controlSignalInverted[1],controlSignal[0]);
	and(i[2],inLine[2],controlSignalInverted[3],controlSignalInverted[2],controlSignal[1],controlSignalInverted[0]);
	and(i[3],inLine[3],controlSignalInverted[3],controlSignalInverted[2],controlSignal[1],controlSignal[0]);
	and(i[4],inLine[4],controlSignalInverted[3],controlSignal[2],controlSignalInverted[1],controlSignalInverted[0]);
	and(i[5],inLine[5],controlSignalInverted[3],controlSignal[2],controlSignalInverted[1],controlSignal[0]);
	and(i[6],inLine[6],controlSignalInverted[3],controlSignal[2],controlSignal[1],controlSignalInverted[0]);
	and(i[7],inLine[6],controlSignalInverted[3],controlSignal[2],controlSignal[1],controlSignal[0]);
	and(i[8],inLine[8],controlSignal[3],controlSignalInverted[2],controlSignalInverted[1],controlSignalInverted[0]);
	and(i[9],inLine[9],controlSignal[3],controlSignalInverted[2],controlSignalInverted[1],controlSignal[0]);
	and(i[10],inLine[10],controlSignal[3],controlSignalInverted[2],controlSignal[1],controlSignalInverted[0]);


	or(answer,i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8],i[9],i[10]);

endmodule


module MultiplexerTenOptionFourBit(answer,addition,bitwiseXOR,multiplication,shiftLeftTwoBit,shiftRightTwoBit,bitwiseAND,bitwiseOR,bitwiseNAND,bitwiseNOR,shiftLeftOneBit,shiftRightOneBit,controlSignal);
	output [3:0] answer;
	input [3:0] controlSignal;
	input [3:0] addition;
	input [3:0] bitwiseXOR;
	input [3:0] multiplication;
	input [3:0] shiftLeftTwoBit;
	input [3:0] shiftRightTwoBit;
	input [3:0] bitwiseAND;
	input [3:0] bitwiseOR;
	input [3:0] bitwiseNAND;
	input [3:0] bitwiseNOR;
	input [3:0] shiftLeftOneBit;
	input [3:0] shiftRightOneBit;



	wire [10:0] inLine_0;
	wire [10:0] inLine_1;
	wire [10:0] inLine_2;
	wire [10:0] inLine_3;

	assign inLine_0[0]=addition[0];
	assign inLine_0[1]=bitwiseXOR[0];
	assign inLine_0[2]=multiplication[0];
	assign inLine_0[3]=shiftLeftTwoBit[0];
	assign inLine_0[4]=shiftRightTwoBit[0];
	assign inLine_0[5]=bitwiseAND[0];
	assign inLine_0[6]=bitwiseOR[0];
	assign inLine_0[7]=bitwiseNAND[0];
	assign inLine_0[8]=bitwiseNOR[0];
	assign inLine_0[9]=shiftLeftOneBit[0];
	assign inLine_0[10]=shiftRightOneBit[0];

	assign inLine_1[0]=addition[1];
	assign inLine_1[1]=bitwiseXOR[1];
	assign inLine_1[2]=multiplication[1];
	assign inLine_1[3]=shiftLeftTwoBit[1];
	assign inLine_1[4]=shiftRightTwoBit[1];
	assign inLine_1[5]=bitwiseAND[1];
	assign inLine_1[6]=bitwiseOR[1];
	assign inLine_1[7]=bitwiseNAND[1];
	assign inLine_1[8]=bitwiseNOR[1];
	assign inLine_1[9]=shiftLeftOneBit[1];
	assign inLine_1[10]=shiftRightOneBit[1];


	assign inLine_2[0]=addition[2];
	assign inLine_2[1]=bitwiseXOR[2];
	assign inLine_2[2]=multiplication[2];
	assign inLine_2[3]=shiftLeftTwoBit[2];
	assign inLine_2[4]=shiftRightTwoBit[2];
	assign inLine_2[5]=bitwiseAND[2];
	assign inLine_2[6]=bitwiseOR[2];
	assign inLine_2[7]=bitwiseNAND[2];
	assign inLine_2[8]=bitwiseNOR[2];
	assign inLine_2[9]=shiftLeftOneBit[2];
	assign inLine_2[10]=shiftRightOneBit[2];

	assign inLine_3[0]=addition[3];
	assign inLine_3[1]=bitwiseXOR[3];
	assign inLine_3[2]=multiplication[3];
	assign inLine_3[3]=shiftLeftTwoBit[3];
	assign inLine_3[4]=shiftRightTwoBit[3];
	assign inLine_3[5]=bitwiseAND[3];
	assign inLine_3[6]=bitwiseOR[3];
	assign inLine_3[7]=bitwiseNAND[3];
	assign inLine_3[8]=bitwiseNOR[3];
	assign inLine_3[9]=shiftLeftOneBit[3];
	assign inLine_3[10]=shiftRightOneBit[3];


	MultiplexerElevelOption myMultiplexerElevenOption_0(answer[0],inLine_0,controlSignal);
	MultiplexerElevelOption myMultiplexerElevenOption_1(answer[1],inLine_1,controlSignal);
	MultiplexerElevelOption myMultiplexerElevenOption_2(answer[2],inLine_2,controlSignal);
	MultiplexerElevelOption myMultiplexerElevenOption_3(answer[3],inLine_3,controlSignal);


endmodule

module Decoder(answer,controlSignal,active);
		output [3:0] answer;
		input [1:0] controlSignal;
		input active;
		wire [10:0] invertedControlSignal;

		not(invertedControlSignal[0],controlSignal[0]);
		not(invertedControlSignal[1],controlSignal[1]);
		and(answer[0],invertedControlSignal[0],invertedControlSignal[1],active);
		and(answer[1],controlSignal[0],invertedControlSignal[1],active);
		and(answer[2],invertedControlSignal[0],controlSignal[1],active);
		and(answer[3],controlSignal[0],controlSignal[1],active);

endmodule

module TwoBitRightShiftRegister(answer,data,CLOCK);
	output [3:0] answer;
	input [2:0] data;
	input CLOCK;
	reg CLOCK_2;
	reg  CLOCK_3;
	wire [3:0] decoded;
	wire [3:0] i;



	Multiplexer myMultiplexer_0(i[0],data[0],answer[1],CLOCK_2);
	Multiplexer myMultiplexer_1(i[1],data[1],answer[2],CLOCK_2);
	Multiplexer myMultiplexer_2(i[2],data[2],0,CLOCK_2);
	Multiplexer myMultiplexer_3(i[3],0,0,CLOCK_2);



	OneBitRegister myOneBitRegister_0(answer[0],i[0],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_1(answer[1],i[1],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_2(answer[2],i[2],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_3(answer[3],i[3],CLOCK_3,1'b1);


	always @(posedge CLOCK)
	begin
		CLOCK_2=1'b0;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;
		#5 CLOCK_2=1'b1;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;
		#5 CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;

	end

endmodule


module OneBitRightShiftRegister(answer,data,CLOCK);
	output [3:0] answer;
	input [2:0] data;
	input CLOCK;
	reg CLOCK_2;
	reg  CLOCK_3;
	wire [3:0] decoded;
	wire [3:0] i;



	Multiplexer myMultiplexer_0(i[0],data[0],answer[1],CLOCK_2);
	Multiplexer myMultiplexer_1(i[1],data[1],answer[2],CLOCK_2);
	Multiplexer myMultiplexer_2(i[2],data[2],0,CLOCK_2);
	Multiplexer myMultiplexer_3(i[3],0,0,CLOCK_2);



	OneBitRegister myOneBitRegister_0(answer[0],i[0],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_1(answer[1],i[1],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_2(answer[2],i[2],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_3(answer[3],i[3],CLOCK_3,1'b1);


	always @(posedge CLOCK)
	begin
		CLOCK_2=1'b0;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;
		#5 CLOCK_2=1'b1;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;

	end


endmodule


module OneBitLeftShiftRegister(answer,data,CLOCK);
	output [3:0] answer;
	input [2:0] data;
	input CLOCK;
	reg CLOCK_2;
	reg  CLOCK_3;
	wire [3:0] decoded;
	wire [3:0] i;



	Multiplexer myMultiplexer_0(i[0],data[0],1'b0,CLOCK_2);
	Multiplexer myMultiplexer_1(i[1],data[1],answer[0],CLOCK_2);
	Multiplexer myMultiplexer_2(i[2],data[2],answer[1],CLOCK_2);
	Multiplexer myMultiplexer_3(i[3],0,answer[2],CLOCK_2);



	OneBitRegister myOneBitRegister_0(answer[0],i[0],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_1(answer[1],i[1],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_2(answer[2],i[2],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_3(answer[3],i[3],CLOCK_3,1'b0);


	always @(posedge CLOCK)
	begin
		CLOCK_2=1'b0;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;
		#5 CLOCK_2=1'b1;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;

	end


endmodule

module TwoBitLeftShiftRegister(answer,data,CLOCK);
	output [3:0] answer;
	input [2:0] data;
	input CLOCK;
	reg CLOCK_2;
	reg  CLOCK_3;
	wire [3:0] decoded;
	wire [3:0] i;



	Multiplexer myMultiplexer_0(i[0],data[0],1'b0,CLOCK_2);
	Multiplexer myMultiplexer_1(i[1],data[1],answer[0],CLOCK_2);
	Multiplexer myMultiplexer_2(i[2],data[2],answer[1],CLOCK_2);
	Multiplexer myMultiplexer_3(i[3],0,answer[2],CLOCK_2);



	OneBitRegister myOneBitRegister_0(answer[0],i[0],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_1(answer[1],i[1],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_2(answer[2],i[2],CLOCK_3,1'b0);
	OneBitRegister myOneBitRegister_3(answer[3],i[3],CLOCK_3,1'b0);


	always @(posedge CLOCK)
	begin
		CLOCK_2=1'b0;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;
		#5 CLOCK_2=1'b1;
		CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;
		#5 CLOCK_3=1'b0;
		#5 CLOCK_3=1'b1;

	end


endmodule

module BitWiseXORThreeBit(ans,a,b);
	output [3:0] ans;
	input [2:0] a;
	input [2:0] b;

	 XORgate myXORgate_0(ans[0],a[0],b[0]);
	 XORgate myXORgate_1(ans[1],a[1],b[1]);
	 XORgate myXORgate_2(ans[2],a[2],b[2]);
	 assign ans[3] =1'b0 ;

endmodule


module BitWiseANDThreeBit(ans,a,b);
	output [3:0] ans;
	input [2:0] a;
	input [2:0] b;

	and(ans[0],a[0],b[0]);
	and(ans[1],a[1],b[1]);
	and(ans[2],a[2],b[2]);
	assign ans[3] =1'b0 ;

endmodule



module BitWiseORThreeBit(ans,a,b);
	output [3:0] ans;
	input [2:0] a;
	input [2:0] b;

	or(ans[0],a[0],b[0]);
	or(ans[1],a[1],b[1]);
	or(ans[2],a[2],b[2]);
	assign ans[3] =1'b0 ;

endmodule

module NANDgate(ans,a,b);
	output ans;
	input a,b;
	wire i;
	and(i,a,b);
	not(ans,i);
endmodule

module NORgate(ans,a,b);
	output ans;
	input a,b;
	wire i;
	or(i,a,b);
	not(ans,i);
endmodule


module BitWiseNANDThreeBit(ans,a,b);
	output [3:0] ans;
	input [2:0] a;
	input [2:0] b;

	NANDgate myNANDgate_0(ans[0],a[0],b[0]);
	NANDgate myNANDgate_1(ans[1],a[1],b[1]);
	NANDgate myNANDgate_2(ans[2],a[2],b[2]);
	assign ans[3]=1'b1;
endmodule

module BitWiseNORThreeBit(ans,a,b);
	output [3:0] ans;
	input [2:0] a;
	input [2:0] b;

	NORgate myNORgate_0(ans[0],a[0],b[0]);
	NORgate myNORgate_1(ans[1],a[1],b[1]);
	NORgate myNORgate_2(ans[2],a[2],b[2]);
	assign ans[3]=1'b1;
endmodule