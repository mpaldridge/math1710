set.seed(31415)

for(i in 0:99) {
  
  
  n <- round(rnorm(1, 200, 20))
  
  x <- rnorm(n)
  y <- rnorm(n)
  
  m <- sample(n, 1)
  
  x[m] <- rnorm(1, 5, 0.5) * sample(c(-1, 1), 1)
  y[m] <- rnorm(1, 5, 0.5) * sample(c(-1, 1), 1)
  
  
  data <- data.frame(
    x = round(x, 5),
    theotherone = round(y, 5)
  )
  
  if (i < 10) filename <- paste("~/Documents/GitHub/math1710/docs/data/R11-0", i, ".csv", sep = "")
  else        filename <- paste("~/Documents/GitHub/math1710/docs/data/R11-",  i, ".csv", sep = "")
  
  write.csv(data, filename, row.names = FALSE)
}