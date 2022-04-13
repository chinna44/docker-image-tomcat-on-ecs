FROM centos:7
MAINTAINER giridhar
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
COPY ./index.html /opt/tomcat/webapps/ROOT/
COPY ./target/giridhar.war /opt/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT  ["/opt/tomcat/bin/catalina.sh", "run"]
