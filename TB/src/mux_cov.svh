class mux_cov extends uvm_subscriber #(mux_transaction);

  `uvm_component_utils(mux_cov)
  event new_transaction_received;
  mux_transaction req;

  covergroup c;
    option.per_instance = 1;
   // option.at_least = 1;
    coverpoint req.a{
      bins a_0[15] = {[0:15]};
    }
    coverpoint req.b;
    coverpoint req.c;
    coverpoint req.d;
    coverpoint req.sel {
      bins sel_0[4] = {[0:3]};
    }
  
    cov_sel_a: cross req.sel, req.a;
  
  endgroup

  function new(string name = "mux_cov", uvm_component parent = null);
    super.new(name, parent);
    c = new();
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase (phase);
  endfunction

  task run_phase(uvm_phase phase);
    forever  begin
      fork  
        begin 
          @new_transaction_received;
          c.sample();
        end
      join
    end
  endtask: run_phase

  
  function void write(mux_transaction t);
    req = mux_transaction::type_id::create("req", this);
    req.copy(t);
    ->new_transaction_received;
  endfunction: write

endclass: mux_cov