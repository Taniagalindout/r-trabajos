# Algoritmos de aprendizaje supervisado
# Se dividen en 2 tareas: predicción (regresión)
# Y clasificación (k-Nearest Neighboor)

# kNN 
View(iris)
datos <- iris
View(datos)

# Verificar que el data set sea un data frame
class(datos)
# datos <- as.data.frame(datos)

#Verificar que la columna de clasificación
#sea un vector

# Verificar que la colummna de clasificación sea un factor
class(datos$Species)
# datos$Species <- as.factor(datos$Species) para convertir a un factor

#Los algoritmos de clasificación son sensibles a los cambios de magnitud de las variables
# Normalizacion para homogeneidad en las columnas
# ES NECESARIO escalar
# datos$Sepal.Length
# <- scale(datos$Sepal.Length)

datos[,1:4] <- scale(datos[,1:4])
View(datos)

# 80/20, 70/30
# Si tienes un data set 150 observaciones
# 120 observaciones de entrenamiento
# 30 observaciones de prueba
#Floor para redondear
#Contar la cantidad de observaciones y multiplicarlas por 0.8
tam_train <- floor(0.8*nrow(datos)) #120

# Extraer la cantidad de elemnentios calculada (120) del conjunto de datos original
# Funcion sample: obtiene una muestra: algunos elementos aleatoria de un conjunto de datoos
# Funcion seq_len: generar enteros desde 1 hasta que indiques
# Generar una secuencia de enteros del 1 al 150
secuencia <- seq_len(nrow(datos))
class(secuencia)
# Elige 120 numeros de la secuencia de manera aleatoria
indices_train <- sample(secuencia, size = tam_train)
# El data set de entrenamiento y prueba no deben contener la columna de clasificación
datos_train <- datos[indices_train, 1:4] #80%
datos_test <- datos[-indices_train,1:4]#20% devuelve todas lads filas que no sean las de arriba
clase_train <- datos[indices_train,5]
clase_test <- datos[-indices_train,5]

dim(datos_train)
class(clase_train)

# Columnas discontinuas
# datos2$district <- factor(datos2$district)

# Se crea el modelo de clasificación con la función knn
# de la liberia class
install.packages("class")
library("class")
# Conjunto de entrenamiento
# Conjunto de prueba
# Clasificación del conjunto de entrenamiento
# El valor de j (cuantos vecinos)
# k = cantidad de observaciones / 2 X
# k = sqrt(cantidad de observaciones)
# k se recomienda impar

# El resultado de ejecutar knn es la clasificación de valores de entrenamiento
clasificacion <- knn (datos_train,
                      datos_test,
                      clase_train,
                      k=sqrt(nrow(datos)))
# Almacenar los datos de prueba con la clasificación del algoritmo
datos_test_clasificacion <- datos_test
datos_test_clasificacion$Clase <- clasificacion
View(datos_test_clasificacion)


install.packages("ggplot2")
library(ggplot2)

ggplot(datos_test_clasificacion,
       aes(x=Sepal.Length, y=Sepal.Width,
           color = Clase, fill=Clase))+
  geom_point(size=7)+
  geom_text(aes(label=Clase))+
  theme(legend.position = "none")

# Matriz de confusión 
# Tabla de todos contra todos
tab <- table(clasificacion, clase_test)
diag(tab)
rowSums(tab)

# val.clasificados correctamente / total val.
# accuracy / precisión
# Calcular el valor de valores clasificados entre
# el total de valores calcula
accuracy <- function(tabla){
  sum(diag(tabla)/sum(rowSums(tabla)))*100
}
accuracy(tab)

