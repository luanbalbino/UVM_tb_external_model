#include <stdio.h>

extern "C" int my_mux(int a, int b, int c, int d, int sel){
  int y = 0;
  switch(sel){
    case 0: y = a; break;
    case 1: y = b; break;
    case 2: y = c; break;
    case 3: y = d; break;
  }
  return y;
}
