/**
  ***************************************************************
  *
  * @file      mux_transaction.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/


class mux_transaction extends uvm_sequence_item;

  //      _______________
  //   a-|               |
  //   b-|               |
  //   c-|       DUT     |- y
  //   d-|               |
  // SEL-|_______________|
  //


  // Data to be used (same as module to be tested)
  rand bit [3:0] a;
  rand bit [3:0] b;
  rand bit [3:0] c;
  rand bit [3:0] d;
  rand bit [1:0] sel;
  bit [4:0] y;

 // constraint range_a{a < 6;}
  
  function new(input string path = "mux_transaction");
    super.new(path); //just a constructor for the transactions
  endfunction
  
// registering variables in the factory pattern - this way it is allowed to use functions like print()
  `uvm_object_utils_begin(mux_transaction);
  `uvm_field_int(a, UVM_DEFAULT);
  `uvm_field_int(b, UVM_DEFAULT);
  `uvm_field_int(c, UVM_DEFAULT);
  `uvm_field_int(d, UVM_DEFAULT);
  `uvm_field_int(sel, UVM_DEFAULT);
  `uvm_field_int(y, UVM_DEFAULT);
  `uvm_object_utils_end

endclass: mux_transaction