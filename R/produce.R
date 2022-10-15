for(i in 0:99) {
  
  set.seed(i)
  
  mu <- rnorm(1, 70, 8)
  sigma <- rexp(1, 0.2)
  
  n <- 25 + rpois(1, 225)
  
  amaflix <- rnorm(n, mu, sigma)
  
  switch <- sample(c(1,2,3), 1)
  
  if (switch == 1) {
    a <- 0.2 + rexp(1, 1)
    netazon <- a * amaflix + rnorm(n, 4, sigma*0.1)
  } else if (switch == 2) {
    a <- rexp(1, 1)
    netazon <- -a * (amaflix - mu) + mu + rnorm(n, 4, sigma*0.05)
  } else if (switch == 3) {
    b <- rexp(1, 0.1)
    netazon <- rnorm(n, mu + 4, b) 
  }
  
  amaflix <- abs(round(amaflix, digits = 2))
  netazon <- abs(round(netazon, digits = 2))

  data <- data.frame(amaflix = amaflix, netazon = netazon)
  
  if (i < 10) filename <- paste("~/Documents/GitHub/math1710/docs/data/R3-0", i, ".csv", sep = "")
  else        filename <- paste("~/Documents/GitHub/math1710/docs/data/R3-",  i, ".csv", sep = "")
  
  write.csv(data, filename, row.names = FALSE)
}

