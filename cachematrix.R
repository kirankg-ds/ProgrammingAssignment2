## This is an exmaple of creating a cache function for potentially time-consuming computations.
## There are two main functions - one to create the cache, the other to create the (in this example) and inverse of a matrix (get if from cache if available, otherwise, compute the inverse)

## Create a cache - define four functions: get & set a matrix, get & set it's inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## To compute the inverse of a matrix m, use solve(m)
## First, check if the inverse is already calculated and stored in the cache.
## If so, use it, otherwise compute it and store it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
      message("getting cached inverse")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinv(inv)
    inv
}
