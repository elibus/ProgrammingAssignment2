## Compute matrix inversion w/ cache

## Wraps a matrix object to add caching functionalities

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  get <- function()
    x
  setInv <- function(inv)
    m <<- inv
  getInv <- function()
    m
  list(
    set = set, 
    get = get,
    setInv = setInv,
    getInv = getInv
  )
}


## Cached version of solve() to compute matrix inversion
## To be used on objects created with makeCacheMatrix()

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInv()
  if (!is.null(m)) {
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInv(m)
  m
}
