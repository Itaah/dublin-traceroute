FROM debian:stable

# Install dependencies
RUN apt-get update &&                          \
    apt-get install -y --no-install-recommends \
        git \
        ca-certificates \
        build-essential \
        pkg-config \
        cmake \
        libjsoncpp-dev \
        libtins-dev \
        libpcap-dev \
        `# dependencies for the python module` \
        python3-dev \
        python3-setuptools \
        python3-pip \
        libgraphviz-dev \
        python3-pygraphviz \
        python3-tabulate \
        `# dependencies for debugging` \
        strace \
        && \
    rm -rf /var/lib/apt/lists/*

RUN set -x; \
    git clone https://github.com/Itaah/dublin-traceroute.git && \
    cd /dublin-traceroute && \
    git checkout dev/itah/docker_run_target_and_custom_source && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    ldconfig && \
    rm -R /dublin-traceroute

# also install the python module
RUN set -x; \
    git clone https://github.com/insomniacslk/python-dublin-traceroute.git && \
    cd python-dublin-traceroute && \
    python3 setup.py build && \
    python3 setup.py install && \
    rm -R /python-dublin-traceroute

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]