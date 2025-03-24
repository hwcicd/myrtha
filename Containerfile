# Most beloved OS
FROM ubuntu:latest

# Podman is my favorite package manager
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    build-essential \
    python3 \
    default-jre \
    git \
    autoconf \
    gperf \
    flex \
    bison \
    && rm -rf /var/lib/apt/lists/*

# Daikon, to generate specs, recommends download-a-release
RUN wget https://plse.cs.washington.edu/daikon/download/daikon-5.8.20.tar.gz && \
    tar -xvzf daikon-5.8.20.tar.gz ; exit 0

RUN mv daikon-5.8.20/daikon.jar . && \
    rm -rf daikon-5.8.20*
    
# Icarus, to generate .vcd, recommends build-from-source
RUN git clone https://github.com/steveicarus/iverilog.git && \
    cd iverilog && \
    git checkout --track -b v11-branch origin/v11-branch && \
    sh autoconf.sh && \
    ./configure && \
    make && \
    make install && \
    cd && \
    rm -rf iverilog

COPY rtlkon.py .
