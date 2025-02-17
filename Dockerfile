# Fase de compilación: utiliza una imagen de Maven con JDK 21 para compilar la aplicación
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

# Fase de ejecución: utiliza una imagen de OpenJDK 21 para ejecutar la aplicación
FROM eclipse-temurin:21-jre

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR construido desde la imagen de compilación
COPY --from=builder /app/target/valentine-0.0.1-SNAPSHOT.jar valentine-0.0.1-SNAPSHOT.jar

# Expone el puerto 8080
EXPOSE 8080

# Comando por defecto para ejecutar la aplicación
CMD ["java", "-jar", "valentine-0.0.1-SNAPSHOT.jar"]
