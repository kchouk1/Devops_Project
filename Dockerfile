FROM openjdk:8-jdk-alpine
RUN apk --no-cache add curl
RUN curl -u admin:nexus -o ExamThourayaS2-0.0.1-SNAPSHOT.jar "http://192.168.1.10:8081/repository/maven-releases/com/esprit/examen/ExamThourayaS2/0.0.1-SNAPSHOT/ExamThourayaS2-0.0.1-SNAPSHOT.jar" -L
ENTRYPOINT java -jar /ExamThourayaS2-0.0.1-SNAPSHOT.jar
EXPOSE 8083
