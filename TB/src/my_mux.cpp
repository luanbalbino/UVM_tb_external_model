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

// if output struct included

//extern "C" int my_mux(i_mux_struct *obj, o_mux_struct *out){
//  if(obj->en) {  
//    switch(obj->sel){
//      case 0: out->y = obj->a; break;
//      case 1: out->y = obj->b; break;
//      case 2: out->y = obj->c; break;
//      case 3: out->y = obj->d; break;
//    }   
//  }
//  else out->y = 0;
//}
