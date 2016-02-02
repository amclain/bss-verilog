module mock_input (
  input [7:0] data_in,

  input write_command,
  input write_address_0,
  input write_address_1,
  input write_address_2,
  input write_address_3,
  input write_address_4,
  input write_address_5,
  input write_sv_0,
  input write_sv_1,
  input write_data_0,
  input write_data_1,
  input write_data_2,
  input write_data_3,

  output [7:0] command,
  output [7:0] address_0,
  output [7:0] address_1,
  output [7:0] address_2,
  output [7:0] address_3,
  output [7:0] address_4,
  output [7:0] address_5,
  output [7:0] sv_0,
  output [7:0] sv_1,
  output [7:0] data_0,
  output [7:0] data_1,
  output [7:0] data_2,
  output [7:0] data_3
);

reg [7:0] command_buf;
reg [7:0] address_0_buf;
reg [7:0] address_1_buf;
reg [7:0] address_2_buf;
reg [7:0] address_3_buf;
reg [7:0] address_4_buf;
reg [7:0] address_5_buf;
reg [7:0] sv_0_buf;
reg [7:0] sv_1_buf;
reg [7:0] data_0_buf;
reg [7:0] data_1_buf;
reg [7:0] data_2_buf;
reg [7:0] data_3_buf;

assign command = command_buf;
assign address_0 = address_0_buf;
assign address_1 = address_1_buf;
assign address_2 = address_2_buf;
assign address_3 = address_3_buf;
assign address_4 = address_4_buf;
assign address_5 = address_5_buf;
assign sv_0 = sv_0_buf;
assign sv_1 = sv_1_buf;
assign data_0 = data_0_buf;
assign data_1 = data_1_buf;
assign data_2 = data_2_buf;
assign data_3 = data_3_buf;

always @(
  posedge write_command or
  posedge write_address_0 or
  posedge write_address_1 or
  posedge write_address_2 or
  posedge write_address_3 or
  posedge write_address_4 or
  posedge write_address_5 or
  posedge write_sv_0 or
  posedge write_sv_1 or
  posedge write_data_0 or
  posedge write_data_1 or
  posedge write_data_2 or
  posedge write_data_3
)
begin
  if (write_command) begin
    command_buf <= data_in;
  end else if (write_address_0) begin
    address_0_buf <= data_in;
  end else if (write_address_1) begin
    address_1_buf <= data_in;
  end else if (write_address_2) begin
    address_2_buf <= data_in;
  end else if (write_address_3) begin
    address_3_buf <= data_in;
  end else if (write_address_4) begin
    address_4_buf <= data_in;
  end else if (write_address_5) begin
    address_5_buf <= data_in;
  end else if (write_sv_0) begin
    sv_0_buf <= data_in;
  end else if (write_sv_1) begin
    sv_1_buf <= data_in;
  end else if (write_data_0) begin
    data_0_buf <= data_in;
  end else if (write_data_1) begin
    data_1_buf <= data_in;
  end else if (write_data_2) begin
    data_2_buf <= data_in;
  end else if (write_data_3) begin
    data_3_buf <= data_in;
  end
end

endmodule
