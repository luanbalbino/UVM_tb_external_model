module mux
  (
    // four bits simple mux with selection SEL
    input [3:0] a,b,c,d, 
    input [1:0] sel,     
    output reg [3:0] y 
  );
  
  always@(*)
    begin
      case(sel)
        2'b00: y = a;
        2'b01: y = b;
        2'b10: y = c;
        2'b11: y = d;
      endcase
    end
endmodule