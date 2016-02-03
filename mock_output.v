module mock_output (
  input [7:0] packet_0,
  input [7:0] packet_1,
  input [7:0] packet_2,
  input [7:0] packet_3,
  input [7:0] packet_4,
  input [7:0] packet_5,
  input [7:0] packet_6,
  input [7:0] packet_7,
  input [7:0] packet_8,
  input [7:0] packet_9,
  input [7:0] packet_10,
  input [7:0] packet_11,
  input [7:0] packet_12,
  input [7:0] packet_13,
  input [7:0] packet_14,
  input [7:0] packet_15,
  input [7:0] packet_16,
  input [7:0] packet_17,
  input [7:0] packet_18,
  input [7:0] packet_19,
  input [7:0] packet_20,
  input [7:0] packet_21,
  input [7:0] packet_22,
  input [7:0] packet_23,
  input [7:0] packet_24,
  input [7:0] packet_25,
  input [7:0] packet_26,
  input [7:0] packet_27,
  input [7:0] packet_28,

  input [5:0] data_selector,
  output [7:0] data
);

reg [7:0] data_buf;

assign data = data_buf;

always @(*)
begin
  case (data_selector)
    default: data_buf <= packet_0;
    6'd01:   data_buf <= packet_1;
    6'd02:   data_buf <= packet_2;
    6'd03:   data_buf <= packet_3;
    6'd04:   data_buf <= packet_4;
    6'd05:   data_buf <= packet_5;
    6'd06:   data_buf <= packet_6;
    6'd07:   data_buf <= packet_7;
    6'd08:   data_buf <= packet_8;
    6'd09:   data_buf <= packet_9;
    6'd10:   data_buf <= packet_10;
    6'd11:   data_buf <= packet_11;
    6'd12:   data_buf <= packet_12;
    6'd13:   data_buf <= packet_13;
    6'd14:   data_buf <= packet_14;
    6'd15:   data_buf <= packet_15;
    6'd16:   data_buf <= packet_16;
    6'd17:   data_buf <= packet_17;
    6'd18:   data_buf <= packet_18;
    6'd19:   data_buf <= packet_19;
    6'd20:   data_buf <= packet_20;
    6'd21:   data_buf <= packet_21;
    6'd22:   data_buf <= packet_22;
    6'd23:   data_buf <= packet_23;
    6'd24:   data_buf <= packet_24;
    6'd25:   data_buf <= packet_25;
    6'd26:   data_buf <= packet_26;
    6'd27:   data_buf <= packet_27;
    6'd28:   data_buf <= packet_28;
  endcase
end

endmodule
