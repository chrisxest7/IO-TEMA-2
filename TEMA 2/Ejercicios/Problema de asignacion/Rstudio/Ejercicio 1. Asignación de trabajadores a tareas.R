# Instalar si no lo tienes
# install.packages("lpSolve")
library(lpSolve)

# Matriz de costos
costos <- matrix(c(8,7,3,
                   2,5,5,
                   7,8,2), 
                 nrow=3, byrow=TRUE)

# Resolver problema
sol <- lp.assign(costos)

# Mostrar resultados en consola
cat("Matriz de asignación óptima:\n")
print(sol$solution)
cat("\nCosto total mínimo:\n")
print(sol$objval)

# Gráfico
barplot(costos, beside=TRUE, 
        names.arg=c("Tarea 1","Tarea 2","Tarea 3"),
        col=c("skyblue","lightgreen","pink"),
        main="Costos de asignación",
        legend.text=c("A","B","C"))
