activities <- data.frame(
  Activity=c("A","B","C","D","E"),
  Duration=c(2,3,4,2,3),
  Predecessor=c("","A","A","B","C,D")
)

start_times <- c(0,2,2,5,max(2+4,5+2))
end_times <- start_times + activities$Duration
project_time <- max(end_times)

cat("Duración total del proyecto:", project_time, "días\n")

plot(0,0,xlim=c(0,8),ylim=c(0,8),type="n",main="PERT: Fabricación de Producto",xlab="",ylab="")
text(1,7,"A (2)")
text(3,6,"B (3)")
text(3,8,"C (4)")
text(5,5,"D (2)")
text(7,6,"E (3)")
arrows(1.5,6.8,2.5,6.3,length=0.1)
arrows(1.5,7.2,2.5,7.7,length=0.1)
arrows(3.5,6.3,4.5,5.3,length=0.1)
arrows(3.5,7.7,6.5,6.3,length=0.1)
arrows(5.5,5.3,6.5,6.0,length=0.1)
