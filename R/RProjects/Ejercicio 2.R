install.packages("RWeka")
library("RWeka")
# Leer archivos de RWeka
setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
datos <- read.arff("CEE_DATA.arff")
View(datos)
carros<-mtcars
carros
#1
orden<- order(mtcars['mpg'])
carros [orden,]
#2
ordenar2<- subset(mtcars,cyl %in% c(4,6))
ordenar2
#3
ordenar3<-subset(mtcars,subset = mpg<=20.0)
ordenar3
dataNew<-data.frame(ordenar3)
dataNew
