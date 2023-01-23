class mux_cov extends uvm_subscriber #(mux_transaction);

  `uvm_component_utils(mux_cov)
  event new_transaction_received;
  mux_transaction req;

  covergroup coverage_mux;
    option.per_instance = 1;
    coverpoint req.a;
    coverpoint req.b;
    coverpoint req.c;
    coverpoint req.d;
    coverpoint req.sel {
      bins sel_0[4] = {[0:3]};
    }
  
    cov_sel_a: cross req.sel, req.a;
    cov_sel_b: cross req.sel, req.b;
    cov_sel_c: cross req.sel, req.c;
    cov_sel_d: cross req.sel, req.d;
  
  endgroup

  function new(string name = "mux_cov", uvm_component parent = null);
    super.new(name, parent);
    coverage_mux = new();
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase (phase);
  endfunction

  task run_phase(uvm_phase phase);
    forever  begin
      fork  
        begin 
          @new_transaction_received;
          coverage_mux.sample();
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