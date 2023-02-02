#include <stdio.h>
#include "my_mux.h"

extern "C" int my_mux(i_mux_struct *obj){
  int y = 0;

  if(obj->en) {  
    switch(obj->sel){
      case 0: y = obj->a; break;
      case 1: y = obj->b; break;
      case 2: y = obj->c; break;
      case 3: y = obj->d; break;
    }   
  }
  return y;
}
