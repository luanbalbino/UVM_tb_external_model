// input struct of function
typedef struct {
    int a;
    int b;
    int c;
    int d;
    int sel;
    int en;
} i_mux_struct;

// output struct of function
typedef struct {
    int y;
} o_mux_struct;

import "DPI-C" context function int my_mux(input i_mux_struct);

class mux_refmod extends uvm_component;
    `uvm_component_utils(mux_refmod)

    event begin_refmodtask;

    mux_transaction transaction_refmod;

    i_mux_struct i_mux;  
    //o_mux_struct o_mux;

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

    task copy_input_task();
            // struct variables
            i_mux.a = transaction_refmod.a;
            i_mux.b = transaction_refmod.b;
            i_mux.c = transaction_refmod.c;
            i_mux.d = transaction_refmod.d;
            i_mux.en = transaction_refmod.en;
            i_mux.sel = transaction_refmod.sel;
    endtask : copy_input_task


    task refmod_task();
        forever begin
            @(begin_refmodtask);
            copy_input_task();           
            transaction_refmod.y = my_mux(i_mux);
            `uvm_info("MUX.cpp", $sformatf("saida do modelo: %0d", transaction_refmod.y), UVM_LOW);
            refmod_out.write(transaction_refmod);
        end
    endtask : refmod_task

    virtual function write (mux_transaction t);
        transaction_refmod = mux_transaction::type_id::create("transaction_refmod", this);
        transaction_refmod.copy(t);
        -> begin_refmodtask;
    endfunction: write


endclass: mux_refmod

