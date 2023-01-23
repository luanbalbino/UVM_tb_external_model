/**
  ***************************************************************
  *
  * @file      mux_env.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/
class mux_env extends uvm_env;
  `uvm_component_utils(mux_env)
	
    function new(input string inst = "mux_env", uvm_component c);
		  super.new(inst, c);
	  endfunction
  
    mux_scoreboard s;
    mux_agent a;
    mux_cov cov;
  
	  virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      s = mux_scoreboard::type_id::create("s", this);
      a = mux_agent::type_id::create("a", this);
      cov = mux_cov::type_id::create("cov", this);
    endfunction
  
    virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      a.send.connect(cov.analysis_export);
      a.send.connect(s.send_sco_refmod);
    endfunction
  
endclass: mux_env
