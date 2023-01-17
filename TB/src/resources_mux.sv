`ifndef RESOURCES_MUX_SVH
`define RESOURCES_MUX_SVH

import uvm_pkg::*;

package resources_mux;
    //
    `include "uvm_macros.svh"
    `include "./mux_transaction.svh"
    `include "./mux_sequences.svh"
    `include "./mux_driver.svh"
    `include "./mux_monitor.svh"
    `include "./mux_scoreboard.svh"
    `include "./mux_agent.svh"
    `include "./mux_cov.svh"
    `include "./mux_env.svh"
    `include "./mux_test.svh"

endpackage

`endif

