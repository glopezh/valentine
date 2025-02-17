# Usamos la imagen de Maven con JDK 21 para construcción y ejecución
FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Autor
LABEL authors="geraldinelopez"

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo pom.xml para descargar las dependencias
COPY pom.xml .

# Descarga las dependencias del proyecto
RUN mvn dependency:go-offline

# Copia los archivos del proyecto al contenedor
COPY src ./src

# Limpiar antes de compilar y compilar
RUN mvn clean package

# Exponer el puerto 8080
EXPOSE 8080

# Comando por defecto para ejecutar la aplicación con Maven
CMD ["mvn", "spring-boot:run"]
