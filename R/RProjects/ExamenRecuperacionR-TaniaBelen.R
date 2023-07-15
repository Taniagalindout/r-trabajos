# Carga los datos del archivo AB_NYC_2019.csv.
setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
datosNYOrigin <- read.csv("AB_NYC_2019.csv",
                  header = TRUE,
                  sep=",",
                  dec = ".")

datosNYTest<- read.csv("AB_NYC_2019.csv",
                       header = TRUE,
                       sep=",",
                       dec = ".")

datosNYTest$last_review <- ifelse(datosNYTest$last_review =="", NA, datosNYTest$last_review)
datosNYTest$reviews_per_month <- ifelse(datosNYTest$reviews_per_month =="", NA, datosNYTest$reviews_per_month)

View(datosNYOrigin)
View(datosNYTest)

# ¿Cuántas observaciones cuentan con valores vacíos?
length(is.na(datosNYTest))
#Respuesta =782320

# Elimina las observaciones que cuenten con valores vacíos.
datosNYTest <- na.omit(datosNYTest)

# Con el data set original, llena los valores vacíos de las columnas last_review con moda y review_per_month con promedio.
library("modeest")
datosNYOrigin$last_review<-ifelse(is.na(datosNYOrigin$last_review) | datosNYOrigin$last_review=="" ,mfv(datosNYOrigin$last_review, na_rm=TRUE),datosNYOrigin$last_review)
datosNYOrigin$reviews_per_month<-ifelse(is.na(datosNYOrigin$reviews_per_month),mean(datosNYOrigin$reviews_per_month,na.rm = TRUE),datosNYOrigin$reviews_per_month)

# ¿Cuántos valores atípicos tiene la columna number_of_reviews?
ati<-length(boxplot.stats(datosNYOrigin$number_of_reviews)$out)
# Respuesta = 6021

#   ¿Cuántas propiedades existen por cada neighbourhood?


# ¿Cuántos y cuáles room_types existen?
# Cuales
#Entire home/apt
#Private room
#Shared room
room <- factor(datosNYOrigin$room_type)
# Cuantas
# 3
nlevels(room)
#   ¿Cuántas propiedades existen con precios de renta entre 5000 y 7500?
propiedades<-sum(datosNYOrigin$price>=5000 & datosNYOrigin<=7500)
#230
#   EXTRA: Con base en el precio de renta, crea una columna nueva llamada precio que asigne una categoria (caro, medio, económico) a cada propiedad.