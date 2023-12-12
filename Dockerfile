FROM ubuntu:18.04
RUN sudo apt update

#устанавливаем GIT
RUN sudo apt install git -y

#устанавливаем JAVA
RUN sudo apt install default-jdk -y

#устанавливаем компилятор JAVA
RUN sudo apt install maven -y

#устанавливаем APACHE TOMCAT
RUN sudo apt install tomcat9 -y


###################################################


#клонируем репозиторий в папку ./boxfuse-sample-java-war-hello
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

#компилируем проект
cd boxfuse-sample-java-war-hello
mvn package
#перемещаем готовый WAR-файл в папку TOMCAT (переименовывая его)
RUN sudo mv ./target/hello-1.0.war /var/lib/tomcat9/webapps/hello.war
#поскольку служба tomcat9 запущена, то WAR-файл тут же будет развёрнут в приложение
#и сразу же доступна страничка по адресу http://84.201.133.81:8080/hello

#объявим порт, не забыть пробросить
EXPOSE 8080/tcp

