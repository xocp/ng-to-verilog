module mrcomputer(
	output [15:0] OUT0,
	output OUT1,
	input RST,
	input CLK
);

wire CLOCK_0_OUT;
wire mrreset_1_RST;
wire [15:0] mrregister_2_D_OUT;
wire [15:0] mrregister_2_I;
wire [15:0] mrregister_2_AH_ACC;
wire [15:0] mrregister_2_PG0_IDX0;
wire [15:0] mrregister_2_PG1_IDX1;
wire [15:0] mrregister_2_DEBUG;
wire [15:0] mrcontrolunit_3_DST;
wire [15:0] mrcontrolunit_3_SRC;
wire mrcontrolunit_3_STO_RAM;
wire mrcontrolunit_3_STO_REG;
wire mrcontrolunit_3_STO_ALU;
wire mrcontrolunit_3_STO_IO;
wire mrcontrolunit_3_J;
wire mrcontrolunit_3_PC_E;
wire [15:0] mrdatabus_4_OUT0;
wire [15:0] mrrom_ram_5_D_OUT;
wire [15:0] mraddressbus_6_OUT0;
wire [15:0] mralu_7_AH_ACC;
wire [15:0] mrio_8_D_OUT;
wire [15:0] mrprogramcounter_9_PC;

assign CLOCK_0_OUT = CLK;
	
mrreset mrreset_1(
	.RST (mrreset_1_RST),
	.RST_IN (RST),
	.CLK (CLOCK_0_OUT)
);
	
mrregister mrregister_2(
	.D_OUT (mrregister_2_D_OUT),
	.I (mrregister_2_I),
	.AH_ACC (mrregister_2_AH_ACC),
	.PG0_IDX0 (mrregister_2_PG0_IDX0),
	.PG1_IDX1 (mrregister_2_PG1_IDX1),
	.DEBUG (mrregister_2_DEBUG),
	.DST (mrcontrolunit_3_DST),
	.CLK (CLOCK_0_OUT),
	.D_IN (mrdatabus_4_OUT0),
	.SRC (mrcontrolunit_3_SRC),
	.RST (mrreset_1_RST),
	.STO (mrcontrolunit_3_STO_REG),
	.STO_ALU (mrcontrolunit_3_STO_ALU),
	.AH_ACC_IN (mralu_7_AH_ACC)
);
	
mrcontrolunit mrcontrolunit_3(
	.DST (mrcontrolunit_3_DST),
	.SRC (mrcontrolunit_3_SRC),
	.STO_RAM (mrcontrolunit_3_STO_RAM),
	.STO_REG (mrcontrolunit_3_STO_REG),
	.STO_ALU (mrcontrolunit_3_STO_ALU),
	.STO_IO (mrcontrolunit_3_STO_IO),
	.J (mrcontrolunit_3_J),
	.PC_E (mrcontrolunit_3_PC_E),
	.CLK (CLOCK_0_OUT),
	.RST (mrreset_1_RST),
	.I (mrregister_2_I),
	.ALU_ACC (mralu_7_AH_ACC),
	.D_IN (mrdatabus_4_OUT0)
);
	
mrdatabus mrdatabus_4(
	.OUT0 (mrdatabus_4_OUT0),
	.SRC (mrcontrolunit_3_SRC),
	.REG (mrregister_2_D_OUT),
	.ROM_RAM (mrrom_ram_5_D_OUT),
	.IO (mrio_8_D_OUT)
);
	
mrrom_ram mrrom_ram_5(
	.D_OUT (mrrom_ram_5_D_OUT),
	.ADDR (mraddressbus_6_OUT0),
	.D_IN (mrdatabus_4_OUT0),
	.STO (mrcontrolunit_3_STO_RAM),
	.CLK (CLOCK_0_OUT)
);
	
mraddressbus mraddressbus_6(
	.OUT0 (mraddressbus_6_OUT0),
	.SRC (mrcontrolunit_3_SRC),
	.PC (mrprogramcounter_9_PC),
	.AH_ACC (mrregister_2_AH_ACC),
	.PG0_IDX0 (mrregister_2_PG0_IDX0),
	.PG1_IDX1 (mrregister_2_PG1_IDX1)
);
	
mralu mralu_7(
	.AH_ACC (mralu_7_AH_ACC),
	.D_IN (mrdatabus_4_OUT0),
	.OP (mrregister_2_I),
	.AH_ACC_IN (mrregister_2_AH_ACC)
);
	
mrio mrio_8(
	.D_OUT (mrio_8_D_OUT),
	.D_IN (mrdatabus_4_OUT0),
	.ADDR (mraddressbus_6_OUT0),
	.STO (mrcontrolunit_3_STO_IO)
);
	
mrprogramcounter mrprogramcounter_9(
	.PC (mrprogramcounter_9_PC),
	.ST (mrcontrolunit_3_J),
	.ADDR (mraddressbus_6_OUT0),
	.CLK (CLOCK_0_OUT),
	.ENA (mrcontrolunit_3_PC_E),
	.RST (mrreset_1_RST)
);
	
assign OUT0 = mrregister_2_DEBUG;
assign OUT1 = CLOCK_0_OUT;

endmodule
