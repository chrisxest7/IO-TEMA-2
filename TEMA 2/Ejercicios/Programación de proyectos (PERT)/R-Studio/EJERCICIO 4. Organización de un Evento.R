activities <- data.frame(
  Activity=c("A","B","C","D"),
  Duration=c(2,3,2,2),
  Predecessor=c("","A","A","B,C")
)

start_times <- c(0,2,2,max(2+3,2+2))
end_times <- start_times + activities$Duration
project_time <- max(end_times)

cat("Duración total del proyecto:", project_time, "días\n")

plot(0,0,xlim=c(0,6),ylim=c(0,6),type="n",main="PERT: Organización de Evento",xlab="",ylab="")
text(1,5,"A (2)")
text(3,4,"B (3)")
text(3,6,"C (2)")
text(5,5,"D (2)")
arrows(1.5,4.8,2.5,4.3,length=0.1)
arrows(1.5,5.2,2.5,5.7,length=0.1)
arrows(3.5,4.3,4.5,4.8,length=0.1)
arrows(3.5,5.7,4.5,5.2,length=0.1)
