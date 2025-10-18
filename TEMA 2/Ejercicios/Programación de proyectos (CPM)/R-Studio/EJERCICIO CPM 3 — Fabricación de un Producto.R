
activities <- data.frame(
  id = 1:5,
  name = c("A","B","C","D","E"),
  duration = c(2,3,4,2,3),
  stringsAsFactors = FALSE
)
predList <- list(integer(0), 1L, 1L, 2L, c(3L,4L))

# Topological
remaining <- activities$id; order <- integer(0); preds <- predList
while(length(remaining)>0){
  can <- sapply(remaining, function(n) all(preds[[n]] %in% order))
  n <- remaining[which(can)[1]]
  order <- c(order, n)
  remaining <- setdiff(remaining, n)
}

# Forward
ES <- numeric(nrow(activities)); EF <- numeric(nrow(activities))
for(i in order){
  ES[i] <- if(length(preds[[i]])==0) 0 else max(EF[preds[[i]]])
  EF[i] <- ES[i] + activities$duration[i]
}
project_time <- max(EF)

# Successors
succs <- lapply(activities$id, function(x) integer(0))
for(i in activities$id) for(p in preds[[i]]) succs[[p]] <- c(succs[[p]], i)

# Backward
LF <- rep(project_time, nrow(activities)); LS <- numeric(nrow(activities))
for(i in rev(order)){
  LF[i] <- if(length(succs[[i]])==0) project_time else min(LS[succs[[i]]])
  LS[i] <- LF[i] - activities$duration[i]
}
Slack <- LS - ES

res <- data.frame(Activity=activities$id, Name=activities$name, Duration=activities$duration,
                  ES=ES,EF=EF,LS=LS,LF=LF,Slack=Slack)
print(res, row.names=FALSE)
cat("Project duration:", project_time, "days\n")
crit <- res$Activity[res$Slack==0]; crit_ordered <- crit[order(res$ES[res$Activity %in% crit])]
cat("Critical path:", paste(crit_ordered, collapse=" -> "), "\n")

# Plot
plot(0,0,type="n", xlim=c(0, project_time+1), ylim=c(0.5, nrow(activities)+0.5),
     xlab="Time (days)", ylab="Activity ID", main="CPM - Manufacturing")
for(i in activities$id){
  y <- i
  rect(ES[i], y-0.2, EF[i], y+0.2)
  text((ES[i]+EF[i])/2, y, paste(activities$name[i], "\n", activities$duration[i]), cex=0.8)
  for(p in preds[[i]]) arrows(ES[p]+activities$duration[p], p, ES[i], i, length=0.08)
}
