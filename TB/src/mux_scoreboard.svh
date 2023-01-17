/**
  ***************************************************************
  *
  * @file      mux_scoreboard.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/

class mux_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(mux_scoreboard)
  
  uvm_analysis_imp #(mux_transaction, mux_scoreboard) recv;
  
  mux_transaction tr;
  
  function new(input string path = "mux_scoreboard", uvm_component parent = null);
    super.new(path, parent); //just a constructor
    recv = new("recv", this);
  endfunction
  
	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      tr = mux_transaction::type_id::create("tr");
    endfunction
  
  virtual function void write(input mux_transaction t);
  tr = t;
  `uvm_info("SCO", $sformatf("Data rcvd from monitor a: %0d, b: %0d, c: %0d, d: %0d, sel: %0d e y: %0d", tr.a,tr.b, tr.c, tr.d, tr.sel, tr.y), UVM_NONE);
  
  	if(tr.y == tr.a && tr.sel == 0)
    	`uvm_info("SCO", $sformatf("Test passed with SEL = %0d", tr.sel), UVM_NONE)
    else if (tr.y == tr.b && tr.sel == 1) 
	   `uvm_info("SCO", $sformatf("Test passed with SEL = %0d", tr.sel), UVM_NONE)
    else if (tr.y == tr.c && tr.sel == 2) 
	    `uvm_info("SCO", $sformatf("Test passed with SEL = %0d", tr.sel), UVM_NONE)
    else if (tr.y == tr.d && tr.sel == 3) 
	    `uvm_info("SCO", $sformatf("Test passed with SEL = %0d", tr.sel), UVM_NONE)
  	else
   		`uvm_info("SCO", "Test failed", UVM_NONE);
  endfunction
  
endclass


