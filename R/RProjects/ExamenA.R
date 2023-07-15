library(MASS)
data("Boston")
#a) Dividir el conjunto de datos en dos, 80% para entrenamiento y 
#20% para pruebas (5 puntos) 
modelo <- lm(medv ~ ., data = datos_entrenamiento)
set.seed(123)  
train_index <- sample(1:nrow(Boston), 0.8 * nrow(Boston))
train_data <- Boston[train_index, ]  # Datos de entrenamiento
test_data <- Boston[-train_index, ]  # Datos de prueba

#b) Entrenar y evaluar el modelo. (10 puntos)
model <- lm(medv ~ ., data = train_data)
predictions <- predict(model, newdata = test_data)
mse <- mean((predictions - test_data$medv)^2)  # Error cuadrático medio

#c) Graficar el modelo con valores reales vs valores predichos y la línea de referencia. (5 puntos)
plot(test_data$medv, predictions, xlab = "Valores reales", ylab = "Valores predichos", main = "Valores reales vs. Valores predichos")
abline(0, 1, col = "red")  # Línea de referencia



library(mlbench)
library(caret)
data(BreastCancer)
data<-na.omit(BreastCancer)
set.seed(42)
head(data)
# a) Dividir el conjunto de datos en conjunto de entrenamiento y conjunto de prueba. (5 puntos) 
train_index <- sample(1:nrow(data), 0.7 * nrow(data))
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Definir el modelo de KNN
knn_model <- train(Class ~., data = train_data, method = "knn")

# Predecir las clases en el conjunto de prueba
predictions <- predict(knn_model, newdata = test_data)
pred
# Evaluar el rendimiento utilizando métricas (por ejemplo, matriz de confusión y exactitud)
confusion_matrix <- confusionMatrix(predictions, test_data$Class)
accuracy <- confusion_matrix$overall['Accuracy']

# Realizar una validación cruzada con diferentes valores de k
k_values <- 1:10
cv_results <- sapply(k_values, function(k) {
  knn_model <- train(Class ~ ., data = train_data, method = "knn", tuneGrid = data.frame(k = k))
  predictions <- predict(knn_model, newdata = test_data)
  confusion_matrix <- confusionMatrix(predictions, test_data$Class)
  accuracy <- confusion_matrix$overall['Accuracy']
  return(accuracy)
})
d) Entrenar un modelo de árbol de decisión utilizando el conjunto de datos de entrenamiento y visualizar el árbol resultante:
  
  R
Copy code
# Cargar la librería rpart
library(rpart)

# Entrenar el modelo de árbol de decisión
tree_model <- rpart(Class ~ ., data = train_data)

# Visualizar el árbol resultante
plot(tree_model)
text(tree_model)
e) Utilizar el algoritmo SVM, clasificar el conjunto de datos de prueba y evaluar el rendimiento del modelo utilizando la matriz de confusión:
  
  R
Copy code
# Cargar la librería e1071
library(e1071)

# Entrenar el modelo SVM
svm_model <- svm(Class ~ ., data = train_data)

# Clasificar el conjunto de datos de prueba
svm_predictions <- predict(svm_model, newdata = test_data)

# Evaluar el rendimiento utilizando la matriz de confusión
svm_confusion <- table(svm_predictions, test_data$Class)



















