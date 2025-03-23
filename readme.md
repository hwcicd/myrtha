# `iverilog`

Or "Icarus Verilog"

https://iverilog.fandom.com/wiki/Installation_Guide

    git clone https://github.com/steveicarus/iverilog.git
    cd iverilog
    git checkout --track -b v11-branch origin/v11-branch
    git pull
    sudo apt install autoconf gperf flex bison -y
    sh autoconf.sh
    ./configure
    make
    sudo make install
    cd ..

# `daikon`

https://plse.cs.washington.edu/daikon/

    wget https://plse.cs.washington.edu/daikon/download/daikon-5.8.20.tar.gz
    tar -xvzf daikon-5.8.20.tar.gz
    rm daikon-5.8.20.tar.gz
    cd daikon-5.8.20/
    sudo apt install default-jre -y # added jdk, make not needed, and started compiling, maybe not needed
    cd ..

## Optional -  Test Daikon on known files

https://github.com/cd-public/Isadora/tree/master/model/multi/outs/dfiles

    wget https://github.com/cd-public/Isadora/raw/refs/heads/master/model/multi/outs/dfiles/1.dtrace
    wget https://github.com/cd-public/Isadora/raw/refs/heads/master/model/multi/outs/dfiles/universal.decls
    java -cp $PWD/daikon.jar daikon.Daikon 1.dtrace universal.decls

# `testbench.vcd`

https://github.com/YosysHQ/picorv32
*We now maintain [our own, simplified fork](https://github.com/hwcicd/picorv32), for performance*

    git clone https://github.com/YosysHQ/picorv32.git
    cd picov32
    make test_ez_vcd
    cd ..

# Build Spec

This repository.

    python3 rtlkon.py testbench.vcd
    java -cp /daikon.jar daikon.Daikon testbench.decls testbench.dtrace
