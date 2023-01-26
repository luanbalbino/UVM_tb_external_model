/**
  ***************************************************************
  *
  * @file      mux_sequences.svh
  * @author    Luan Balbino
  *
  ***************************************************************
**/

class mux_sequences extends uvm_sequence #(mux_transaction);
  `uvm_object_utils(mux_sequences)
  
   
 	mux_transaction t; // object of class transaction 
  
	function new(string path = "mux_sequences");
    	super.new(path); 
    endfunction
  

    virtual task body();
        t = mux_transaction::type_id::create("t"); // calling a constructor;
        repeat(400)
		begin
        start_item(t);               //send request and wait for wait_for_grant() flag
        assert(t.randomize());       // just randomize data from class transaction
        finish_item(t);
    end
    endtask
  
endclass: mux_sequences