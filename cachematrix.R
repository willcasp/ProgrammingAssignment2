## This function creates a special "matrix" object that can cache its inverse
##    reused code from the example makeVector code.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL

  ##   updateMatrix - updates the matrix
  updateMatrix <- function(y) {
    x <<- y
    m <<- NULL
  }

  ##   get - gets the matrix
  get <- function() x

  ##   updateMatrixInverse - creates the cached matrix
  updateMatrixInverse <- function(inverse) m <<- inverse

  ##   getInverse - gets the cached matrix
  getInverse <- function() m

  list(updateMatrix = updateMatrix, get = get,
       updateMatrixInverse = updateMatrixInverse,
       getInverse = getInverse)
}


## This funciton computes the inverse of the special "matrix" returned by makeCacheMatrix
##   If the inverse has already been calculated, it will retrieve the inverse from cache
##   Much of this code is a re-hash of the cachemean example. Just had to swap out inversing
##   for the existing cachemean.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()

  ## m is not null, inversion exists, grab from cache
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ## calculate and return inversion
  data <- x$get()
  m <- solve(data, ...)
  x$updateMatrixInverse(m)
  m

}
