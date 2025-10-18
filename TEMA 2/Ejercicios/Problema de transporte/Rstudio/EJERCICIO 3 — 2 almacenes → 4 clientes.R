costs <- matrix(c(6,4,3,7,
                  5,8,4,2), nrow=2, byrow=TRUE)
supply <- c(50,30)
demand <- c(20,15,25,20)

res <- lp.transport(costs, "min",
                    row.signs=rep("=",2), row.rhs=supply,
                    col.signs=rep("=",4), col.rhs=demand)

cat("✅ EJERCICIO 3 — Matriz de envíos (A1,A2 vs C1..C4):\n")
mat <- matrix(res$solution, nrow=2, byrow=TRUE)
print(mat)
cat("💰 Costo total óptimo:\n")
print(res$objval)

barplot(mat, beside=TRUE, col=c("skyblue","orange"),
        names.arg=c("C1","C2","C3","C4"), legend=c("A1","A2"),
        main="EJERCICIO 3: Envíos por cliente", ylab="Unidades")
