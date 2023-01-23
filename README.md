## Table of Contents

- [Project Description](#project-description)
- [Execute the project](#execute-the-project)

## Project Description - UVM_simple_DUT

The main purpose of this repository is to learning UVM to perform functional verification with Systemverilog.
The concepts are applied to implement and test a simple UVM testbench for a DUT (in this case, a simple four-input mux was chosen).
It's part of my studies with some courses on UVM and SystemVerilog.

### 🛠️ Execute the project

The makefile placed in the `TB/rundir/` directory has the following options:

- `make run`: Run the project with Xcelium Logic Simulator from Cadence;
- `make gui`: Run the simulation using Simvision's GUI.
- `make cov`:  Run the project with Xcelium Logic Simulator from Cadence with coverage report in prompt.
- `make help`: a tip for activate the tools that allow the simulation
- `make clean`: remove some extensions


example: by default, the name of the testbench used here is 'tb', however 
this can be changed to any testbench of interest.
- `make run` or `make run TB=ANY_TESTBENCH_TOP`


## Author

* **Luan da Silva Balbino** - [LuanBalbino](https://github.com/luanbalbino)
* [Linkedin](https://www.linkedin.com/in/luan-balbino-92a26316b/)
