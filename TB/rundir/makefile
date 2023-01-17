#compiler 
PATHS = +incdir+../../RTL/ \
        +incdir+../src/
XRUN=xrun -coverage functional  -sv -covoverwrite
COMP_FLAGS= -sysv -64 -debug -linedebug -classlinedebug -access rwc #-sysv -debug -LINEDEBUG
UVM_FLAGS= -uvm -uvmlinedebug +UVM_NO_RELNOTES #-uvm +UVM_NO_RELNOTES
DUT = ../../RTL/mux.sv
PKG = ../src/resources_mux.sv
TOP = ../src/tb.sv

run:
	@echo This should run testbench code
	$(XRUN) $(PATHS) $(COMP_FLAGS) $(UVM_FLAGS) $(DUT) $(PKG) $(TOP)
gui:
	@echo This should run testbench code
	$(XRUN) $(PATHS) $(COMP_FLAGS) $(UVM_FLAGS) $(DUT) $(PKG) $(TOP) -gui

help:
	@echo '# Execute: cds # before compiling the project'

clean:
	rm -rf xrun.history xrun.log xcelium.d dump.vcd 
	rm -rf xrun.key waves.shm .simvision simvision5009.diag
	rm -rf xcelium*
	rm -rf *.shm
	rm -rf .uvm*
	rm -rf dump.*
	rm -rf simvision*
