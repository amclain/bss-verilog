module soundweb_encoder(
  input [7:0] command,
  input [7:0] address_0,
  input [7:0] address_1,
  input [7:0] address_2,
  input [7:0] address_3,
  input [7:0] address_4,
  input [7:0] address_5,
  input [7:0] sv_0,
  input [7:0] sv_1,
  input [7:0] data_0,
  input [7:0] data_1,
  input [7:0] data_2,
  input [7:0] data_3,

  output [7:0] packet_0,
  output [7:0] packet_1,
  output [7:0] packet_2,
  output [7:0] packet_3,
  output [7:0] packet_4,
  output [7:0] packet_5,
  output [7:0] packet_6,
  output [7:0] packet_7,
  output [7:0] packet_8,
  output [7:0] packet_9,
  output [7:0] packet_10,
  output [7:0] packet_11,
  output [7:0] packet_12,
  output [7:0] packet_13,
  output [7:0] packet_14,
  output [7:0] packet_15,
  output [7:0] packet_16,
  output [7:0] packet_17,
  output [7:0] packet_18,
  output [7:0] packet_19,
  output [7:0] packet_20,
  output [7:0] packet_21,
  output [7:0] packet_22,
  output [7:0] packet_23,
  output [7:0] packet_24,
  output [7:0] packet_25,
  output [7:0] packet_26,
  output [7:0] packet_27,
  output [7:0] packet_28
);

parameter ESC = 8'h1B;

wire [7:0] address [0:5];
wire [7:0] sv      [0:1];
wire [7:0] data    [0:3];

reg  [7:0] output_buffer [0:28];

assign address[0] = address_0;
assign address[1] = address_1;
assign address[2] = address_2;
assign address[3] = address_3;
assign address[4] = address_4;
assign address[5] = address_5;

assign sv[0] = sv_0;
assign sv[1] = sv_1;

assign data[0] = data_0;
assign data[1] = data_1;
assign data[2] = data_2;
assign data[3] = data_3;

assign packet_0  = output_buffer[0];
assign packet_1  = output_buffer[1];
assign packet_2  = output_buffer[2];
assign packet_3  = output_buffer[3];
assign packet_4  = output_buffer[4];
assign packet_5  = output_buffer[5];
assign packet_6  = output_buffer[6];
assign packet_7  = output_buffer[7];
assign packet_8  = output_buffer[8];
assign packet_9  = output_buffer[9];
assign packet_10 = output_buffer[10];
assign packet_11 = output_buffer[11];
assign packet_12 = output_buffer[12];
assign packet_13 = output_buffer[13];
assign packet_14 = output_buffer[14];
assign packet_15 = output_buffer[15];
assign packet_16 = output_buffer[16];
assign packet_17 = output_buffer[17];
assign packet_18 = output_buffer[18];
assign packet_19 = output_buffer[19];
assign packet_20 = output_buffer[20];
assign packet_21 = output_buffer[21];
assign packet_22 = output_buffer[22];
assign packet_23 = output_buffer[23];
assign packet_24 = output_buffer[24];
assign packet_25 = output_buffer[25];
assign packet_26 = output_buffer[26];
assign packet_27 = output_buffer[27];

wire [7:0]  input_buffer  [0:12];
reg  [5:0]  output_offset [0:12];
reg  [12:0] input_byte_is_escaped;

parameter COMMAND   = 0;
parameter ADDRESS_0 = 1;
parameter ADDRESS_1 = 2;
parameter ADDRESS_2 = 3;
parameter ADDRESS_3 = 4;
parameter ADDRESS_4 = 5;
parameter ADDRESS_5 = 6;
parameter SV_0      = 7;
parameter SV_1      = 8;
parameter DATA_0    = 9;
parameter DATA_1    = 10;
parameter DATA_2    = 11;
parameter DATA_3    = 12;
parameter CHECKSUM  = 13; // Not in the input buffer, but included in `input_byte_is_escaped`.

assign input_buffer[COMMAND]   = command;
assign input_buffer[ADDRESS_0] = address[0];
assign input_buffer[ADDRESS_1] = address[1];
assign input_buffer[ADDRESS_2] = address[2];
assign input_buffer[ADDRESS_3] = address[3];
assign input_buffer[ADDRESS_4] = address[4];
assign input_buffer[ADDRESS_5] = address[5];
assign input_buffer[SV_0]      = sv[0];
assign input_buffer[SV_1]      = sv[1];
assign input_buffer[DATA_0]    = data[0];
assign input_buffer[DATA_1]    = data[1];
assign input_buffer[DATA_2]    = data[2];
assign input_buffer[DATA_3]    = data[3];

