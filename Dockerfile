FROM adoptopenjdk:11-jre-openj9

COPY target/:jarName.jar /usr/app/

WORKDIR /usr/app

EXPOSE 8091

RUN java -version

ENTRYPOINT ["java", "-XX:+UseG1GC", "-Xmx2g", "-Xms64m", "-Dspring.profiles.active=default", "-jar", ":jarName.jar", "10"]
