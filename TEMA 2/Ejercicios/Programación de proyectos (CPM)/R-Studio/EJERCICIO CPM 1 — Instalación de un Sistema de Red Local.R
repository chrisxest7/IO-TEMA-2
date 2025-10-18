# CPM Exercise 1 - Network installation
activities <- data.frame(
  id = 1:4,
  name = c("A","B","C","D"),
  duration = c(3,2,4,3),
  stringsAsFactors = FALSE
)
predList <- list(
  integer(0), # 1
  1L,         # 2
  1L,         # 3
  c(2L,3L)    # 4
)

# Topological order (simple)
remaining <- activities$id
order <- integer(0)
preds <- predList
while(length(remaining)>0){
  # find nodes whose predecessors are all in order (or none)
  can <- sapply(remaining, function(n) all(preds[[n]] %in% order))
  n <- remaining[which(can)[1]]
  order <- c(order, n)
  remaining <- setdiff(remaining, n)
}

# Forward pass
ES <- numeric(nrow(activities)); EF <- numeric(nrow(activities))
for(i in order){
  if(length(preds[[i]])==0){
    ES[i] <- 0
  } else {
    ES[i] <- max(EF[preds[[i]]])
  }
  EF[i] <- ES[i] + activities$duration[i]
}

project_time <- max(EF)

# Build successors list
succs <- lapply(activities$id, function(x) integer(0))
for(i in activities$id){
  for(p in preds[[i]]){
    succs[[p]] <- c(succs[[p]], i)
  }
}

# Backward pass
LF <- rep(project_time, nrow(activities)); LS <- numeric(nrow(activities))
rev_order <- rev(order)
for(i in rev_order){
  if(length(succs[[i]])==0){
    LF[i] <- project_time
  } else {
    LF[i] <- min(LS[succs[[i]]])
  }
  LS[i] <- LF[i] - activities$duration[i]
}

Slack <- LS - ES

# Print table
res <- data.frame(
  Activity = activities$id,
  Name = activities$name,
  Duration = activities$duration,
  ES = ES, EF = EF, LS = LS, LF = LF, Slack = Slack
)
print(res, row.names=FALSE)
cat("Project duration:", project_time, "days\n")

# Critical path (activities with slack 0 ordered by ES)
crit <- res$Activity[res$Slack==0]
crit_ordered <- crit[order(res$ES[res$Activity %in% crit])]
cat("Critical path:", paste(crit_ordered, collapse=" -> "), "\n")

# Simple plot (x = ES, y = id)
plot(0,0,type="n", xlim=c(0, project_time+1), ylim=c(0.5, nrow(activities)+0.5),
     xlab="Time (days)", ylab="Activity ID", main="CPM - Network installation")
for(i in activities$id){
  y <- i
  rect(ES[i], y-0.2, EF[i], y+0.2)
  text((ES[i]+EF[i])/2, y, paste(activities$name[i], "\n", activities$duration[i]), cex=0.8)
  # draw arrows from predecessors to this
  for(p in preds[[i]]){
    arrows(ES[p]+activities$duration[p], p, ES[i], i, length=0.08)
  }
}
