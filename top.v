module top(
    input [15:0] sw,
    input btnC,
    output [15:0] led
);

    wire q;
    wire not_q;
    wire [7:0] memory_out;

    d_latch part1(
        .D(sw[0]),
        .E(btnC),
        .Q(q),
        .NotQ(not_q)
    );

    memory_system part2(
        .data(sw[15:8]),
        .store(btnC),
        .addr(sw[7:6]),
        .memory(memory_out)
    );

    assign led[0] = q;
    assign led[1] = not_q;
    assign led[7:2] = 6'b0;
    assign led[15:8] = memory_out;

endmodule
