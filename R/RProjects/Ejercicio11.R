# Examen

# Regresión lineal (simple, multiple), polinominal

# Carga, Limpieza, y Transformación

# Escalamiento, Normalización, Generalización

# lm y a mano(Excel)

setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
datosEj <- read.csv("ejercicioNuevo.csv",
                  header = TRUE,
                  sep=",",
                  dec = ".")
View(datosEj)

modeloNuevo <- lm(Tamanio.del.cerebro ~ Altura.en.metros,
             data = datosEj)

modeloMultiple <- lm(IQ  ~ Tamanio.del.cerebro + Altura.en.metros,
                      data = datosEj)
iq = 203.066 + 1.251 * Tamano.del.cerebro - 2.935 * Altura.en.metros

summary(modeloMultiple)