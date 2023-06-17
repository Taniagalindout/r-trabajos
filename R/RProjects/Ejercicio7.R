#Generalización
#En edades ej: 18 o -18, Niño, adolescente, adulto
#Reescaliemto reducir la complejidad de los resultados (Columnas con muchisimos datos)
#[0.5 - 0.5]
#Normalización
#Mientras más grande el numero, mayor importancia al algoritmo
#Equivalencia de dos columnas con rangos diferentes
#Smoothing
# Remueve datos que generan ruido

# --------- Generalización
setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
maraton <- read.csv("maraton_ny.csv",
                    header = TRUE,
                    row.names = 1,
                    sep=",",
                    dec = ".")
View(maraton)
#Crear nueva columna
#3 partes iguales
# cut -> orden ascendente
maraton$nivel <- cut(maraton$time, breaks = 3,
                     labels = c("alto", "medio", "bajo"))
View(maraton)

# -------------- Rscalamiento
# Formula
install.packages("scales")
library(scales)

setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
data_conv <- read.csv("data-conversion.csv")
(data_conv$Age-min(data_conv$Age))/(max(data_conv$Age)-min(data_conv$Age))

rescale(data_conv$Age)

# ----------------- Normalización

setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
salary <- read.csv("salary.csv")
grafica<-scale(salary[,c(1,2)])
#Plot para escalas
plot(grafica)
plot(salary)
#Años
plot(grafica[,1])
plot(grafica[,2])

# ----------------Smoothing
install.packages("modelbased")
library(modelbased)
# Funcion seno (seq- numeros de 0 a 4pi, genera 100 valores), rnorm son valores de la distribucion normal
x <- sin(seq(0,4*pi, length.out=100))+rnorm(100,0,0.2)
plot(x, type="l")
# Agregar cosas a plot con las lineas que colocas
# La funcion lines, permite agregar lineas a la grafica
#La linea suaviza los valores quebrados
lines(smoothing(x,method="smooth"),type="l", col="blue")
lines(smoothing(x,method="loess"),type="l", col="red")