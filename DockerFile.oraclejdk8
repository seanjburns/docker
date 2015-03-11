FROM centos:7

MAINTAINER Sean Burns <seanjburns@gmail.com>

RUN yum install -y wget unzip tar && yum clean all

RUN wget --continue --no-check-certificate --header "Cookie: oraclelicense=a" -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm"
 
RUN yum localinstall -y jdk-linux-x64.rpm

RUN rm jdk-linux-x64.rpm

ENV JAVA_HOME /usr/java/default

RUN cd /tmp; wget --continue --no-check-certificate --header "Cookie: oraclelicense=a" -O jce_policy-8.zip "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"; unzip jce_policy-8.zip

RUN cd /usr/java/default/jre/lib/security; mv -f /tmp/UnlimitedJCEPolicyJDK8/*.jar .; rm -rf /tmp/*	

CMD bash -l