costs <- matrix(c(2,3,1,4,
                  5,2,6,3,
                  3,4,2,5), nrow=3, byrow=TRUE)
supply <- c(30,20,25)
demand <- c(20,10,30,15)

res <- lp.transport(costs, "min",
                    row.signs=rep("=",3), row.rhs=supply,
                    col.signs=rep("=",4), col.rhs=demand)

cat("✅ EJERCICIO 5 — Matriz de envíos (A1..A3 vs C1..C4):\n")
mat <- matrix(res$solution, nrow=3, byrow=TRUE)
print(mat)
cat("💰 Costo total óptimo:\n")
print(res$objval)

barplot(mat, beside=TRUE, col=c("skyblue","orange","green"),
        names.arg=c("C1","C2","C3","C4"), legend=c("A1","A2","A3"),
        main="EJERCICIO 5: Envíos por cliente", ylab="Unidades")
