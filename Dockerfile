FROM java:8

ARG JMETER_VER="5.2"

ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VER
# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

RUN mkdir /jmeter \
    && cd /jmeter \
    && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VER.tgz \
    && tar -xzf apache-jmeter-$JMETER_VER.tgz \
    && rm apache-jmeter-$JMETER_VER.tgz \
    && sed -i s/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/ $JMETER_HOME/bin/jmeter.properties

WORKDIR $JMETER_HOME

EXPOSE 60000

COPY run.sh .
COPY simple-test1.jmx ./Tests/
COPY simple-test2.jmx ./Tests/
COPY simple-test3.jmx ./Tests/
RUN chmod +x ./run.sh
