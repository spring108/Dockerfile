#11.0.0-M15-jdk21-temurin-jammy, 11.0.0-jdk21-temurin-jammy, 11.0-jdk21-temurin-jammy, 11.0.0-M15-jdk21-temurin, 11.0.0-jdk21-temurin, 11.0-jdk21-temurin, 11.0.0-M15-jdk21, 11.0.0-jdk21, 11.0-jdk21, 11.0.0-M15, 11.0.0, 11.0

FROM tomcat:11.0-jdk21

#FROM tomcat:9.0.80-jdk21-openjdk-bookworm
#FROM ubuntu:22.04

RUN apt update

#устанавливаем GIT
RUN apt install git -y

#устанавливаем JAVA
#RUN apt install default-jdk -y
###RUN apt install openjdk-17-jdk -y

#устанавливаем компилятор JAVA
RUN apt install maven -y

###################################################

#клонируем репозиторий в папку /tmp/boxfuse-sample-java-war-hello
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

#компилируем проект
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package


#перенос артефакта
#перемещаем готовый WAR-файл в папку TOMCAT (переименовывая его)
RUN mv /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/hello.war

