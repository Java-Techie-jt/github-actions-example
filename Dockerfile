FROM openjdk:8
EXPOSE 8080
ADD target/springboot-autoimage.jar springboot-autoimage.jar
ENTRYPOINT ["java","-jar","/springboot-images-new.jar"]