#Seteo el ambiente a cero
rm (list=ls())

#Cargo libreria lpSolve
library(lpSolve)

# Problema: maximizar
# 16   x1 + 24   x2 sujeto a
#  0.4 x1 +  1   x2 <= 200
#  0   x1 +  0.5 x2 <= 200
#  4   x1 -  1   x2 <=   0  
#      x1 +  0   x2 >=  10

#Coeficientes de la variable de decision
f.obj <- c(16, 24)

#Matriz de restricciones
f.con <- matrix (c(0.4, 1, 0, 0.5, 4, -1, 1, 0),
                 nrow=4, 
                 byrow=TRUE)

#Direccion de las restricciones
f.dir <- c("<=", "<=", "<=", ">=")

#Vector de recursos
f.rhs <- c(200, 200, 0, 10)

#Busco los valores que maximizan el funcional
lp ("max", f.obj, f.con, f.dir, f.rhs)$solution

#Busco el valor del funcional
lp ("max", f.obj, f.con, f.dir, f.rhs)

# Los primeros cuatro valores son sobre las variables slacks, y los ultimos dos sobre las fuertes
x<- lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals     

#Valores marginales
x[c(1:4)]

#Costos de oportunidad
x[c(5:6)]


