FROM maven:3-openjdk-11 AS mbuilder
RUN mkdir /hello
COPY . /hello
WORKDIR /hello
RUN mvn package

FROM tomcat:9-jre11
COPY --from=mbuilder /hello/target/hello-world.war /usr/local/tomcat/webapps/
