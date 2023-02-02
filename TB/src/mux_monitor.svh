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
    
    mux_transaction t;
    virtual mux_if aif;
  
    function new(string path = "mux_monitor", uvm_component parent = null);
        super.new(path, parent); //just a constructor
        send = new("send", this);
    endfunction
  

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        t = mux_transaction::type_id::create("t");
        if(!uvm_config_db #(virtual mux_if)::get(this, "", "aif", aif))
        `uvm_error("MON","Unable to access uvm_config_db");
    endfunction
  
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
          get_transaction(phase);
        join
        
    endtask

    virtual task get_transaction(uvm_phase phase);
        forever begin
          @(aif.clk);
          @(aif.clk);
          //#5;
          t.a = aif.a;
          t.b = aif.b;
          t.c = aif.c;
          t.d = aif.d;
          t.en = aif.en;
          t.sel = aif.sel;
          t.y = aif.y;
          send.write(t);
        end
    endtask
endclass: mux_monitor
