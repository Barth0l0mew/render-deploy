#FROM ubuntu:latest
#LABEL authors="Bartholomew"
#
#ENTRYPOINT ["top", "-b"]
# Используйте официальный образ OpenJDK 21 как базовый
#FROM openjdk:21-jdk-slim as build
#
## Установите рабочую директорию
#WORKDIR /app
#
## Скопируйте файл сборки (например, pom.xml или build.gradle) в текущую директорию
#COPY pom.xml .
#
## Скачиваем зависимости (первый шаг сборки)
##RUN ./mvnw dependency:go-offline
#
## Копируем остальные файлы проекта
#COPY src ./src
#
## Собрать приложение
#RUN ./mvnw package -DskipTests

# Переключаемся на меньший образ для запуска
FROM openjdk:21-jdk-slim

# Установите рабочую директорию для приложения
#WORKDIR /app

# Скопируйте jar файл из образа сборки
COPY target/*.jar app.jar

# Укажите команду для запуска приложения
ENTRYPOINT ["java", "-jar", "app.jar"]

# Укажите порт, который ваше приложение будет использовать
EXPOSE 8080