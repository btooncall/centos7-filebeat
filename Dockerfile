FROM btooncall/centos7

RUN mkdir -p /opt/tomcat/logs 2>/dev/null; 
WORKDIR /opt/

RUN wget -q https://download.elastic.co/beats/filebeat/filebeat-1.2.2-x86_64.rpm \
      && yum -y install /opt/filebeat-1.2.2-x86_64.rpm \
      && rm -f /opt/filebeat-1.2.2-x86_64.rpm \
      && rm -f /etc/filebeat/filebeat.yml
      && yum clean all

ADD filebeat.yml /etc/filebeat/filebeat.yml

ENV JAVA_HOME /etc/alternatives/jre_1.7.0_openjdk

ENTRYPOINT [ "/usr/bin/filebeat", "-e -c /etc/filebeat/filebeat.yml"]

