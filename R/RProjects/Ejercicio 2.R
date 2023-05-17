install.packages("RWeka")
library("RWeka")
# Leer archivos de RWeka
setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
datos <- read.arff("CEE_DATA.arff")
View(datos)