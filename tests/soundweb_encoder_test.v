module soundweb_encoder_test;
  reg [7:0] command;
  reg [7:0] address_0;
  reg [7:0] address_1;
  reg [7:0] address_2;
  reg [7:0] address_3;
  reg [7:0] address_4;
  reg [7:0] address_5;
  reg [7:0] sv_0;
  reg [7:0] sv_1;
  reg [7:0] data_0;
  reg [7:0] data_1;
  reg [7:0] data_2;
  reg [7:0] data_3;

  wire [7:0] packet_0;
  wire [7:0] packet_1;
  wire [7:0] packet_2;
  wire [7:0] packet_3;
  wire [7:0] packet_4;
  wire [7:0] packet_5;
  wire [7:0] packet_6;
  wire [7:0] packet_7;
  wire [7:0] packet_8;
  wire [7:0] packet_9;
  wire [7:0] packet_10;
  wire [7:0] packet_11;
  wire [7:0] packet_12;
  wire [7:0] packet_13;
  wire [7:0] packet_14;
  wire [7:0] packet_15;
  wire [7:0] packet_16;
  wire [7:0] packet_17;
  wire [7:0] packet_18;
  wire [7:0] packet_19;
  wire [7:0] packet_20;
  wire [7:0] packet_21;
  wire [7:0] packet_22;
  wire [7:0] packet_23;
  wire [7:0] packet_24;
  wire [7:0] packet_25;
  wire [7:0] packet_26;
  wire [7:0] packet_27;
  wire [7:0] packet_28;

  soundweb_encoder u0 (
    .command   (command),
    .address_0 (address_0),
    .address_1 (address_1),
    .address_2 (address_2),
    .address_3 (address_3),
    .address_4 (address_4),
    .address_5 (address_5),
    .sv_0      (sv_0),
    .sv_1      (sv_1),
    .data_0    (data_0),
    .data_1    (data_1),
    .data_2    (data_2),
    .data_3    (data_3),

    .packet_0  (packet_0),
    .packet_1  (packet_1),
    .packet_2  (packet_2),
    .packet_3  (packet_3),
    .packet_4  (packet_4),
    .packet_5  (packet_5),
    .packet_6  (packet_6),
    .packet_7  (packet_7),
    .packet_8  (packet_8),
    .packet_9  (packet_9),
    .packet_10 (packet_10),
    .packet_11 (packet_11),
    .packet_12 (packet_12),
    .packet_13 (packet_13),
    .packet_14 (packet_14),
    .packet_15 (packet_15),
    .packet_16 (packet_16),
    .packet_17 (packet_17),
    .packet_18 (packet_18),
    .packet_19 (packet_19),
    .packet_20 (packet_20),
    .packet_21 (packet_21),
    .packet_22 (packet_22),
    .packet_23 (packet_23),
    .packet_24 (packet_24),
    .packet_25 (packet_25),
    .packet_26 (packet_26),
    .packet_27 (packet_27),
    .packet_28 (packet_28)
  );

  initial
  begin
    #010 command   = 8'h8D;
    #020 address_0 = 8'h10;
    #030 address_1 = 8'h01;
    #040 address_2 = 8'h03;
    #050 address_3 = 8'h00;
    #060 address_4 = 8'h01;
    #070 address_5 = 8'h37;
    #080 sv_0      = 8'h00;
    #090 sv_1      = 8'h00;
    #100 data_0    = 8'h00;
    #110 data_1    = 8'h64;
    #120 data_2    = 8'h00;
    #130 data_3    = 8'h00;
  end

endmodule
