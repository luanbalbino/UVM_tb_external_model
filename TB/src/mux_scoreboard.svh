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

  mux_refmod reference;
  comp_type comp;

  uvm_analysis_port #(T) ap_comp;
  uvm_analysis_port #(mux_transaction) ap_rfm;
  
  function new(input string path = "mux_scoreboard", uvm_component parent = null);
    super.new(path, parent); //just a constructor
    ap_comp = new("ap_comp", this);
    ap_rfm = new("ap_rfm", this);
  endfunction: new
  
	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      reference = mux_refmod::type_id::create("reference", this);
      comp = comp_type::type_id::create("comp", this);
  endfunction : build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    ap_comp.connect(comp.before_export);
    ap_rfm.connect(reference.in);
    reference.out.connect(comp.after_export);
  endfunction : connect_phase

  
endclass


