costs <- matrix(c(2,3,1,
                  5,4,8,
                  5,6,3), nrow=3, byrow=TRUE)
supply <- c(20,30,25)
demand <- c(25,30,20)

res <- lp.transport(costs, "min",
                    row.signs = rep("=",3), row.rhs = supply,
                    col.signs = rep("=",3), col.rhs = demand)

cat("✅ EJERCICIO 2 — Matriz de envíos (A1,A2,A3 vs C1,C2,C3):\n")
mat <- matrix(res$solution, nrow=3, byrow=TRUE)
print(mat)
cat("💰 Costo total óptimo:\n")
print(res$objval)

barplot(mat, beside=TRUE, col=c("skyblue","orange","green"),
        names.arg=c("C1","C2","C3"), legend=c("A1","A2","A3"),
        main="EJERCICIO 2: Envíos por cliente", ylab="Unidades")
