## Ejercicio 6 
setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
contaminacion <- read.csv("contaminacion.csv",
                  header = TRUE,
                  sep=",",
                  dec = ".")
View(contaminacion)
# Celdas vacias
is.na(contaminacion)
# Filas llenas true, filas vacias false
complete.cases(contaminacion)
# Omite las filas con valores vacíos
# Completamente llenos
na.omit(contaminacion)
#Con alguna celda vacía
contaminacion[!complete.cases(contaminacion),]
# conta[1,2] primer fila, segunda columna

#Mice
install.packages("mice")
library("mice")
# Patron de los registros
# Muestra las columnas vacias
# 19 filas donde todas las columnas son llenas
# 4 filas, donde la columna CN esta vacía
# Un registro donde la columna SO2 esta vacía

md.pattern(contaminacion)
md.pattern(maraton)
# duplicated datos duplicados
duplicated(contaminacion)

# Verifar el dataframe limpio

# Ver los datos vacíos

# Borrar registro duplicado
contaminacion[!duplicated(contaminacion),]

#data imputation
#Llenar los datos vacíos
# Promedio
sum(contaminacion$CN)
# Operacion sobre una columna o un data frame
#Remove vacios, ejecuta la suma sobre los valores que no estan vacios
sum(contaminacion$CN, na.rm = TRUE)
contaminacion$CN_P <- ifelse(is.na(contaminacion$CN),
                            mean(contaminacion$CN, na.rm = TRUE),
                            contaminacion$CN)
#Moda
install.packages("modeest")
library("modeest")
mfv(contaminacion)
b <- data.frame(v1=c("a","b","c","d"), v2=c("hola", "hola", NA, "adios"))
b$v2_moda <- ifelse(is.na(b$v2), mfv(b$v2, na_rm=TRUE), b$v2)
# Moda no valores numericos
# Promedio para numeros

#Vecinos cercanos
# knnImputation
#paquete DMwR

install.packages("DMwR")
library(DMwR2)
#knn rellena los datos con NA

kcontaminacion <- knnImputation(contaminacion)
kcontaminacion

rivers

# La funcion plot se usa para graficar
plot(rivers)

# Mediana es el punto máximo
boxplot(rivers)
boxplot(rivers, horizontal=TRUE)

boxplot.stats(rivers)
stats <- (boxplot.stats(rivers)$stats)
inferior <- (stats[1])
superior <- (stats[5])

nuevo <-rivers[rivers<superior & rivers>inferior]
plot(nuevo)
boxplot(nuevo)

# Eliminar outliers del arreglo rivers de manera automática
variable <- boxplot.stats(rivers)
nuevo <- rivers # Limpia los outliers
while(length(variable$out)>0){ # Calcula longitud
  #Calcular inferior
  inferior <- variable$stats[1]
  # Calcular superior
  
  superior <- variable$stats[5]
  nuevo <- nuevo [nuevo < superior & nuevo > inferior]
  
  variable <- boxplot.stats(nuevo)
  
}
boxplot(nuevo)