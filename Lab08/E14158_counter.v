//CO221 - Digital Design - 2017
//Lab 8 : 4-bit Counter implementation in verilog
// E/14/158 Gihan Chanaka Jayatilaka
// Top level stimulus module
module testbed;

	// Declare variables for stimulating input
	reg CLK, CLEAR_BAR;
	wire [3:0] NUM;
	
	// Monitor changes in NUM and print once a change happens
	initial
		$monitor($time," Count : %d",NUM);
		
	//Instantiate the design block counter	
	//NUM is the 4-bit output from the counter
	//CLK is the clock signal
	//The counter should increment at each falling edge of the clock cycle 
	//CLEAR_BAR is the signal that asynchronously clears the counter. A CLEAR_BAR=0 should clear the counter.
	rippleCounter4 mycounter(NUM,CLK,CLEAR_BAR);	
		
	// reset	
	initial
	begin	
		CLEAR_BAR=1'b0;	
		#5 CLEAR_BAR=1'b1;
		#500 CLEAR_BAR=1'b0;
		#50 CLEAR_BAR=1'b1;
	end		
		
	// Set up the clock to toggle every 10 time units	
	initial
	begin
		
		//generate files needed to plot the waveform
		//you can plot the waveform generated after running the simulator by using gtkwave	
		$dumpfile("wavedata.vcd");
		$dumpvars(0,testbed);	
		CLK = 1'b0;
					
	end

	always #10 CLK = ~CLK; // An indefinite loop in which clock is complemented
								// after a delay of 10 time units	

	// Finish the simulation after 700 time units
	initial
	begin
		#700 $finish;
	end
	
endmodule

//your code goes here


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
	assign NOT_Q=i[4];

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


module T_flipFlop(Q,T,CLOCK,NOT_CLEAR);
	input T,CLOCK,NOT_CLEAR;
	output Q;
	wire i;
	D_flipFlop myD_flipFlop(Q,i,CLOCK,NOT_CLEAR);
	xor (i,T,Q);

endmodule




module rippleCounter4(count,CLOCK,NOT_CLEAR);
	input CLOCK,NOT_CLEAR;
	output [3:0] count;
	reg logicOne =1'b1;
	T_flipFlop myT_flipFlop_1(count[3],logicOne,count[2],NOT_CLEAR);
	T_flipFlop myT_flipFlop_2(count[2],logicOne,count[1],NOT_CLEAR);
	T_flipFlop myT_flipFlop_3(count[1],logicOne,count[0],NOT_CLEAR);
	T_flipFlop myT_flipFlop_4(count[0],logicOne,CLOCK,NOT_CLEAR);

endmodule