always @(*)
begin
  output_offset[0]  = 0;
  output_offset[1]  = 0;
  output_offset[2]  = 0;
  output_offset[3]  = 0;
  output_offset[4]  = 0;
  output_offset[5]  = 0;
  output_offset[6]  = 0;
  output_offset[7]  = 0;
  output_offset[8]  = 0;
  output_offset[9]  = 0;
  output_offset[10] = 0;
  output_offset[11] = 0;
  output_offset[12] = 0;

  input_byte_is_escaped = 13'b0000000000000;

  output_buffer[0] = 8'h02;
  output_buffer[1] = input_buffer[COMMAND];

  if (is_reserved_byte(input_buffer[ADDRESS_0])) begin
    input_byte_is_escaped[ADDRESS_0] = 1'b1;
    output_buffer[2 + output_offset[ADDRESS_0]] = ESC;
    output_buffer[3 + output_offset[ADDRESS_0]] = input_buffer[ADDRESS_0] + 8'h80;
  end else begin
    input_byte_is_escaped[ADDRESS_0] = 1'b0;
    output_buffer[2 + output_offset[ADDRESS_0]] = input_buffer[ADDRESS_0];
  end

  if (input_byte_is_escaped[ADDRESS_0]) begin
    output_offset[ADDRESS_1] = output_offset[ADDRESS_1] + 1;
    output_offset[ADDRESS_2] = output_offset[ADDRESS_2] + 1;
    output_offset[ADDRESS_3] = output_offset[ADDRESS_3] + 1;
    output_offset[ADDRESS_4] = output_offset[ADDRESS_4] + 1;
    output_offset[ADDRESS_5] = output_offset[ADDRESS_5] + 1;
  end

  if (is_reserved_byte(input_buffer[ADDRESS_1])) begin
    input_byte_is_escaped[ADDRESS_1] = 1'b1;
    output_buffer[3 + output_offset[ADDRESS_1]] = ESC;
    output_buffer[4 + output_offset[ADDRESS_1]] = input_buffer[ADDRESS_1] + 8'h80;
  end else begin
    input_byte_is_escaped[ADDRESS_1] = 1'b0;
    output_buffer[3 + output_offset[ADDRESS_1]] = input_buffer[ADDRESS_1];
  end

  if (input_byte_is_escaped[ADDRESS_1]) begin
    output_offset[ADDRESS_2] = output_offset[ADDRESS_2] + 1;
    output_offset[ADDRESS_3] = output_offset[ADDRESS_3] + 1;
    output_offset[ADDRESS_4] = output_offset[ADDRESS_4] + 1;
    output_offset[ADDRESS_5] = output_offset[ADDRESS_5] + 1;
  end

  // if (is_reserved_byte(address[2])) begin
  //   address_is_escaped[2] = 1'b1;
  //   output_buffer[4 + address_output_offset[2]] = ESC;
  //   output_buffer[5 + address_output_offset[2]] = address[2] + 8'h80;
  // end else begin
  //   address_is_escaped[2] = 1'b0;
  //   output_buffer[4 + address_output_offset[2]] = address[2];
  // end

  // if (address_is_escaped[2]) begin
  //   address_output_offset[3] = address_output_offset[3] + 1;
  //   address_output_offset[4] = address_output_offset[4] + 1;
  //   address_output_offset[5] = address_output_offset[5] + 1;
  // end

  // if (is_reserved_byte(address[3])) begin
  //   address_is_escaped[3] = 1'b1;
  //   output_buffer[5 + address_output_offset[3]] = ESC;
  //   output_buffer[6 + address_output_offset[3]] = address[3] + 8'h80;
  // end else begin
  //   address_is_escaped[3] = 1'b0;
  //   output_buffer[5 + address_output_offset[3]] = address[3];
  // end

  // if (address_is_escaped[3]) begin
  //   address_output_offset[4] = address_output_offset[4] + 1;
  //   address_output_offset[5] = address_output_offset[5] + 1;
  // end

  // if (is_reserved_byte(address[4])) begin
  //   address_is_escaped[4] = 1'b1;
  //   output_buffer[6 + address_output_offset[4]] = ESC;
  //   output_buffer[7 + address_output_offset[4]] = address[4] + 8'h80;
  // end else begin
  //   address_is_escaped[4] = 1'b0;
  //   output_buffer[6 + address_output_offset[4]] = address[4];
  // end

  // if (address_is_escaped[4]) begin
  //   address_output_offset[5] = address_output_offset[5] + 1;
  // end

  // if (is_reserved_byte(address[5])) begin
  //   address_is_escaped[5] = 1'b1;
  //   output_buffer[7 + address_output_offset[5]] = ESC;
  //   output_buffer[8 + address_output_offset[5]] = address[5] + 8'h80;
  // end else begin
  //   address_is_escaped[5] = 1'b0;
  //   output_buffer[7 + address_output_offset[5]] = address[5];
  // end

  // if (is_reserved_byte(address[1])) begin
  //   address_is_escaped[1] = 1'b1;

  //   if (address_is_escaped[0]) begin
  //     output_buffer[4] = ESC;
  //     output_buffer[5] = address[1] + 8'h80;
  //   end else begin
  //     output_buffer[3] = ESC;
  //     output_buffer[4] = address[1] + 8'h80;
  //   end
  // end else begin
  //   address_is_escaped[1] = 1'b0;

  //   if (address_is_escaped[0]) begin
  //     output_buffer[4] = address[1];
  //   end else begin
  //     output_buffer[3] = address[1];
  //   end
  // end
end

function is_reserved_byte;
input [7:0] byte;
begin
  if (
    byte == 8'h02 ||
    byte == 8'h03 ||
    byte == 8'h06 ||
    byte == 8'h15 ||
    byte == 8'h1B
  ) begin
    is_reserved_byte = 1'b1;
  end else begin
    is_reserved_byte = 1'b0;
  end
end
endfunction

endmodule
