# Actividades y tiempos
activities <- data.frame(
  Activity = c("A", "B", "C", "D"),
  Duration = c(3, 2, 4, 3),
  Predecessor = c("", "A", "A", "B,C")
)

# Calcular tiempos de inicio y fin (simplificado)
start_times <- c(0, 3, 3, max(3+2, 3+4))
end_times <- start_times + activities$Duration
project_time <- max(end_times)

# Mostrar resultados
cat("Duración total del proyecto:", project_time, "días\n")

# Graficar PERT
plot(0,0, xlim=c(0,6), ylim=c(0,6), type="n", xlab="", ylab="", main="PERT: Instalación Red Local")
text(1,5,"A (3)")
text(3,4,"B (2)")
text(3,6,"C (4)")
text(5,5,"D (3)")
arrows(1.5,4.8,2.5,4.3,length=0.1)
arrows(1.5,5.2,2.5,5.7,length=0.1)
arrows(3.5,4.3,4.5,4.8,length=0.1)
arrows(3.5,5.7,4.5,5.2,length=0.1)
