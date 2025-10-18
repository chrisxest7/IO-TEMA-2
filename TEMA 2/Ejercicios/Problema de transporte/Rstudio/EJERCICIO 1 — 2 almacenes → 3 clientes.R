library(lpSolve)

# Datos
costs <- matrix(c(4,6,8,
                  5,4,3), nrow=2, byrow=TRUE)
supply <- c(30,40)
demand <- c(20,25,25)

# Resolver transporte
res <- lp.transport(costs, "min",
                    row.signs = rep("=",2), row.rhs = supply,
                    col.signs = rep("=",3), col.rhs = demand)

# Mostrar matriz y costo
cat("Matriz de envíos (A1,A2 vs C1,C2,C3):\n")
mat <- matrix(res$solution, nrow=2, byrow=TRUE)
print(mat)
cat("Costo total óptimo:\n")
print(res$objval)

# Gráfico simple
barplot(mat, beside=TRUE, col=c("skyblue","orange"),
        names.arg=c("C1","C2","C3"), legend=c("A1","A2"),
        main="Envíos por cliente", ylab="Unidades")

