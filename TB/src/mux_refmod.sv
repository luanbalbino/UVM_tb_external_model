import "DPI-C" context function int my_mux(int a, int b, int c, int d, int sel, int en);

class mux_refmod extends uvm_component;
    `uvm_component_utils(mux_refmod)

    event begin_refmodtask;

    mux_transaction transaction_refmod;

    uvm_analysis_imp #(mux_transaction, mux_refmod) refmod_in;
    uvm_analysis_port #(mux_transaction) refmod_out;

    function new(string name = "mux_refmod", uvm_component parent);
        super.new(name, parent);
        refmod_in = new("refmod_in", this);
        refmod_out = new("refmod_out", this);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase

    // to call some features in parallel, if needed
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            refmod_task();
        join
    endtask: run_phase

    task refmod_task();
        forever begin
            @(begin_refmodtask);
            transaction_refmod.y = my_mux(transaction_refmod.a, transaction_refmod.b, transaction_refmod.c, transaction_refmod.d,  transaction_refmod.sel, transaction_refmod.en);
            `uvm_info("MUX.cpp", $sformatf("saida do modelo: %0d", transaction_refmod.y), UVM_LOW)
            refmod_out.write(transaction_refmod);
        end
    endtask : refmod_task

    virtual function write (mux_transaction t);
        transaction_refmod = mux_transaction::type_id::create("transaction_refmod", this);
        transaction_refmod.copy(t);
        -> begin_refmodtask;
    endfunction: write


endclass: mux_refmod

