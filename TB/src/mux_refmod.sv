import "DPI-C" context function int my_mux(int a, int b, int c, int d, int sel);

class mux_refmod extends uvm_component;
    `uvm_component_utils(mux_refmod)

    event begin_refmodtask;

    // Transações de entrada e saída do bloco (entrada: vinda do (monitor|scoreboard) / saída: indo para o comparador).
    mux_transaction tr_in;
    //mux_transaction tr_out;

    uvm_analysis_imp #(mux_transaction, mux_refmod) refmod_in;
    uvm_analysis_port #(mux_transaction) refmod_out;

    function new(string name = "mux_refmod", uvm_component parent);
        super.new(name, parent);
        refmod_in = new("refmod_in", this);
        refmod_out = new("refmod_out", this);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //tr_out = mux_transaction::type_id::create("tr_out", this);
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
            tr_in.y = my_mux(tr_in.a, tr_in.b, tr_in.c, tr_in.d, tr_in.sel);
            `uvm_info("[my_mux.cpp", $sformatf("saida my_mux: %0d", tr_in.y), UVM_LOW)
            //`uvm_info("[obj", $sformatf("a: %0d b: %0d c: %0d d: %0d sel: %0d", tr_out.a, tr_out.b, tr_out.c, tr_out.d, tr_out.sel), UVM_LOW)
            refmod_out.write(tr_in);
            //#5;
        end
    endtask : refmod_task

    virtual function write (mux_transaction t);
        tr_in = mux_transaction::type_id::create("tr_in", this);
        tr_in.copy(t);
        //tr_out.copy(tr_in);
        //`uvm_info("REFMOD", $sformatf("a: %0d b: %0d c: %0d d: %0d sel: %0d", tr_in.a, tr_in.b, tr_in.c, tr_in.d, tr_in.sel), UVM_LOW)
        -> begin_refmodtask;
    endfunction: write


endclass: mux_refmod

