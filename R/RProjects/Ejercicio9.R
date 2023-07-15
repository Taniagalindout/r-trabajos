setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
datos <- read.csv("resistencia.csv",
                          header = TRUE,
                          sep=",",
                          dec = ".")
View(datos)

#19b0 +138b1+1335b2 = 649.5
#138b0+1335b1+14935.5b2=5306.6
#1335b0+14935.5b1+181427b2+51666.75

?solve
# coeficientes a la izquiera del =
a<- matrix(c(19,138,1335,
             138,1335, 14935.5,
             1335, 14935.5,181427), nrow = 3)
# coeficientes a la izquiera del =
b <- matrix(c(649.5, 5306.6, 51666.75), nrow = 3)

solve(a,b)

#          [,1]
#[1,] -6.6755591
#[2,] 11.7644938
#[3,] -0.6345802

# y = -6.6755591 + 11.7644938*x - 0.6345802*x^2

# lineal model (lm)
# formula (dep izq, ind der), datos
# y = b0+b1*x
# y = resistencia, x=concentración
modelo <- lm(resistencia ~ concentracion,
             data = datos)
# Call:
# lm(formula= resistencia~concentracion, data =datos)


setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
marketing <- read.csv("marketing.csv",
                  header = TRUE,
                  sep=",",
                  dec = ".")
marketing <- marketing[1:12,1:3]
View(marketing)
# Multiple
modelomarketing <- lm(Sales ~ Spend+Month,
             data = marketing)
# Elevar una variable independiente a un grado
modelo <- lm(resistencia ~ concentracion +
                  I(concentracion^2)
                ,data = datos)
#Grado 3 con lm
modelo <- lm(resistencia ~ concentracion +
                  I(concentracion^2) + I(concentracion^3)
                ,data = datos)
#Predict para predecir nuevos valores

prediccion <- predict(modelo, data.frame(concentracion=c(16,17)))