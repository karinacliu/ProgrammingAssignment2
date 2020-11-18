## These two functions combine to cache a matrix and its inverse.

## Given a matrix argument, this function creates a list containing four functions: set the matrix, get the matrix, set the inverse of the matrix, get the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## When used with argument of the form makeCacheMatrix(), this function will return the inverse of the given matrix, either by getting the mean from the cache(if it's already been calculated) or by calculating it.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
