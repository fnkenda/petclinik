FROM anapsix/alpine-java 
LABEL maintainer="florent.nkenda@gmail.com"
COPY /target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /home/spring-petclinic-1.5.1.jar 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
