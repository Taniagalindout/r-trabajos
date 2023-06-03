setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
maraton <- read.csv("maraton_ny.csv")
View(maraton)
# Seleccionar una columna individual
maraton$age
maraton$gender
# Fila 3, columna 4
#El primer valor son las filas, el segundo las columnas
# Fila 3, columna 4
maraton[3,4]
# 1o primeras filas, 2 primeras columnas
maraton[1:10, 1:2]
#Todas las  filas, solo columnas 1 y 5
maraton[, c(1,5)]
#, se usa para vacío
# Sola fila 1 y 100, todas las columnas
# Para filtrar valores no consecutivos usar vector
maraton[c(1,100),]
# Para filtrar valores consecutivos no se usa el c y se usan los :
maraton[1:100,]
# Todas las filas, solo columnas 1 y 5
maraton [, c(1,5)]
#Corredores cucyo genero es femenino
# Dentro de los [] se coloca la condicion
View(maraton[maraton$gender=='Female',])

max(maraton$age)
min(maraton$age)
mean(maraton$age)
min(maraton$time)
count(maraton)
??count
View(maraton[,-3])

#Conocer la dimensión de un objeto
dimension <- dim(maraton)
typeof(dimension)
str(dimension)
# Numero de filas
dimension[1]
# Numero de columnas
dimension[2]
dim(maraton)[1]
#Obtener el rank de los valores de una
rank(maraton$time)
# Primer posicion de acuerdo al valor 6=1 8=2 30=3
rank(inventario)

# Obtener key y posicion del elemento MAX o MIN
max(maraton$age)
# En la fila 106 esta el valor maximo
# Which se usa para el índice
which.max(maraton$age)
maraton[106,]
# El menor
which.min(maraton$time)
maraton[765,]
View(maraton)

setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
house_rental <- read.csv("house_rental.csv",
                    header = TRUE,
                    row.names = 1,
                    sep=",",
                    dec = ".")
View(house_rental)

# Cuantas habitaciones tienen las
# propiedades cuyo precio de renta se
# encuentra entre 60000 y 80000
sum(house_rental[house_rental$Price>60000 & house_rental$Price<80000,4])
sum(house_rental[house_rental$Price>=60000 & house_rental$Price<=80000,4])

