FROM centos:7

MAINTAINER Sean Burns <seanjburns@gmail.com>

RUN yum install -y wget unzip tar && yum clean all

RUN wget --continue --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm"
 
RUN yum localinstall -y jdk-linux-x64.rpm

RUN rm jdk-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
 
RUN cd /tmp; wget --continue --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -O jce_policy-8.zip "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"; unzip jce_policy-8.zip

RUN cd /usr/java/default/jre/lib/security; mv -f /tmp/UnlimitedJCEPolicyJDK8/*.jar .; rm -rf /tmp/*	

CMD bash -l