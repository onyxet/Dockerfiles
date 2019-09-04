FROM centos:7
WORKDIR /tmp
RUN yum clean all && yum update -y && \
   yum install vim wget telnet bind-utils net-tools lsof pkgconfig libtool gcc gcc-c++ make \
	openssl openssl-devel tcl tcl-devel pcre pcre-devel libcap libcap-devel \
	flex hwloc hwloc-devel lua ncurses ncurses-devel curl libcurl-devel autoconf automake \
	libunwind libunwind-devel bzip2 expat-devel centos-release-scl -y && \
   yum install devtoolset-7-gcc-c++ -y && \
   yum clean all && yum update -y && \
   wget http://www-us.apache.org/dist/trafficserver/trafficserver-8.0.5.tar.bz2 && \
   tar -xvf trafficserver-8.0.5.tar.bz2
WORKDIR /tmp/trafficserver-8.0.5
RUN autoreconf -if && \
    scl enable devtoolset-7 './configure --prefix=/opt/ts' && \
    scl enable devtoolset-7 'make && make install' && \
    cd /tmp && \
    rm -rf trafficserver-8.0.5*
ENV PATH="/opt/ts/bin:${PATH}"
ENTRYPOINT [ "traffic_server" ]