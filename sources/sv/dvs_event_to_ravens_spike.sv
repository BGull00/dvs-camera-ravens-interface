`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_event_to_ravens_spike
    (
        // Event based camera event input (X address, Y address, polarity bit, and timestamp in microseconds concatenated together)
        input logic [EVENT_BITS-1:0] dvs_event,

        // RAVENS packet output (3 bit header + 16 bit time + 4 bit core_address + 4 bit neuron_index + 5 bit synapse_port)
        output logic [RAVENS_PKT_BITS-1:0] ravens_spike
    );

    logic [$clog2(DVS_WIDTH_PXLS*DVS_HEIGHT_PXLS)-1:0] flat_pxl_ind;
    logic [7:0] flat_pxl_ind_8_bits;

    //========================//
    // Combinational Circuits //
    //========================//

    // Flattened pixel index is pxls[y_addr][x_addr] = pxls_1d[x_addr + y_addr * DVS_WIDTH_PXLS]
    assign flat_pxl_ind = dvs_event[EVENT_BITS-1 -: DVS_X_ADDR_BITS] + dvs_event[EVENT_BITS-DVS_X_ADDR_BITS-1 -: DVS_Y_ADDR_BITS] * DVS_WIDTH_PXLS;
    
    // We only have 8 bits for RAVENS neuron indices (4 bit core_address + 4 bit neuron_index) so just mod flattened indices by 2^8
    assign flat_pxl_ind_8_bits = flat_pxl_ind % 256;

    // RAVENS spike packet: 3 bit header always 000 for input spikes, 16 bit time always 0 for input spikes, 4 bit core address from flattened pixel index, 4 bit neuron index from flattened pixel index, 5 bit synapse port always 0 for input spikes
    assign ravens_spike = {3'b0, 16'b0, flat_pxl_ind_8_bits[7:4], flat_pxl_ind_8_bits[3:0], 5'b0};

endmodule: dvs_event_to_ravens_spike