# Declaración de variables
price <- 100
precio = 100

if(price<100){
  print("<100")
}else{
  print(">100")
}
quantity <- c(1,1,2,1,2)
quantity
# IF ternario
ifelse(quantity==1, 'Yes', 'No')

# La condición tiene longitud 1 y solo el primer será usado
price<-c(58,100,110)
if(price<100){
  print("<100")
}else if (price==100){
  print("=100")
}else{
  print(">100")
}

#IF normal (all -> Si todos los valores de precio)
price <- c(58,100,110)
if(all(price<100)){
  print("Todos >100")
}

if(any(price<100)){
  print("Alguno <100")
  
}

# Creación de una función
days <- function(x){
  switch(x,
         Mon="Monday",
         Tue="Tuesday",
         Wed="Wednesday",
         Thu="Thursday",
         Fri="Friday",
         "Weekend")
}

days("Mon")
days(5)
days(7)

quantity <- c(1,2,3,4,5)
avg_qty <- function(qty, type){
  switch(type,
         arithmetic = mean(quantity),
         geometric = prod(quantity)^(1/length(quantity)))
}

#mean -> Calcula la media aritmetica
#prod -> promedio

avg_qty(quantity, "arithmetic")
avg_qty(quantity, "geometric")

cart <- c("apple", "cookie", "lemon")
for(product in cart){
  print(product)
}

price_discounted <- c(1)
price <- c(30,120,50,70,150,100,50,25,110)

for(i in 1:length(price)){
  price_discounted[i]<- price[i]-price[i]*0.1
  print(price_discounted[i])
}

#paste es para concatenar
index <- 1
while(index<3){
  print(paste("Index is", index))
  index <- index +1
}

# Ciclos infinitos
# x+1 para incrementar
x <- 1
repeat{
  print(x)
  x <- x +1
  if(x==3){
    break
  }
}

#Trabajar con archivos
#setwd cambia la carpeta en la que estan trabajando a otra carpeta
#header -> Encabezado de las filas
#Row.names -> Nombres de las filas
setwd("C:\\Users\\CC7\\Documents\\Archivos")
maraton <- read.csv("maraton_ny.csv",
                    header = TRUE,
                    row.names = 1,
                    sep=",",
                    dec = ".")
#Tipo de variable
class(maraton)
#Tipos de datos en R
# c -> Vector
# class(TRUE) -> LOGICAL
# class("Hola") -> CARACTER
# class (9) -> NUMERIC
# class (9.0) -> NUMERIC
# MATRIZ ->
# VECTOR ->
# LIST -> 
# DATAFRAME ->
# Conjunto de vectores ordenados en filas

dim(maraton)
# Los nombres de las columnas
names(maraton)
# Estructura de cada columna
str(maraton)
# numero de filas
# Longitud de una columna
nrow(maraton)
#instalar cosas
#separados por coma, todos los paquetes
install.packages("dplyr")
#Decir que lo vamos a usar
library("dplyr")
# Tipos de datos de cada cosa
# Hace lo mismo que str
glimpse(maraton)
# Resumen de las columnas del archivo
summary(maraton)
View(maraton)

#iris
iris
data()
AirPassengers

# Que es una observacion -> Lo equivalente a un registro
# Que es una variable -> Lo equivalente a una columna


# Ver datos de maraton
# View
# ejecutar la variable (maraton)

# Determinada cantidad de observaciones
# Los primeros de arriba (head)
head(maraton)
head(maraton, 3)

# Los ultimos
tail(maraton)
tail(maraton, 3)

install.packages("RWeka")



