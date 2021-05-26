FROM centos:7.5.1804

ARG JMETER_VERSION="5.2.1"
ENV JMETER_HOME /opt/apache-jmeter-5.2.1
ENV JMETER_BIN /opt/apache-jmeter-5.2.1/bin
ENV JMETER_DOWNLOAD_URL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.2.1.tgz
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/jre
WORKDIR /opt/apache-jmeter-5.4.1
ARG TZ="Europe/Amsterdam"
RUN yum update -y
RUN yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
RUN yum install wget -y
RUN wget http://apache.stu.edu.tw//jmeter/binaries/apache-jmeter-5.4.1.tgz
RUN tar -xzf apache-jmeter-5.4.1.tgz

# Download PluginsManagerCMD and install plugin
RUN wget http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar
RUN mv *cmdrunner-2.2.jar apache-jmeter-5.4.1/lib/cmdrunner-2.2.jar
RUN wget http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar
RUN mv *jmeter-plugins-manager-1.6.jar apache-jmeter-5.4.1/lib/ext/jmeter-plugins-manager-1.6.jar
RUN java -cp apache-jmeter-5.4.1/lib/ext/jmeter-plugins-manager-1.6.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
#RUN apache-jmeter-5.4.1/bin/PluginsManagerCMD.sh available
RUN apache-jmeter-5.4.1/bin/PluginsManagerCMD.sh install jpgc-csvars
RUN apache-jmeter-5.4.1/bin/PluginsManagerCMD.sh install jpgc-perfmon
RUN apache-jmeter-5.4.1/bin/PluginsManagerCMD.sh status

RUN mv apache-jmeter-5.4.1/* /opt/apache-jmeter-5.4.1
RUN rm -r /opt/apache-jmeter-5.4.1/apache-jmeter-5.4.1
RUN mkdir code/
RUN mkdir result/


# Add Load Test Source Code
ADD data /opt/apache-jmeter-5.4.1/code/data
ADD scripts /opt/apache-jmeter-5.4.1/code/scripts
ADD docker /opt/apache-jmeter-5.4.1/code/docker
RUN chmod +x /opt/apache-jmeter-5.4.1/code/docker/entry.sh

ENTRYPOINT ["/opt/apache-jmeter-5.4.1/code/docker/entry.sh"]