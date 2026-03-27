module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    wire [7:0] data_a;
    wire [7:0] data_b;
    wire [7:0] data_c;
    wire [7:0] data_d;

    wire store_a;
    wire store_b;
    wire store_c;
    wire store_d;

    wire [7:0] memory_a;
    wire [7:0] memory_b;
    wire [7:0] memory_c;
    wire [7:0] memory_d;

    assign data_a = (addr == 2'b00) ? data : 8'b0;
    assign data_b = (addr == 2'b01) ? data : 8'b0;
    assign data_c = (addr == 2'b10) ? data : 8'b0;
    assign data_d = (addr == 2'b11) ? data : 8'b0;

    assign store_a = store && (addr == 2'b00);
    assign store_b = store && (addr == 2'b01);
    assign store_c = store && (addr == 2'b10);
    assign store_d = store && (addr == 2'b11);

    byte_memory byte0(
        .data(data_a),
        .store(store_a),
        .memory(memory_a)
    );

    byte_memory byte1(
        .data(data_b),
        .store(store_b),
        .memory(memory_b)
    );

    byte_memory byte2(
        .data(data_c),
        .store(store_c),
        .memory(memory_c)
    );

    byte_memory byte3(
        .data(data_d),
        .store(store_d),
        .memory(memory_d)
    );

    assign memory = (addr == 2'b00) ? memory_a :
                    (addr == 2'b01) ? memory_b :
                    (addr == 2'b10) ? memory_c :
                                      memory_d;

endmodule
