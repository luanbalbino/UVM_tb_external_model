import "DPI-C" context function int my_mux(int a, int b, int c, int d, int sel);

class mux_refmod extends uvm_component;
    `uvm_component_utils(mux_refmod)

    event begin_refmodtask;

    // Transações de entrada e saída do bloco (entrada: vinda do (monitor|scoreboard) / saída: indo para o comparador).
    mux_transaction tr_in;
    mux_transaction tr_out;

    // Porta imp para receber os dados vindos do scoreboard (necessario implementar função write)
    uvm_analysis_imp #(mux_transaction, mux_refmod) in;
    // porta para enviar os dados resultantes para fora da classe (um comparador dentro do scoreboard, inicialmente.)
    uvm_analysis_port #(mux_transaction) out;

    function new(string name = "mux_refmod", uvm_component parent);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
       // tr_out = mux_transaction::type_id::create("tr_out", this);
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
            @begin_refmodtask;
            tr_out = mux_transaction::type_id::create("tr_out", this);
            tr_out.y = my_mux(tr_in.a, tr_in.b, tr_in.c, tr_in.d, tr_in.sel);
            #10;
            out.write(tr_out);
        end
    endtask : refmod_task

    virtual function write (mux_transaction t);
        tr_in = mux_transaction::type_id::create("tr_in", this);
        tr_in.copy(t);
       -> begin_refmodtask;
    endfunction: write


endclass: mux_refmod

