test.cacheSolve <- function(){
  m <- matrix( rnorm(1000000,mean=0,sd=1), 1000, 1000) 
  res1 <- solve(m)
  
  cm <- makeCacheMatrix(m)
  res2 <- cacheSolve(cm)
  res3 <- cacheSolve(cm)
  
  # Test results are all the same
  checkEquals(res1, res2)
  checkEquals(res1, res3)
  
  # Check the second call hits cache and is actually faster than solve()
  tWOCache <- system.time(solve(m))
  tWCache  <- system.time(cacheSolve(cm))
  
  checkTrue(tWOCache["elapsed"] > tWCache["elapsed"])
}
