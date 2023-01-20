/**
  ***************************************************************
  *
  * @file      mux_agent.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/

class mux_agent extends uvm_agent;
  `uvm_component_utils(mux_agent)

// testando uma alteração
  uvm_analysis_port #(mux_transaction) send;
  uvm_analysis_port #(mux_transaction) send_cov;


	function new(input string inst = "mux_agent", uvm_component c);
		super.new(inst, c);
    send = new("send", this);
    send_cov = new("send_cov", this);
	endfunction

  mux_monitor m;
  mux_driver d;
  uvm_sequencer #(mux_transaction) seqr;
  
  	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      m = mux_monitor::type_id::create("m", this);
      d = mux_driver::type_id::create("d", this);
      seqr = uvm_sequencer #(mux_transaction)::type_id::create("seqr", this);
    endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    d.seq_item_port.connect(seqr.seq_item_export);
    m.send.connect(this.send);
    //m.send_cov.connect(this.send_cov);
    //m.send_cov.connect(this.send);
  endfunction
endclass