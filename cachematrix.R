## Compute matrix inversion w/ cache

## Wraps a matrix object to add caching functionalities

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  get <- function()
    x
  
  setInv <- function(m)
    inv <<- m
  
  getInv <- function()
    inv
  
  list(
    get = get,
    setInv = setInv,
    getInv = getInv
  )
}


## Cached version of solve() to compute matrix inversion
## To be used on objects created with makeCacheMatrix()

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if (!is.null(inv)) {
    return(inv)
  }
  
  m <- x$get()
  inv <- solve(m, ...)
  x$setInv(inv)
  inv
}
