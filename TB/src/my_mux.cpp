#include <stdio.h>

extern "C" int my_mux(int a, int b, int c, int d,  int sel, int en){
  int y = 0;

  if(en) {  
    switch(sel){
      case 0: y = a; break;
      case 1: y = b; break;
      case 2: y = c; break;
      case 3: y = d; break;
    }   
  }
  return y;
}


// main(){
//  int a = 2,b= 3,c = 4,d = 5,sel= 1,en =1;

//  printf("asadsda %d\n", my_mux(a,b,c,d,sel,en));

// }