FROM ubuntu:22.04
RUN apt update

#устанавливаем GIT
RUN apt install git -y

#устанавливаем JAVA
RUN apt install default-jdk -y
###RUN apt install openjdk-17-jdk -y

#устанавливаем компилятор JAVA
RUN apt install maven -y

#устанавливаем APACHE TOMCAT
RUN apt install tomcat9 -y


###################################################


#клонируем репозиторий в папку /tmp/boxfuse-sample-java-war-hello
RUN cd /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

#компилируем проект
RUN cd /tmp/boxfuse-sample-java-war-hello
RUN mvn package
#перемещаем готовый WAR-файл в папку TOMCAT (переименовывая его)
RUN mv /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/hello.war
#поскольку служба tomcat9 запущена, то WAR-файл тут же будет развёрнут в приложение
#и сразу же доступна страничка по адресу http://84.201.133.81:8080/hello

#объявим порт, не забыть пробросить
EXPOSE 8080/tcp
