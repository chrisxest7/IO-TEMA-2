costs <- matrix(c(3,1,2,
                  4,3,2,
                  8,7,4,
                  6,5,3), nrow=4, byrow=TRUE)
supply <- c(10,20,15,15)
demand <- c(20,25,15)

res <- lp.transport(costs, "min",
                    row.signs=rep("=",4), row.rhs=supply,
                    col.signs=rep("=",3), col.rhs=demand)

cat("✅ EJERCICIO 4 — Matriz de envíos (A1..A4 vs C1..C3):\n")
mat <- matrix(res$solution, nrow=4, byrow=TRUE)
print(mat)
cat("💰 Costo total óptimo:\n")
print(res$objval)

barplot(mat, beside=TRUE, col=c("skyblue","orange","green","pink"),
        names.arg=c("C1","C2","C3"), legend=c("A1","A2","A3","A4"),
        main="EJERCICIO 4: Envíos por cliente", ylab="Unidades")
