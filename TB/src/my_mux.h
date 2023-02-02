typedef struct i_mux_struct {
    int a;
    int b;
    int c;
    int d;
    int sel;
    int en;
} i_mux_struct;

// this can be used to address output variables, i'll not include because the output for this module is a single variable.
typedef struct o_mux_struct {
    int y;
} o_mux_struct;