module top #(
) (
    input logic [15:0]  N,
    input logic         clk,
    input logic         rst,
    output logic        cmd_delay
    output logic[7:0]   data_out
);

logic           delay;
logic           cmd_seq;
logic           time_out;
logic           y;
logic           k;

clktick Delay(
    .N(N),
    .en(cmd_seq),
    .rst(rst),
    .clk(clk),
    .tick(delay)
);

lfsr randomiser(
    .clk(clk)
);

delay delay(
    .k(k),
    .trigger(cmd_delay),
    .rst(rst),
    .clk(clk)
    .time_out(time_out)
);

mux mymux(
    .d0(time_out)
    .d1(delay)
    .s(cmd_seq)
    .y(y)
)

f1_fsm F1(
    .rst(rst),
    .en(y),
    .clk(clk),
    .data_out(data_out),
    .trigger(trigger)
);


  
endmodule
