for(i in 0:99) {
  
  set.seed(i)
  
  randoms <- runif(1000)
  x <- which(randoms > 0.9)
  
  n <- length(x)
  pmf_x <- rep(1, n)
  
  while(sum(pmf_x) > 1) {
    try <- rnorm(n)^2
    try <- try / sum(try)
    pmf_x <- round(try, digits = 4)
  }
  
  pmf_x[n] <- round(pmf_x[n] + 1 - sum(pmf_x), digits = 4)
  
  if(sum(pmf_x) != 1) print(sum(pmf_x))
  
  hello <- data.frame(x, pmf_x)
  
  if (i < 10) filename <- paste("~/Documents/GitHub/math1710/docs/data/R9-0", i, ".csv", sep = "")
  else        filename <- paste("~/Documents/GitHub/math1710/docs/data/R9-",  i, ".csv", sep = "")
  
  write.csv(hello, filename, row.names = FALSE)
}

