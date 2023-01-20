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

  typedef mux_transaction T;
  typedef uvm_in_order_class_comparator #(T) comp_type;

  mux_refmod refmod;
  comp_type comp;

  uvm_analysis_export #(mux_transaction) send_sco_refmod;

  
  function new(input string path = "mux_scoreboard", uvm_component parent = null);
    super.new(path, parent); //just a constructor
    send_sco_refmod = new("send_sco_refmod", this);
  endfunction: new
  
	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      refmod = mux_refmod::type_id::create("refmod", this);
      comp = comp_type::type_id::create("comp", this);
  endfunction : build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    send_sco_refmod.connect(comp.before_export);
    send_sco_refmod.connect(refmod.refmod_in);
    refmod.refmod_out.connect(comp.after_export);
  endfunction : connect_phase
 
endclass : mux_scoreboard


