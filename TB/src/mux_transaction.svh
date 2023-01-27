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
  rand bit en;
  bit [3:0] y;
 
  function new(input string path = "mux_transaction");
    super.new(path); //just a constructor for the transactions
  endfunction
  
  function string convert2string();
    return $sformatf("{a = %d} {b = %d} {c = %d} {d = %d} {sel = %d} {en = %d} {y = %d}",a, b, c, d, sel, en, y);
  endfunction

// registering variables in the factory pattern - this way it is allowed to use functions like print()
  `uvm_object_utils_begin(mux_transaction);
  `uvm_field_int(a, UVM_DEFAULT); //|UVM_NOCOMPARE
  `uvm_field_int(b, UVM_DEFAULT);
  `uvm_field_int(c, UVM_DEFAULT);
  `uvm_field_int(d, UVM_DEFAULT);
  `uvm_field_int(sel, UVM_DEFAULT);
  `uvm_field_int(en, UVM_DEFAULT);
  `uvm_field_int(y, UVM_DEFAULT);
  `uvm_object_utils_end

endclass: mux_transaction