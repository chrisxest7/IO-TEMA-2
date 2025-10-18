library(lpSolve)

# Matriz de costos
costos <- matrix(c(6,4,7,
                   5,3,8,
                   7,6,5),
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
        names.arg=c("Z1","Z2","Z3"),
        col=c("orange","cyan","purple"),
        main="Costo por vendedor",
        legend.text=c("V1","V2","V3"))
