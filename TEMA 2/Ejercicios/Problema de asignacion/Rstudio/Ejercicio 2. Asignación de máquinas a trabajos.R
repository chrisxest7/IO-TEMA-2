library(lpSolve)

# Matriz de costos
costos <- matrix(c(4,2,5,9,
                   6,4,3,7,
                   5,8,1,8,
                   7,6,9,4),
                 nrow=4, byrow=TRUE)

# Resolver el problema de asignación
sol <- lp.assign(costos)

# Mostrar resultados en consola
cat("Matriz de asignación óptima:\n")
print(sol$solution)
cat("\nCosto total mínimo:\n")
print(sol$objval)

# Gráfico
barplot(costos, beside=TRUE,
        names.arg=c("J1","J2","J3","J4"),
        main="Tiempo de asignación",
        legend.text=c("M1","M2","M3","M4"),
        col=rainbow(4))
