activities <- data.frame(
  Activity=c("A","B","C","D"),
  Duration=c(4,5,3,2),
  Predecessor=c("","A","A","B,C")
)

start_times <- c(0,4,4,max(4+5,4+3))
end_times <- start_times + activities$Duration
project_time <- max(end_times)

cat("Duración total del proyecto:", project_time, "días\n")

plot(0,0,xlim=c(0,7),ylim=c(0,7),type="n",main="PERT: Página Web",xlab="",ylab="")
text(1,6,"A (4)")
text(3,5,"B (5)")
text(3,7,"C (3)")
text(5,6,"D (2)")
arrows(1.5,5.8,2.5,5.3,length=0.1)
arrows(1.5,6.2,2.5,6.7,length=0.1)
arrows(3.5,5.3,4.5,5.8,length=0.1)
arrows(3.5,6.7,4.5,6.2,length=0.1)
