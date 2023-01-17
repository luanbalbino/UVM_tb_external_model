/**
  ***************************************************************
  *
  * @file      mux_monitor.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/

class mux_monitor extends uvm_monitor;
  `uvm_component_utils(mux_monitor)
  
    uvm_analysis_port #(mux_transaction) send;
    uvm_analysis_port #(mux_transaction) send_cov;
    
    mux_transaction t;
    virtual mux_if aif;
  
    function new(string path = "mux_monitor", uvm_component parent = null);
        super.new(path, parent); //just a constructor
        send = new("send", this);
        send_cov = new("send_cov", this);
    endfunction
  

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        t = mux_transaction::type_id::create("t");
        if(!uvm_config_db #(virtual mux_if)::get(this, "", "aif", aif))
        `uvm_error("MON","Unable to access uvm_config_db");
    endfunction
  
    virtual task run_phase(uvm_phase phase);
        forever begin
        #10;
        t.a = aif.a;
        t.b = aif.b;
        t.c = aif.c;
        t.d = aif.d;
        t.sel = aif.sel;
        t.y = aif.y;
       //`uvm_info("MON", $sformatf("Data send to Scoreboard a : %0d , b : %0d, c : %0d, d : %0d, sel : %0d and y : %0d", t.a,t.b,t.c, t.d, t.sel,t.y), UVM_NONE);
        send.write(t);
        send_cov.write(t);
        #10;
      end
      endtask
endclass: mux_monitor
