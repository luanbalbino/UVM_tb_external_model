/**
  ***************************************************************
  *
  * @file      mux_driver.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/

class mux_driver extends uvm_driver #(mux_transaction);
  `uvm_component_utils(mux_driver) // register to a factory
  
    mux_transaction t;
    virtual mux_if aif; // add the interface into driver.
  
    function new(input string path = "mux_driver", uvm_component parent = null);
    super.new(path, parent); 
    endfunction
  

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      t = mux_transaction::type_id::create("t");
      
      if(!uvm_config_db #(virtual mux_if)::get(this, "", "aif", aif))
        `uvm_error("DRV", "ERROR: Unable to acess uvm_config_db");
    endfunction
    
    virtual task run_phase(uvm_phase phase);
      forever begin
        seq_item_port.get_next_item(t); // assign the variables to interface
        aif.a <= t.a;
        aif.b <= t.b;
        aif.c <= t.c;
        aif.d <= t.d;
        aif.sel <= t.sel;
        //`uvm_info("DRV", $sformatf("Trigger DUT a: %0d, b: %0d, c: %0d, d: %0d e SEL = %0d", t.a, t.b, t.c, t.d, t.sel), UVM_NONE);
        seq_item_port.item_done();
        #5;
      end
      endtask
endclass: mux_driver