activities <- data.frame(
  Activity=c("A","B","C","D","E"),
  Duration=c(3,4,3,2,3),
  Predecessor=c("","A","A","B","C,D")
)

start_times <- c(0,3,3,7,max(3+3,7+2))
end_times <- start_times + activities$Duration
project_time <- max(end_times)

cat("Duración total del proyecto:", project_time, "días\n")

plot(0,0,xlim=c(0,9),ylim=c(0,9),type="n",main="PERT: Construcción Casa",xlab="",ylab="")
text(1,8,"A (3)")
text(3,7,"B (4)")
text(3,9,"C (3)")
text(5,6,"D (2)")
text(7,7,"E (3)")
arrows(1.5,7.8,2.5,7.3,length=0.1)
arrows(1.5,8.2,2.5,8.7,length=0.1)
arrows(3.5,7.3,4.5,6.3,length=0.1)
arrows(3.5,8.7,6.5,7.3,length=0.1)
arrows(5.5,6.3,6.5,7.0,length=0.1)
