import "DPI-C" context function int my_mux(int a, int b, int c, int d, int sel);

class mux_refmod extends uvm_component;
    `uvm_component_utils(mux_refmod)

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
        tr_out = mux_transaction::type_id::create("tr_out", this);
    endfunction: build_phase
    


endclass

