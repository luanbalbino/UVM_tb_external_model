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
  
  /* essas portas precisam de ajuste
  uvm_analysis_port #(mux_transaction) ap_comp;
  */
  mux_transaction tr;
  
  function new(input string path = "mux_scoreboard", uvm_component parent = null);
    super.new(path, parent); //just a constructor
    recv = new("recv", this);
  endfunction
  
	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      tr = mux_transaction::type_id::create("tr");
    endfunction
  
  
endclass


