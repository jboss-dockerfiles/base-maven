FROM jboss/base-jdk:8

MAINTAINER Andrew Lee Rubinger (https://github.com/ALRubinger)

USER root

# Install Maven
RUN yum install -y wget && \
    wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    echo "516923b3955b6035ba6b0a5b031fbd8b /tmp/apache-maven-3.3.9.tar.gz" | md5sum -c && \
    tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.3.9 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin && \
    rm -f /tmp/apache-maven-3.3.9.tar.gz && \
    yum clean all

ENV MAVEN_HOME=/opt/maven M2_HOME=/opt/maven

USER jboss 

# Dump to bash
CMD ["bash"]
