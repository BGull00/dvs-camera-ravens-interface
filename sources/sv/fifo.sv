module FIFO #(parameter WIDTH = 8, parameter DEPTH = 16)(
    input logic clk,
    input logic rst,
    input logic [WIDTH-1:0] data_in,
    input logic push,
    output logic [WIDTH-1:0] data_out,
    input logic pop,
    output logic empty,
    output logic full
);

    logic [WIDTH-1:0] memory [DEPTH-1:0];
    logic [WIDTH-1:0] read_ptr;
    logic [WIDTH-1:0] write_ptr;
    logic [WIDTH-1:0] next_write_ptr;
    logic [WIDTH-1:0] next_read_ptr;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            read_ptr <= 0;
            write_ptr <= 0;
        end
        else begin
            read_ptr <= next_read_ptr;
            write_ptr <= next_write_ptr;
        end
    end

    assign empty = (read_ptr == write_ptr);
    assign full = ((write_ptr + 1) % DEPTH == read_ptr);

    always_comb begin
        next_read_ptr = read_ptr;
        next_write_ptr = write_ptr;

        if (push && !full) begin
            memory[write_ptr] <= data_in;
            next_write_ptr = (write_ptr + 1) % DEPTH;
        end

        if (pop && !empty) begin
            data_out = memory[read_ptr];
            next_read_ptr = (read_ptr + 1) % DEPTH;
        end
    end
endmodule
