test.cacheSolve <- function(){
  m <- matrix( rnorm(1000000,mean=0,sd=1), 1000, 1000) 
  res1 <- solve(m)
  
  cm <- makeCacheMatrix(m)
  res2 <- cacheSolve(cm)
  res3 <- cacheSolve(cm)
  
  checkEquals(res1, res2)
  checkEquals(res1, res3)
}