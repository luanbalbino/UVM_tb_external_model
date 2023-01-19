import "DPI-C" context function int my_mux(int a, int b, int c, int d, int sel);

class mux_refmod extends uvm_component;
    `uvm_component_utils(mux_refmod)

    // Transações de entrada e saída do bloco (entrada: vinda do (monitor|scoreboard) / saída: indo para o comparador).
    mux_transaction tr_in;
    mux_transaction tr_out;




endclass

