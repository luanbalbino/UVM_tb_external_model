/**
  ***************************************************************
  *
  * @file      mux_test.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/


class mux_test extends uvm_test;
  `uvm_component_utils(mux_test)
	
  function new(input string inst = "TEST", uvm_component parent = null);
		super.new(inst, parent);
	endfunction
  
  mux_sequences gen;
  mux_env e;
  
	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      gen = mux_sequences::type_id::create("gen");
      e = mux_env::type_id::create("e", this);
    endfunction
  
    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      gen.start(e.a.seqr);
      #5;
      phase.drop_objection(this);
    endtask
  
endclass : mux_test