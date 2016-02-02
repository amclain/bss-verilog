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

reg  [7:0] packet_buf [0:28];

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

assign packet_0  = packet_buf[0];
assign packet_1  = packet_buf[1];
assign packet_2  = packet_buf[2];
assign packet_3  = packet_buf[3];
assign packet_4  = packet_buf[4];
assign packet_5  = packet_buf[5];
assign packet_6  = packet_buf[6];
assign packet_7  = packet_buf[7];
assign packet_8  = packet_buf[8];
assign packet_9  = packet_buf[9];
assign packet_10 = packet_buf[10];
assign packet_11 = packet_buf[11];
assign packet_12 = packet_buf[12];
assign packet_13 = packet_buf[13];
assign packet_14 = packet_buf[14];
assign packet_15 = packet_buf[15];
assign packet_16 = packet_buf[16];
assign packet_17 = packet_buf[17];
assign packet_18 = packet_buf[18];
assign packet_19 = packet_buf[19];
assign packet_20 = packet_buf[20];
assign packet_21 = packet_buf[21];
assign packet_22 = packet_buf[22];
assign packet_23 = packet_buf[23];
assign packet_24 = packet_buf[24];
assign packet_25 = packet_buf[25];
assign packet_26 = packet_buf[26];
assign packet_27 = packet_buf[27];

wire [7:0] input_buffer[0:12];

reg [5:0] address_is_escaped;
reg [1:0] sv_is_escaped;
reg [3:0] data_is_escaped;
reg checksum_is_escaped;

reg [5:0] address_offset;

assign input_buffer[0]  = command;
assign input_buffer[1]  = address[0];
assign input_buffer[2]  = address[1];
assign input_buffer[3]  = address[2];
assign input_buffer[4]  = address[3];
assign input_buffer[5]  = address[4];
assign input_buffer[6]  = address[5];
assign input_buffer[7]  = sv[0];
assign input_buffer[8]  = sv[1];
assign input_buffer[9]  = data[0];
assign input_buffer[10] = data[1];
assign input_buffer[11] = data[2];
assign input_buffer[12] = data[3];

always @(*)
begin
  address_offset[0] = 0;
  address_offset[1] = 0;
  address_offset[2] = 0;
  address_offset[3] = 0;
  address_offset[4] = 0;
  address_offset[5] = 0;

  packet_buf[0] = 8'h02;
  packet_buf[1] = command;

  if (is_reserved_byte(address[0])) begin
    address_is_escaped[0] = 1'b1;
    packet_buf[2 + address_offset[0]] = ESC;
    packet_buf[3 + address_offset[0]] = address[0] + 8'h80;
  end else begin
    address_is_escaped[0] = 1'b0;
    packet_buf[2 + address_offset[0]] = address[0];
  end

  if (address_is_escaped[0]) begin
    address_offset[1] = address_offset[1] + 1;
    address_offset[2] = address_offset[2] + 1;
    address_offset[3] = address_offset[3] + 1;
    address_offset[4] = address_offset[4] + 1;
    address_offset[5] = address_offset[5] + 1;
  end

  if (is_reserved_byte(address[1])) begin
    address_is_escaped[1] = 1'b1;
    packet_buf[3 + address_offset[1]] = ESC;
    packet_buf[4 + address_offset[1]] = address[1] + 8'h80;
  end else begin
    address_is_escaped[1] = 1'b0;
    packet_buf[3 + address_offset[1]] = address[1];
  end

  if (address_is_escaped[1]) begin
    address_offset[2] = address_offset[2] + 1;
    address_offset[3] = address_offset[3] + 1;
    address_offset[4] = address_offset[4] + 1;
    address_offset[5] = address_offset[5] + 1;
  end

  if (is_reserved_byte(address[2])) begin
    address_is_escaped[2] = 1'b1;
    packet_buf[4 + address_offset[2]] = ESC;
    packet_buf[5 + address_offset[2]] = address[2] + 8'h80;
  end else begin
    address_is_escaped[2] = 1'b0;
    packet_buf[4 + address_offset[2]] = address[2];
  end

  if (address_is_escaped[2]) begin
    address_offset[3] = address_offset[3] + 1;
    address_offset[4] = address_offset[4] + 1;
    address_offset[5] = address_offset[5] + 1;
  end

  if (is_reserved_byte(address[3])) begin
    address_is_escaped[3] = 1'b1;
    packet_buf[5 + address_offset[3]] = ESC;
    packet_buf[6 + address_offset[3]] = address[3] + 8'h80;
  end else begin
    address_is_escaped[3] = 1'b0;
    packet_buf[5 + address_offset[3]] = address[3];
  end

  if (address_is_escaped[3]) begin
    address_offset[4] = address_offset[4] + 1;
    address_offset[5] = address_offset[5] + 1;
  end

  if (is_reserved_byte(address[4])) begin
    address_is_escaped[4] = 1'b1;
    packet_buf[6 + address_offset[4]] = ESC;
    packet_buf[7 + address_offset[4]] = address[4] + 8'h80;
  end else begin
    address_is_escaped[4] = 1'b0;
    packet_buf[6 + address_offset[4]] = address[4];
  end

  if (address_is_escaped[4]) begin
    address_offset[5] = address_offset[5] + 1;
  end

  if (is_reserved_byte(address[5])) begin
    address_is_escaped[5] = 1'b1;
    packet_buf[7 + address_offset[5]] = ESC;
    packet_buf[8 + address_offset[5]] = address[5] + 8'h80;
  end else begin
    address_is_escaped[5] = 1'b0;
    packet_buf[7 + address_offset[5]] = address[5];
  end

  // if (is_reserved_byte(address[1])) begin
  //   address_is_escaped[1] = 1'b1;

  //   if (address_is_escaped[0]) begin
  //     packet_buf[4] = ESC;
  //     packet_buf[5] = address[1] + 8'h80;
  //   end else begin
  //     packet_buf[3] = ESC;
  //     packet_buf[4] = address[1] + 8'h80;
  //   end
  // end else begin
  //   address_is_escaped[1] = 1'b0;

  //   if (address_is_escaped[0]) begin
  //     packet_buf[4] = address[1];
  //   end else begin
  //     packet_buf[3] = address[1];
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
