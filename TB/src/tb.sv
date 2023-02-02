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


  initial begin
    aif.clk = 0;
    aif.en = 1;

    #10;
    aif.en = 0;

    #10;
    aif.en = 1;

  end 
  
  always #5 aif.clk = ~aif.clk;
  //always #15 aif.en = ~aif.en;
  
  //logic clk = 0;
  mux_if aif();
  
  mux my_dut (.a(aif.a), .b(aif.b), .c(aif.c), .d(aif.d) , .sel(aif.sel), .y(aif.y),  .en(aif.en), .clk(aif.clk));

  initial begin 
  uvm_config_db #(virtual mux_if)::set(null, "uvm_test_top.e.a*","aif",aif);
  $set_coverage_db_name("database_name");
  run_test("mux_test");
  end
  initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #100;
      $finish();
  end
  
endmodule
