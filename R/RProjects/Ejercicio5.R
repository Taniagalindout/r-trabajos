secuencia <- (20:50)
promediosecuencia = mean(secuencia)
sum(secuencia)

# Ejercicio 2
 vectora <- c(1,2,3)
 vectorb <- c(4,5,6)
 vectorc <- c(7,8,9)
 #rbind y cbind para combinar vectores
 matriz <- rbind(vectora, vectorb, vectorc)
 #matriz
 matriz2 <- matrix(c(vectora, vectorb,vectorc),
                   nrow = 3, ncol = 3,
                   byrow = TRUE,
                   dimnames = list(
                     c("row1","row2","row3"),
                     c("C.1", "C.2", "C.3")))
 # Ejercicio 3
 setwd("C:\\Users\\CC7\\ArchivosP\\r-trabajos\\R\\RProjects")
 pizza <- read.csv("pizzaplace.csv",
                          header = TRUE,
                          row.names = 1,
                          sep=",",
                          dec = ".")
 View(pizza)
 
# a. Indica cuantos tipos de pizza se venden
 tipos <- factor(pizza$type)
 nlevels(tipos)
# b. ¿Cuál es la pizza con el precio más caro?
 max(pizza$price)
 which.max(pizza$price)
 pizza[which.max(pizza$price),4]
# c. ¿Cuál es el tamaño de la pizza que vende menos?
 install.packages("dplyr")
 library("dplyr")
 # SELECT size, COUNT(*) FROM pizza GROUP BY size;
 pizza %>% count(size)
 # arrange para ordenar (mayor a menor)
 (pizza %>% count(size)%>% arrange(n))[1,"size"]
(pizza %>% count(size)%>% arrange(n))[1,1]
 View((pizza %>% count(size)%>% arrange(n)))
# Muestra solamente las ventas de la pizza
 #Dplyr
 
 View(pizza %>% filter(size=="L"
                       & as.Date(date)>= '2015-03-01'
                       & as.Date(date)<='2015-04-30'))
 #Sin dplyr
 pizza[pizza$size == "L" & substr(pizza$date,6,7)=="03"
       | substr(pizza$date,6,7)=="04",]
 # Ventas en agosto
 #dplyr
resultadoPizza <- pizza %>% filter(as.Date(date)>= '2015-08-01'&
                    as.Date(date)<= '2015-08-31')%>% select(name, size)
 View(resultadoPizza)
 
 #sin dplyr
 pizza [pizza$date >='2015-08-01' & pizza$date <= '2015-08-31',c(5,6)]
 # f. ¿Cuál es el horario de atención de la pizzeria?
 # min-max
 minimo <- min(pizza$time)
 maximo <- max(pizza$time)
 print(paste(minimo,"-",maximo))
 
 