setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
maraton <- read.csv("maraton_ny.csv")
View(maraton)

#Vectores
a <- c(1,2,3,4,5,6)
a
c <-c ("UNO",2,T, "CUATRO")
c

#Asignacion de una función
assign("z", 4)
z
z<-"h"
z
# Asignación a un tipo de dato
# Funciones para un tipo de dato especifico
r <- numeric(10)
r
c <- character(10)
# Operadores aritmeticos
# + * / -

#Modulo
#En Java 5%2=1
#Eb R %%
5%%2

#dplyr
#Division decimal
10/7
# Division entera
10%/%7

# Operadores lógicos
# > < != == >= <=

#Comparaciones
# En java && ||
# En R & |
x== 3&x<6

#Tipos de dato
# Caracter, numero (double integer)
# Lógico (boolean) complejos, raw

nombre <- 'Hugo'
edad <- 36L # L -> Long
cantidad <- 4
bandera <- TRUE #T o F, 1 o 0
raiz <- 3 +5i
# raw tipos que no estan definidos en R
binario <- raw(2)

#typeof -> Tipo de dato
typeof(nombre)
typeof(edad)
typeof(bandera)
typeof(raiz)
typeof(binario)
#Ayuda busca con signo de ?
?class
# ?? Para buscar más información con esa palabra
??graph

func1 <- function (x, arithmetic=TRUE){
  if(is.character(x) | is.logical(x)){
    print("El argumento no es numerico")
  }else{
    if(arithmetic==TRUE){
      sum(x)/length(x)
    }else{
      prod(x)^(1/length(x))
    }
  }
  return("Hola")
}
resultado <- func1(c(1,2,3), TRUE)


# Rangos
d<- 5:1
d

#Utilizanod la función seq
#Para no incrementar en una unidad, se utiliza by y la cantidad en que quiere incrementar
e <- seq(1,5, by=1.5)
e

#Replicando elementos
# Rango del 2 al 4 replicado 4 veces
f<- rep(2:4, times=4)
f

#Leer desde el teclado con la función Scan
g <- scan()
g

# Asignar encabezado/key a un vector
vector<- c(1,2,3,4)
names(vector)<- c("posicion 1", "posicion 2", "posicion 3", "posicion 4")

#Asignar encabezado/key a un vector
names(c)<- c("posicion 1", "posicion 2", "posicion 3", "posicion 4")

#Mostrar la estructura de un objeto
str(c)

inventario<- c ('Manzana'=30,'Platano'=8,'Sandia'=6)
inventario

#Añadir más elementos a un vector
inventario2 <- c(inventario, 'pera'=10)
inventario2

#Añadir más elementos
# Quita los nombres
invetario3 <- union(inventario,c('pera'=10))
invetario3

# Selección de elementos de un vector
inventario[2]
inventario[1:2]
# Para seleccionar posiciones que no estan continuas
inventario[c(1,3)]
# - es una negación
inventario[-3]
inventario[-(2:3)]
inventario['Manzana']

#Para quitar un elemento especifico
inventario <- inventario[-3]

#Selección por filtrado
inventario
#Posiciones donde el valor sea menor a 10
inventario[inventario<10]
#Posiciones iguales a 6
inventario[inventario ==6]
# in es una condicion de pertenencia muestra los resultados que tengan ese valor
inventario[inventario %in% c(2,3,6,30)]

inventario[inventario %in% 2:30]

#<pais><estado>Morelos</estado></pais>

