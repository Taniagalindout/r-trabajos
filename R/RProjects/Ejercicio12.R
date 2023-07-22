# K-means 
# Es un método de aprendizaje no supervisado que se basa en agrupación por partición
# (partitoning clustering)

# Objetivo: Particionar n objetos en k clusters, donde cada objeto pertenece a un clustaer con 
# la media más cercana

# NOTA: A diferencia de kNN, en K-means no se conoce la clasificación previamente. Por eso
# se llama no supervisado y se cambia el concepto de clasificación por AGRUPAMIENTO

# Este método requiere que se determine previamente el número de clusters

# Para el ejemplo de la clase, usaremos el dataset USArrests
# que contiene información de varios crímenes realizados en ciudades de Estados Unidos

USArrests
View(USArrests)

# 1. Cargar datos del dataset

datosUsa <- USArrests
View(datosUsa)

# 2. Escalar los datos
# Se requiere igual que en kNN
datosUsa <- scale(datosUsa)
datos <- scale(datos[,1:3])
# Si quiero normalizar las primeras tres columnas
# datos <- scale(datos[,1:3])
# datos2 <- scale(datos[,c(2,4)])
# View(datos2)

# Transformación de datos
# Generalización
# Reescalamiento
# Normalización

# 3. Determinar número de clusters
# Existen distintos métodos para calcular el número
# de clusters: Elbow (WSS, Within-cluster sum square), silhoutte, gap_stat, etc.

# En R existen varias librerías con funciones para calcular el número de clusters. Usaremos factoextra
install.packages("factoextra")
library("factoextra")

# Esta librería contiene la función fviz_nbclust que permite calcular la cantidad de clusters utilizando
# métodos distintos. Se requieren 3 parametros

# fviz_nbclust(dataframe, función para agrupamiento, método)
fviz_nbclust(datosUsa, kmeans, method = "wss")

# En wss o Elbow, se elige el nimero de clusters por el valor que se encuentra en el codo de la gráfica
# Aunque la imaginación no ayude, está en el 2
fviz_nbclust(datosUsa, kmeans, method = "silhouette")
fviz_nbclust(datosUsa, kmeans, method = "gap_stat")

# El silhoutte y gap_stat, la cantidad de clusters se marca en la gráfica

# OPCIONAL: En la libería NbClust existe una función con el mismo nombre, que permite calcular la cantidad
# de clusters utilizando múltiples métodos. Está función devuelve la cantidad de clusters que hayan
# arrojado la mayor cantidad de métodos

install.packages("NbClust")
library(NbClust)

# min.nc es la cantidad minima de clusters
# max.nc es la cantidad máxima de clusters
# methond es el algoritmo a utilizar
# index indica que métodos para el cálculo de cantidad de clusters se usarán. alllong es para TODOS los que
# conocen la función
clusters <- NbClust(datosUsa, distance="euclidean",
                    min.nc=2, max.nc=10, method= "kmeans",
                    index="alllong")

# 4. Realizar el agrupamiento
# Una vez determinada la cantidad de clusters, se utiliza la función de kmeans. No se
# requiere cargar una libería, pertenece al core de R. 
# Requiere 2 parametros: kmeans (dataframe, cantidad de clusters)
agrupamiento <- kmeans(datosUsa, 2)
agrupamiento$cluster
# Agrupamiento contiene, entre otras cosas, el cluster al que pertenece cada elemento
# (agrupamiento$cluster)

# Para visualizar los clusters creados, podemos utilizar la función fviz_cluster
# Requiere al menos dos parámetros: el resultado de kmeans y el data frame
fviz_cluster(agrupamiento, data = datosUsa)

# Se pueden añadir opciones adicionales para modificar la visualización de la gráfica
fviz_cluster(agrupamiento, data= datosUsa,
             ellipse.type = "euclid",
             star.plot = TRUE)
fviz_cluster(agrupamiento, data = datosUsa,
             ellipse.type = "norm")
fviz_cluster(agrupamiento, data = datosUsa,
             ellipse.type = "norm",
             palette="Set2", ggtheme = theme_minimal())
# 5. Asignar nombres a los clusters
# Si se analizan los datos de los estados y los niveles de crime, podemos llegar a la
# conclusión de que a un cluster pertenecen los estados "más violentos" y al otro
# los "menos violentos"

# NOTA: Si se quieren agregar los clusters a los datos originales
# basta con realizar lo siguiente:

datosUsa <- USArrests
datosUsa$cluster <- agrupamiento$cluster

View(datosUsa)

# 1 = más violentos, 2 = menos violentos
datosUsa$cluster <- ifelse(datosUsa$cluster==1, "más violentos", "menos violentos")

# EJERCICIO

# Carga los datis del archivo taipei_hotel1.csv
# Este archivo contiene información de hoteles en la ciudad de Taipei: dirección, coordenadas y nombre
# Verificar el agrupamiento del algoritmo con el agrupamiento real
