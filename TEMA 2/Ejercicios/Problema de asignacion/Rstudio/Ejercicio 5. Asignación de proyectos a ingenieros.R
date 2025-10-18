library(lpSolve)

# Matriz de costos
costos <- matrix(c(7,5,6,4,
                   5,6,7,3,
                   6,4,5,7,
                   4,7,3,6),
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
        names.arg=c("P1","P2","P3","P4"),
        main="Dificultad por ingeniero",
        col=terrain.colors(4),
        legend.text=c("E1","E2","E3","E4"))
