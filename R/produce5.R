n <- 200

for(i in 0:99) {
  
  unit <- i %% 10
  if (unit == 0) unit <- 10
  
  set.seed(i)
  
  mu <- cbind(5:14, 5:14+rnorm(10, 2, 0.4))
  
  alpha <- rnorm(n, mu[unit, 1], 1)
  beta  <- rnorm(n, mu[unit, 2], 1)
  
  sigma <- sample(c(0.1, 0.2, 0.3, 3, 5, 7), 1)
  
  gamma <- alpha
  delta <- rnorm(n, mu[unit, 1]+rnorm(1, 0.5, 2), sigma)
  
  epsilon <- rnorm(n, 10 + rnorm(1), 1)
  zeta    <- rnorm(n, 10 + rnorm(1), 1)
  out <- c(sample(2, 1), sample(n, 1), sample (2,1))
  
  if (out[1] == 1) epsilon[out[2]] <- mean(epsilon) + 6*(2*out[3] - 3)
  else             zeta[out[2]] <- mean(zeta) + 6*(2*out[3] - 3)
  
  
  peaks <- i %% 3
  
  if (peaks == 0)      eta <- rnorm(n, 10, 2)
  else if (peaks == 1) eta <- c(rnorm(n*0.4, 8, 0.8), rnorm(n*0.6, 13.5, 1.3))
  else if (peaks == 2) eta <- c(rnorm(n*0.3, 8, 0.8), rnorm(n*0.5, 13.5, 1.3), rnorm(n*0.2, 18.5, 0.4))
  
  theta <- 10*runif(n)
  iota  <- (2*(i %% 2) - 1)*(theta - 5)^2 + 10 + rnorm(n, 0, 3.5)
  
  data <- data.frame(
    alpha   = alpha,
    beta    = beta,
    gamma   = gamma,
    delta   = delta,
    epsilon = epsilon,
    zeta    = zeta,
    eta     = eta,
    theta   = theta,
    iota    = iota
  )
  
  if (i < 10) filename <- paste("~/Documents/GitHub/math1710/docs/data/R5-0", i, ".csv", sep = "")
  else        filename <- paste("~/Documents/GitHub/math1710/docs/data/R5-",  i, ".csv", sep = "")
  
  write.csv(data, filename, row.names = FALSE)
}

