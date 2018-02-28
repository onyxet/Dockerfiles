FROM onyxet/php:7.1-base
ADD instantclient-basic-linux.x64-12.2.0.1.0.zip /opt/
ADD instantclient-sdk-linux.x64-12.2.0.1.0.zip /opt/
COPY oci8-2.1.8.tgz /opt/
RUN apt update && apt install unzip && cd /opt && \
    unzip /opt/instantclient-basic-linux.x64-12.2.0.1.0.zip && \
    unzip /opt/instantclient-sdk-linux.x64-12.2.0.1.0.zip && \
    ln -s /opt/instantclient_12_2/libclntsh.so.12.1 /opt/instantclient_12_2/libclntsh.so && \
    ln -s /opt/instantclient_12_2/libocci.so.12.1 /opt/instantclient_12_2/libocci.so && \
    echo /opt/instantclient_12_2 > /etc/ld.so.conf.d/oracle-instantclient && \
    ldconfig && \
    apt-get install -y build-essential libaio1 && \
    cd /opt && \
    tar -zxvf /opt/oci8-2.1.8.tgz && \
    cd /opt/oci8-2.1.8/ && \
    export ORACLE_HOME=/opt/instantclient_12_2/ && \
    phpize && \
    ./configure -with-oci8=instantclient,$ORACLE_HOME && \
    make install && \
    echo "extension = oci8.so" >> /etc/php/7.1/fpm/php.ini && \
    echo "extension = oci8.so" >> /etc/php/7.1/cli/php.ini && \
    rm /opt/instantclient-basic-linux.x64-12.2.0.1.0.zip && \
    rm /opt/instantclient-sdk-linux.x64-12.2.0.1.0.zip && \
    rm /opt/oci8-2.1.8.tgz
    


