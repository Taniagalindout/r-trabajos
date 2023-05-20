# Crear un vector llamado calificaciones. Llenalo con valores correspondientes a tus promedios cuatrimestrales
calificaciones <- c(9,8,10,10,10)
calificaciones
promedio = prod(calificaciones)^(1/length(calificaciones))
resultado
suma = sum(calificaciones)
suma
media = mean(calificaciones)
media

# Crea una función que permita el volumen de un prisma
#La funcion debe recibir el tipo de prisma y los valores del área de la base y la altura
# Al menos, la función debe calcular el volumen de 3 prismas

volumen <- function(a,h, type){
  switch(type,
          prismaTriangular=((a)/2)*h,
          prismaRectangular = (a)*h,
          circular = (a)*h
         )
}
volumen(5,9, "prismaTriangular")
volumen(4,8, "prismaRectangular")
#3.1416*(3^2)
volumen(4,8, "circular")