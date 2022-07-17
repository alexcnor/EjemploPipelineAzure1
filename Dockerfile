FROM adoptopenjdk:11-jre-openj9

COPY target/helloworld.war /usr/app/

WORKDIR /usr/app

EXPOSE 8091

RUN java -version

ENTRYPOINT ["java", "-XX:+UseG1GC", "-Xmx2g", "-Xms64m", "-Dspring.profiles.active=default", "-war", "helloworld.war", "10"]
