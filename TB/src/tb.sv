import resources_mux::*;
`include "./mux_if.sv"

/**
  ***************************************************************
  *
  * @file      tb.sv
  * @author    Luan Balbino
  *
  ***************************************************************
**/


module tb_mux;

  mux_if aif();
  
  mux dut (.a(aif.a), .b(aif.b), .c(aif.c), .d(aif.d) , .sel(aif.sel), .y(aif.y));

    initial begin 
    uvm_config_db #(virtual mux_if)::set(null, "uvm_test_top.e.a*","aif",aif);
    run_test("mux_test");
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
  
endmodule
