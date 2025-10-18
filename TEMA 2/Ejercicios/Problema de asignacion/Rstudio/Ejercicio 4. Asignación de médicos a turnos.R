library(lpSolve)

# Matriz de costos
costos <- matrix(c(3,6,5,
                   4,3,7,
                   5,4,2),
                 nrow=3, byrow=TRUE)

# Resolver el problema de asignación
sol <- lp.assign(costos)

# Mostrar resultados en consola
cat("Matriz de asignación óptima:\n")
print(sol$solution)
cat("\nCosto total mínimo:\n")
print(sol$objval)

# Gráfico
barplot(costos, beside=TRUE,
        names.arg=c("T1","T2","T3"),
        col=c("tomato","lightblue","lightgreen"),
        main="Horas extra por turno",
        legend.text=c("D1","D2","D3"))
