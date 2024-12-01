module top #(
) (
    input logic [15:0]  N,
    input logic         clk,
    input logic         rst,
    output logic[7:0]   data_out
);

logic delay;

clktick mytick(
    .N(N),
    .en(1'b1),
    .rst(rst),
    .clk(clk),
    .tick(delay)
);

f1_fsm myf1(
    .rst(rst),
    .en(delay),
    .clk(clk),
    .data_out(data_out)
);


  
endmodule
